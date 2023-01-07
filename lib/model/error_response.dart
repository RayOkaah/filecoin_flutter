part of FilecoinStorage.client;

class ErrorResponse {
  /// Returns a new [ErrorResponse] instance.
  ErrorResponse({
    this.name,
    this.message,
  });

  String? name;

  String? message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorResponse && other.name == name && other.message == message;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name == null ? 0 : name!.hashCode) +
      (message == null ? 0 : message!.hashCode);

  @override
  String toString() => 'ErrorResponse[name=$name, message=$message]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (name != null) {
      _json[r'name'] = name;
    }
    if (message != null) {
      _json[r'message'] = message;
    }
    return _json;
  }

  /// Returns a new [ErrorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ErrorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ErrorResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ErrorResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ErrorResponse(
        name: mapValueOfType<String>(json, r'name'),
        message: mapValueOfType<String>(json, r'message'),
      );
    }
    return null;
  }

  static List<ErrorResponse>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ErrorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ErrorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ErrorResponse> mapFromJson(dynamic json) {
    final map = <String, ErrorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ErrorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ErrorResponse-objects as value to a dart map
  static Map<String, List<ErrorResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ErrorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ErrorResponse.listFromJson(
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
