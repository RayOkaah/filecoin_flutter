part of FilecoinStorage.client;

class UnauthorizedErrorResponse {
  /// Returns a new [UnauthorizedErrorResponse] instance.
  UnauthorizedErrorResponse({
    this.name = 'HTTP Error',
    this.message = 'Unauthorized',
  });

  String name;

  String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnauthorizedErrorResponse &&
          other.name == name &&
          other.message == message;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (message.hashCode);

  @override
  String toString() =>
      'UnauthorizedErrorResponse[name=$name, message=$message]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'name'] = name;
    _json[r'message'] = message;
    return _json;
  }

  /// Returns a new [UnauthorizedErrorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UnauthorizedErrorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "UnauthorizedErrorResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "UnauthorizedErrorResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UnauthorizedErrorResponse(
        name: mapValueOfType<String>(json, r'name') ?? 'HTTP Error',
        message: mapValueOfType<String>(json, r'message') ?? 'Unauthorized',
      );
    }
    return null;
  }

  static List<UnauthorizedErrorResponse>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <UnauthorizedErrorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UnauthorizedErrorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UnauthorizedErrorResponse> mapFromJson(dynamic json) {
    final map = <String, UnauthorizedErrorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UnauthorizedErrorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UnauthorizedErrorResponse-objects as value to a dart map
  static Map<String, List<UnauthorizedErrorResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<UnauthorizedErrorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UnauthorizedErrorResponse.listFromJson(
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
