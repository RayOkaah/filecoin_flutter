part of FilecoinStorage.client;

class Pin {
  /// Returns a new [Pin] instance.
  Pin({
    required this.peerId,
    this.peerName,
    this.region,
    this.status,
    this.updated,
  });

  /// Libp2p peer ID of the node pinning the data.

  String? peerId;

  /// Human readable name for the peer pinning the data.

  String? peerName;

  /// Approximate geographical region of the node pinning the data.

  String? region;

  /// Pin Status

  PinStatus? status;

  /// This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ.

  DateTime? updated;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pin &&
          other.peerId == peerId &&
          other.peerName == peerName &&
          other.region == region &&
          other.status == status &&
          other.updated == updated;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (peerId == null ? 0 : peerId!.hashCode) +
      (peerName == null ? 0 : peerName!.hashCode) +
      (region == null ? 0 : region!.hashCode) +
      (status == null ? 0 : status!.hashCode) +
      (updated == null ? 0 : updated!.hashCode);

  @override
  String toString() =>
      'Pin[peerId=$peerId, peerName=$peerName, region=$region, status=$status, updated=$updated]';

  Map<String, dynamic> toJson() {
    final _json = <String, dynamic>{};
    if (peerId != null) {
      _json[r'peerId'] = peerId;
    }
    if (peerName != null) {
      _json[r'peerName'] = peerName;
    }
    if (region != null) {
      _json[r'region'] = region;
    }
    if (status != null) {
      _json[r'status'] = status;
    }
    if (updated != null) {
      _json[r'updated'] = updated!.toUtc().toIso8601String();
    }
    return _json;
  }

  /// Returns a new [Pin] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Pin? fromJson(Map value) {
    if (value != null) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "Pin[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "Pin[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Pin(
        peerId: mapValueOfType<String>(json, r'peerId'),
        peerName: mapValueOfType<String>(json, r'peerName'),
        region: mapValueOfType<String>(json, r'region'),
        status: PinStatus.fromJson(json[r'status']),
        updated: mapDateTime(json, r'updated', ''),
      );
    }
    return null;
  }

  static List<Pin>? listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = json; //<Pin>[];
    /**
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Pin.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    */
    return result; //.toList(growable: growable);
  }

  static Map<String, Pin> mapFromJson(dynamic json) {
    final map = <String, Pin>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Pin.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Pin-objects as value to a dart map
  static Map<String, List<Pin>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<Pin>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Pin.listFromJson(
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
  static const requiredKeys = <String>{"peerId"};
}
