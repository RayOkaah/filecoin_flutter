import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for Deal
void main() {
  // final instance = Deal();
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

  Map<String, dynamic> sampleDealJson = {
    "dealId": 2229885,
    "storageProvider": "f01278",
    "status": "Active",
    "pieceCid": "baga6ea4seaqawvtpgovz222raqk6zgawvjz4kjnnl7i3pduovtuivl2qxokoaji",
    "dataCid": "bafybeigiytbwooh2ei74k6z4h7zqgo7y7rxx3zanlg4whd4g37rhh6o74m",
    "dataModelSelector": "Links/100/Hash/Links/0/Hash/Links/0/Hash",
    "activation": "2021-08-05T22:24:00+00:00",
    "expiration": "2022-12-28T22:24:00+00:00",
    "created": "2021-08-04T00:35:43.492403+00:00",
    "updated": "2021-08-09T06:16:44.047003+00:00"
  };
  group('test Deal', () {
    // On-chain ID of the deal.
    // num dealId
    // Address of the provider storing this data.
    // String storageProvider
    // Current deal status.
    // String status
    // Filecoin [Piece CID](https://spec.filecoin.io/systems/filecoin_files/piece/) of the data in the deal.
    // String pieceCid
    // CID of the data aggregated in this deal.
    // String dataCid
    // Selector for extracting stored data from the aggregated data root.
    // String dataModelSelector
    // Date when the deal will become active in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    // String activation
    // Creation date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    // String created
    // Updated date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
    // String updated
    test("To test Deal initialization from Json", () async {
      expect(Deal.fromJson(sampleDealJson), sampleDeal);
    });
  });
}
