import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for Pin
void main() {
  // final instance = Pin();

  Map<String, dynamic> samplePinJson = {
    'peerId': 'peerid',
    'peerName': 'peername',
    'region': 'africoto',
    'status': PinStatus.pinned,
    'updated': '2023-02-14 01:50:57',
  };

  Pin samplePin = Pin(
      peerId: 'peerid',
    peerName: 'peername',
    region: 'africoto',
    status: PinStatus.pinned,
    updated: DateTime.parse('2023-02-14 01:50:57'), //DateTime(2023, 02,14,01,50,57),
  );

  group('test Pin', () {
    // Libp2p peer ID of the node pinning the data.
    // String peerId
    // Human readable name for the peer pinning the data.
    // String peerName
    // Approximate geographical region of the node pinning the data.
    // String region
    // PinStatus status
    // This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ.
    // DateTime updated
    test('To test Pin initialization from Json', () async {
      expect(Pin.fromJson(samplePinJson), samplePin);
    });
  });
}
