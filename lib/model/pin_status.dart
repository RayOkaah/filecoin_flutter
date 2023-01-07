part of FilecoinStorage.client;

class PinStatus {
  /// Instantiate a new enum with the provided [value].
  const PinStatus._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const pinQueued = PinStatus._(r'PinQueued');
  static const pinning = PinStatus._(r'Pinning');
  static const pinned = PinStatus._(r'Pinned');

  /// List of all possible values in this [enum][PinStatus].
  static const values = <PinStatus>[
    pinQueued,
    pinning,
    pinned,
  ];

  static PinStatus? fromJson(dynamic value) =>
      PinStatusTypeTransformer().decode(value);

  static List<PinStatus>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <PinStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PinStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PinStatus] to String,
/// and [decode] dynamic data back to [PinStatus].
class PinStatusTypeTransformer {
  factory PinStatusTypeTransformer() =>
      _instance ??= const PinStatusTypeTransformer._();

  const PinStatusTypeTransformer._();

  String encode(PinStatus data) => data.value;

  /// Decodes a [dynamic value][data] to a PinStatus.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PinStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'PinQueued':
          return PinStatus.pinQueued;
        case r'Pinning':
          return PinStatus.pinning;
        case r'Pinned':
          return PinStatus.pinned;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [PinStatusTypeTransformer] instance.
  static PinStatusTypeTransformer? _instance;
}
