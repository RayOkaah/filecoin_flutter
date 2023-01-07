part of FilecoinStorage.client;

class UploadResponse {
  /// Returns a new [UploadResponse] instance.
  UploadResponse({
    this.cid,
  });

  /// Self-describing content-addressed identifiers for distributed systems. Check the [CID (Content IDentifier) Specification](https://github.com/multiformats/cid) for more info.

  String? cid;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UploadResponse && other.cid == cid;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cid == null ? 0 : cid!.hashCode);

  @override
  String toString() => 'UploadResponse[cid=$cid]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cid != null) {
      _json[r'cid'] = cid;
    }
    return _json;
  }

  /// Returns a new [UploadResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UploadResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UploadResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UploadResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UploadResponse(
        cid: mapValueOfType<String>(json, r'cid'),
      );
    }
    return null;
  }

  static List<UploadResponse>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UploadResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UploadResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UploadResponse> mapFromJson(dynamic json) {
    final map = <String, UploadResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UploadResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UploadResponse-objects as value to a dart map
  static Map<String, List<UploadResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UploadResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UploadResponse.listFromJson(
          entry.value,
          growable: growable,
        );
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
