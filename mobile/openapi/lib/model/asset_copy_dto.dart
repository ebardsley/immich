//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AssetCopyDto {
  /// Returns a new [AssetCopyDto] instance.
  AssetCopyDto({
    this.albums,
    this.metadata,
    this.sharedLinks,
    required this.to,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? albums;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? metadata;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? sharedLinks;

  String to;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AssetCopyDto &&
    other.albums == albums &&
    other.metadata == metadata &&
    other.sharedLinks == sharedLinks &&
    other.to == to;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (albums == null ? 0 : albums!.hashCode) +
    (metadata == null ? 0 : metadata!.hashCode) +
    (sharedLinks == null ? 0 : sharedLinks!.hashCode) +
    (to.hashCode);

  @override
  String toString() => 'AssetCopyDto[albums=$albums, metadata=$metadata, sharedLinks=$sharedLinks, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.albums != null) {
      json[r'albums'] = this.albums;
    } else {
    //  json[r'albums'] = null;
    }
    if (this.metadata != null) {
      json[r'metadata'] = this.metadata;
    } else {
    //  json[r'metadata'] = null;
    }
    if (this.sharedLinks != null) {
      json[r'sharedLinks'] = this.sharedLinks;
    } else {
    //  json[r'sharedLinks'] = null;
    }
      json[r'to'] = this.to;
    return json;
  }

  /// Returns a new [AssetCopyDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AssetCopyDto? fromJson(dynamic value) {
    upgradeDto(value, "AssetCopyDto");
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return AssetCopyDto(
        albums: mapValueOfType<bool>(json, r'albums'),
        metadata: mapValueOfType<bool>(json, r'metadata'),
        sharedLinks: mapValueOfType<bool>(json, r'sharedLinks'),
        to: mapValueOfType<String>(json, r'to')!,
      );
    }
    return null;
  }

  static List<AssetCopyDto> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssetCopyDto>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssetCopyDto.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AssetCopyDto> mapFromJson(dynamic json) {
    final map = <String, AssetCopyDto>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AssetCopyDto.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AssetCopyDto-objects as value to a dart map
  static Map<String, List<AssetCopyDto>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AssetCopyDto>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AssetCopyDto.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'to',
  };
}

