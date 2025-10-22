import { Kysely } from 'kysely';
import { JobName } from 'src/enum';
import { AccessRepository } from 'src/repositories/access.repository';
import { AlbumRepository } from 'src/repositories/album.repository';
import { AssetRepository } from 'src/repositories/asset.repository';
import { JobRepository } from 'src/repositories/job.repository';
import { LoggingRepository } from 'src/repositories/logging.repository';
import { SharedLinkAssetRepository } from 'src/repositories/shared-link-asset.repository';
import { StorageRepository } from 'src/repositories/storage.repository';
import { DB } from 'src/schema';
import { AssetService } from 'src/services/asset.service';
import { newMediumService } from 'test/medium.factory';
import { factory } from 'test/small.factory';
import { getKyselyDB } from 'test/utils';

let defaultDatabase: Kysely<DB>;

const setup = (db?: Kysely<DB>) => {
  return newMediumService(AssetService, {
    database: db || defaultDatabase,
    real: [AssetRepository, AlbumRepository, AccessRepository, SharedLinkAssetRepository],
    mock: [LoggingRepository, JobRepository, StorageRepository],
  });
};

beforeAll(async () => {
  defaultDatabase = await getKyselyDB();
});

describe(AssetService.name, () => {
  describe('getStatistics', () => {
    it('should return stats as numbers, not strings', async () => {
      const { sut, ctx } = setup();
      const { user } = await ctx.newUser();
      const { asset } = await ctx.newAsset({ ownerId: user.id });
      await ctx.newExif({ assetId: asset.id, fileSizeInByte: 12_345 });
      const auth = factory.auth({ user: { id: user.id } });
      await expect(sut.getStatistics(auth, {})).resolves.toEqual({ images: 1, total: 1, videos: 0 });
    });
  });

  describe('copy', () => {
    it('should copy asset data', async () => {
      const { sut, ctx } = setup();
      ctx.getMock(StorageRepository).copyFile.mockResolvedValue();
      ctx.getMock(JobRepository).queue.mockResolvedValue();
      const { user } = await ctx.newUser();
      const { asset: oldAsset } = await ctx.newAsset({ ownerId: user.id, sidecarPath: '/path/to/my/sidecar.xmp' });
      const { asset: newAsset } = await ctx.newAsset({ ownerId: user.id });

      const { album } = await ctx.newAlbum({ ownerId: user.id });
      await ctx.newAlbumAsset({ albumId: album.id, assetId: oldAsset.id });

      const auth = factory.auth({ user: { id: user.id } });

      await sut.copy(auth, oldAsset.id, { to: newAsset.id });

      expect(ctx.getMock(StorageRepository).copyFile).toHaveBeenCalledWith(
        '/path/to/my/sidecar.xmp',
        `${newAsset.originalPath}.xmp`,
      );

      expect(ctx.getMock(JobRepository).queue).toHaveBeenCalledWith({
        name: JobName.AssetExtractMetadata,
        data: { id: newAsset.id },
      });
    });
  });
});
