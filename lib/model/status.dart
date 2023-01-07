part of FilecoinStorage.client;

class Status {
  /// Returns a new [Status] instance.
  Status({
    this.cid,
    this.dagSize = 132614,
    this.created,
    this.pins = const [],
    this.deals = const [],
  });

  /// Self-describing content-addressed identifiers for distributed systems. Check the [CID (Content IDentifier) Specification](https://github.com/multiformats/cid) for more info.

  String? cid;

  /// Total size of the DAG in bytes.
  num dagSize;

  /// This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ.

  DateTime? created;

  List<Pin> pins;

  List<Deal> deals;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Status &&
          other.cid == cid &&
          other.dagSize == dagSize &&
          other.created == created &&
          other.pins == pins &&
          other.deals == deals;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (cid == null ? 0 : cid!.hashCode) +
      (dagSize.hashCode) +
      (created == null ? 0 : created!.hashCode) +
      (pins.hashCode) +
      (deals.hashCode);

  @override
  String toString() =>
      'Status[cid=$cid, dagSize=$dagSize, created=$created, pins=$pins, deals=$deals]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (cid != null) {
      _json[r'cid'] = cid;
    }
    _json[r'dagSize'] = dagSize;
    if (created != null) {
      _json[r'created'] = created!.toUtc().toIso8601String();
    }
    _json[r'pins'] = pins;
    _json[r'deals'] = deals;
    return _json;
  }

  /// Returns a new [Status] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Status? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Status[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Status[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Status(
        cid: mapValueOfType<String>(json, r'cid'),
        dagSize: json[r'dagSize'] == null
            ? 132614
            : num.parse(json[r'dagSize'].toString()),
        created: mapDateTime(json, r'created', ''),
        pins: Pin.listFromJson(json[r'pins']) ?? const [],
        deals: Deal.listFromJson(json[r'deals']) ?? const [],
      );
    }
    return null;
  }

  static List<Status>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <Status>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Status.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Status> mapFromJson(dynamic json) {
    final map = <String, Status>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Status.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Status-objects as value to a dart map
  static Map<String, List<Status>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Status>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Status.listFromJson(
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
