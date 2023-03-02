part of FilecoinStorage.client;

class Deal {
  /// Returns a new [Deal] instance.
  Deal({
    this.dealId,
    this.storageProvider,
    required this.status,
    this.pieceCid,
    this.dataCid,
    this.dataModelSelector,
    this.activation,
    required this.created,
    required this.updated,
  });

  /// On-chain ID of the deal.
  num? dealId;

  /// Address of the provider storing this data.
  String? storageProvider;

  /// Current deal status.
  DealStatusEnum status;

  /// Filecoin [Piece CID](https://spec.filecoin.io/systems/filecoin_files/piece/) of the data in the deal.
  String? pieceCid;

  /// CID of the data aggregated in this deal.
  String? dataCid;

  /// Selector for extracting stored data from the aggregated data root.
  String? dataModelSelector;

  /// Date when the deal will become active in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
  String? activation;

  /// Creation date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
  String created;

  /// Updated date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
  String updated;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Deal &&
              other.dealId == dealId &&
              other.storageProvider == storageProvider &&
              other.status == status &&
              other.pieceCid == pieceCid &&
              other.dataCid == dataCid &&
              other.dataModelSelector == dataModelSelector &&
              other.activation == activation &&
              other.created == created &&
              other.updated == updated;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
  (dealId == null ? 0 : dealId!.hashCode) +
      (storageProvider == null ? 0 : storageProvider!.hashCode) +
      (status.hashCode) +
      (pieceCid == null ? 0 : pieceCid!.hashCode) +
      (dataCid == null ? 0 : dataCid!.hashCode) +
      (dataModelSelector == null ? 0 : dataModelSelector!.hashCode) +
      (activation == null ? 0 : activation!.hashCode) +
      (created.hashCode) +
      (updated.hashCode);

  @override
  String toString() =>
      'dealId=$dealId, storageProvider=$storageProvider, status=$status, pieceCid=$pieceCid, dataCid=$dataCid, dataModelSelector=$dataModelSelector, activation=$activation, created=$created, updated=$updated';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (dealId != null) {
      _json[r'dealId'] = dealId;
    }
    if (storageProvider != null) {
      _json[r'storageProvider'] = storageProvider;
    }
    _json[r'status'] = status;
    if (pieceCid != null) {
      _json[r'pieceCid'] = pieceCid;
    }
    if (dataCid != null) {
      _json[r'dataCid'] = dataCid;
    }
    if (dataModelSelector != null) {
      _json[r'dataModelSelector'] = dataModelSelector;
    }
    if (activation != null) {
      _json[r'activation'] = activation;
    }
    _json[r'created'] = created;
    _json[r'updated'] = updated;
    return _json;
  }

  /// Returns a new [Deal] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Deal? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
          'Required key "Deal[$key]" is missing from JSON.');
          assert(json[key] != null,
          'Required key "Deal[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Deal(
        dealId: json[r'dealId'] == null
            ? null
            : num.parse(json[r'dealId'].toString()),
        storageProvider: mapValueOfType<String>(json, r'storageProvider'),
        status: DealStatusEnum.fromJson(json[r'status'])!,
        pieceCid: mapValueOfType<String>(json, r'pieceCid'),
        dataCid: mapValueOfType<String>(json, r'dataCid'),
        dataModelSelector: mapValueOfType<String>(json, r'dataModelSelector'),
        activation: mapValueOfType<String>(json, r'activation'),
        created: mapValueOfType<String>(json, r'created')!,
        updated: mapValueOfType<String>(json, r'updated')!,
      );
    }
    return null;
  }

  static List<Deal>? listFromJson(
      dynamic json, {
        bool growable = false,
      }) {
    final result = <Deal>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Deal.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Deal> mapFromJson(dynamic json) {
    final map = <String, Deal>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Deal.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Deal-objects as value to a dart map
  static Map<String, List<Deal>> mapListFromJson(
      dynamic json, {
        bool growable = false,
      }) {
    final map = <String, List<Deal>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Deal.listFromJson(
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
  static const requiredKeys = <String>{
    'status',
    'created',
    'updated',
  };
}

/// Current deal status.
class DealStatusEnum {
  /// Instantiate a new enum with the provided [value].
  const DealStatusEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const queued = DealStatusEnum._(r'Queued');
  static const published = DealStatusEnum._(r'Published');
  static const active = DealStatusEnum._(r'Active');

  /// List of all possible values in this [enum][DealStatusEnum].
  static const values = <DealStatusEnum>[
    queued,
    published,
    active,
  ];

  static DealStatusEnum? fromJson(dynamic value) =>
      DealStatusEnumTypeTransformer().decode(value);

  static List<DealStatusEnum>? listFromJson(
      dynamic json, {
        bool growable = false,
      }) {
    final result = <DealStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DealStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DealStatusEnum] to String,
/// and [decode] dynamic data back to [DealStatusEnum].
class DealStatusEnumTypeTransformer {
  factory DealStatusEnumTypeTransformer() =>
      _instance ??= const DealStatusEnumTypeTransformer._();

  const DealStatusEnumTypeTransformer._();

  String encode(DealStatusEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a DealStatusEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DealStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data.toString()) {
        case r'Queued':
          return DealStatusEnum.queued;
        case r'Published':
          return DealStatusEnum.published;
        case r'Active':
          return DealStatusEnum.active;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [DealStatusEnumTypeTransformer] instance.
  static DealStatusEnumTypeTransformer? _instance;
}