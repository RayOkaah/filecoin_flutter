part of FilecoinStorage.client;

class ForbiddenErrorResponse {
  /// Returns a new [ForbiddenErrorResponse] instance.
  ForbiddenErrorResponse({
    this.name = 'HTTP Error',
    this.message,
  });

  String name;

  ForbiddenErrorResponseMessageEnum? message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForbiddenErrorResponse &&
          other.name == name &&
          other.message == message;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (name.hashCode) + (message == null ? 0 : message!.hashCode);

  @override
  String toString() => 'ForbiddenErrorResponse[name=$name, message=$message]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    _json[r'name'] = name;
    if (message != null) {
      _json[r'message'] = message;
    }
    return _json;
  }

  /// Returns a new [ForbiddenErrorResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ForbiddenErrorResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "ForbiddenErrorResponse[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "ForbiddenErrorResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ForbiddenErrorResponse(
        name: mapValueOfType<String>(json, r'name') ?? 'HTTP Error',
        message: ForbiddenErrorResponseMessageEnum.fromJson(json[r'message']),
      );
    }
    return null;
  }

  static List<ForbiddenErrorResponse>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ForbiddenErrorResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ForbiddenErrorResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ForbiddenErrorResponse> mapFromJson(dynamic json) {
    final map = <String, ForbiddenErrorResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ForbiddenErrorResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ForbiddenErrorResponse-objects as value to a dart map
  static Map<String, List<ForbiddenErrorResponse>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<ForbiddenErrorResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ForbiddenErrorResponse.listFromJson(
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

class ForbiddenErrorResponseMessageEnum {
  /// Instantiate a new enum with the provided [value].
  const ForbiddenErrorResponseMessageEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const tokenIsNotValid =
      ForbiddenErrorResponseMessageEnum._(r'Token is not valid');
  static const sessionExpired =
      ForbiddenErrorResponseMessageEnum._(r'Session expired');

  /// List of all possible values in this [enum][ForbiddenErrorResponseMessageEnum].
  static const values = <ForbiddenErrorResponseMessageEnum>[
    tokenIsNotValid,
    sessionExpired,
  ];

  static ForbiddenErrorResponseMessageEnum? fromJson(dynamic value) =>
      ForbiddenErrorResponseMessageEnumTypeTransformer().decode(value);

  static List<ForbiddenErrorResponseMessageEnum>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <ForbiddenErrorResponseMessageEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ForbiddenErrorResponseMessageEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ForbiddenErrorResponseMessageEnum] to String,
/// and [decode] dynamic data back to [ForbiddenErrorResponseMessageEnum].
class ForbiddenErrorResponseMessageEnumTypeTransformer {
  factory ForbiddenErrorResponseMessageEnumTypeTransformer() =>
      _instance ??= const ForbiddenErrorResponseMessageEnumTypeTransformer._();

  const ForbiddenErrorResponseMessageEnumTypeTransformer._();

  String encode(ForbiddenErrorResponseMessageEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a ForbiddenErrorResponseMessageEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ForbiddenErrorResponseMessageEnum? decode(dynamic data,
      {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Token is not valid':
          return ForbiddenErrorResponseMessageEnum.tokenIsNotValid;
        case r'Session expired':
          return ForbiddenErrorResponseMessageEnum.sessionExpired;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ForbiddenErrorResponseMessageEnumTypeTransformer] instance.
  static ForbiddenErrorResponseMessageEnumTypeTransformer? _instance;
}
