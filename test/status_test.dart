import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for Status
void main() {
  // final instance = Status();

  Pin samplePin = Pin(
      peerId: 'peerid',
      peerName: 'peername',
      region: 'africoto',
      status: PinStatus.pinned,
      updated: DateTime.parse('2023-02-14 01:50:57'),
  );

  Deal sampleDeal = Deal(
    created: "2021-08-04T00:35:43.492403+00:00",
    updated: "2021-08-09T06:16:44.047003+00:00",
    status: DealStatusEnum.active,
    dealId: 2229885,
    storageProvider: "f01278",
    pieceCid: "baga6ea4seaqawvtpgovz222raqk6zgawvjz4kjnnl7i3pduovtuivl2qxokoaji",
    dataCid: "bafybeigiytbwooh2ei74k6z4h7zqgo7y7rxx3zanlg4whd4g37rhh6o74m",
    dataModelSelector: "Links/100/Hash/Links/0/Hash/Links/0/Hash",
    activation: "2021-08-05T22:24:00+00:00",
  );

  List<Pin> pinList = [samplePin, samplePin].toList();
  List<Deal> dealList = [sampleDeal, sampleDeal].toList();

  Status sampleStatus = Status(
      cid: "bafkreidivzimqfqtoqxkrpge6bjyhlvxqs3rhe73owtmdulaxr5do5in7u",
      dagSize: 132614,
    created: DateTime.parse('2023-02-14 01:50:57'),
    pins: pinList,
    deals: dealList,
  );

  Map<String, dynamic> sampleStatusJson = {
    'cid': "bafkreidivzimqfqtoqxkrpge6bjyhlvxqs3rhe73owtmdulaxr5do5in7u",
    'dagSize': 132614,
    'created': "2023-02-14 01:50:57",
    'pins': pinList,
    'deals': dealList,
  };

  group('test Status', () {
    // Self-describing content-addressed identifiers for distributed systems. Check the [CID (Content IDentifier) Specification](https://github.com/multiformats/cid) for more info.
    // String cid
    // Total size of the DAG in bytes.
    // num dagSize (default value: 132614)
    // This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ.
    // DateTime created
    // List<Pin> pins (default value: const [])
    // List<Deal> deals (default value: const [])


    test("To test Status initialization from Json", () async {
      print('sakapa '+sampleStatusJson.toString());
      expect(Status.fromJson(sampleStatusJson), sampleStatus);
    });

  });
}
