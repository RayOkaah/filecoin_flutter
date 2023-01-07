# FilecoinStorage.model.Deal

## Load the model package
```dart
import 'package:FilecoinStorage/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**dealId** | **num** | On-chain ID of the deal. | [optional] 
**storageProvider** | **String** | Address of the provider storing this data. | [optional] 
**status** | **String** | Current deal status. | 
**pieceCid** | **String** | Filecoin [Piece CID](https://spec.filecoin.io/systems/filecoin_files/piece/) of the data in the deal. | [optional] 
**dataCid** | **String** | CID of the data aggregated in this deal. | [optional] 
**dataModelSelector** | **String** | Selector for extracting stored data from the aggregated data root. | [optional] 
**activation** | **String** | Date when the deal will become active in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. | [optional] 
**created** | **String** | Creation date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. | 
**updated** | **String** | Updated date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


