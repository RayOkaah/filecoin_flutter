# FilecoinStorage.model.Pin

## Load the model package
```dart
import 'package:FilecoinStorage/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**peerId** | **String** | Libp2p peer ID of the node pinning the data. | [optional] 
**peerName** | **String** | Human readable name for the peer pinning the data. | [optional] 
**region** | **String** | Approximate geographical region of the node pinning the data. | [optional] 
**status** | [**PinStatus**](PinStatus.md) |  | [optional] 
**updated** | [**DateTime**](DateTime.md) | This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


