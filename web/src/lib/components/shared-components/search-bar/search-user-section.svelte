<script lang="ts">
  import Combobox from '$lib/components/shared-components/combobox.svelte';
  import { searchUsers, type UserResponseDto } from '@immich/sdk';
  import { onMount } from 'svelte';
  import { t } from 'svelte-i18n';

  interface Props {
    selectedId: string | null;
  }

  let { selectedId = $bindable() }: Props = $props();

  let allUsers: UserResponseDto[] = $state([]);
  let selectedOption = $state(undefined);

  onMount(async () => {
    allUsers = await searchUsers();
  });
</script>

<div id="sharedby-selection">
  <div class="my-4 flex flex-col gap-2">
    <div class="[&_label]:uppercase">
      <Combobox
        onSelect={(option) => {selectedOption = option; selectedId = option.id}}
        label={$t('shared_by')}
        options={allUsers.map((user) => ({ id: user.id, label: user.name, value: user.id }))}
        bind:selectedOption
        placeholder={$t('search_filter_people_title')}
      />
    </div>
  </div>
</div>
