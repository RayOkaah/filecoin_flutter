# FilecoinStorage.model.Status

## Load the model package
```dart
import 'package:FilecoinStorage/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cid** | **String** | Self-describing content-addressed identifiers for distributed systems. Check the [CID (Content IDentifier) Specification](https://github.com/multiformats/cid) for more info. | [optional] 
**dagSize** | **num** | Total size of the DAG in bytes. | [optional] [default to 132614]
**created** | [**DateTime**](DateTime.md) | This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ. | [optional] 
**pins** | [**List<Pin>**](Pin.md) |  | [optional] [default to const []]
**deals** | [**List<Deal>**](Deal.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


