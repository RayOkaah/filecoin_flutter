# FilecoinStorage.api.Web3StorageHTTPAPIApi

## Load the API package
```dart
import 'package:FilecoinStorage/api.dart';
```

All URIs are relative to *https://api.web3.storage*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCarCid**](Web3StorageHTTPAPIApi.md#getcarcid) | **GET** /car/{cid} | Retrieve a CAR
[**getStatusCid**](Web3StorageHTTPAPIApi.md#getstatuscid) | **GET** /status/{cid} | Retrieve information about an upload
[**getUserUpload**](Web3StorageHTTPAPIApi.md#getuserupload) | **GET** /user/uploads/{cid} | Returns a single upload
[**getUserUploads**](Web3StorageHTTPAPIApi.md#getuseruploads) | **GET** /user/uploads | List previous uploads
[**headCarCid**](Web3StorageHTTPAPIApi.md#headcarcid) | **HEAD** /car/{cid} | Retrieve HTTP headers regarding a CAR
[**postCar**](Web3StorageHTTPAPIApi.md#postcar) | **POST** /car | Upload a CAR
[**postUpload**](Web3StorageHTTPAPIApi.md#postupload) | **POST** /upload | Upload and store one or more files


# **getCarCid**
> MultipartFile getCarCid(cid)

Retrieve a CAR

Retrieve an [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) packaged in a CAR file by using `/car/{cid}`, supplying the CID of the data you are interested in.

### Example
```dart
import 'package:FilecoinStorage/api.dart';

final api_instance = Web3StorageHTTPAPIApi();
final cid = cid_example; // String | 

try {
    final result = api_instance.getCarCid(cid);
    print(result);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->getCarCid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cid** | **String**|  | 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/vnd.ipld.car, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatusCid**
> Status getStatusCid(cid)

Retrieve information about an upload

Retrieve metadata about a specific file by using `/status/{cid}`, supplying the CID of the file you are interested in. This metadata includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.

### Example
```dart
import 'package:FilecoinStorage/api.dart';

final api_instance = Web3StorageHTTPAPIApi();
final cid = cid_example; // String | 

try {
    final result = api_instance.getStatusCid(cid);
    print(result);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->getStatusCid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cid** | **String**|  | 

### Return type

[**Status**](Status.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserUpload**
> List<Status> getUserUpload()

Returns a single upload

Retrieve the upload metadata of as single upload.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data. 

### Example
```dart
import 'package:FilecoinStorage/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = Web3StorageHTTPAPIApi();

try {
    final result = api_instance.getUserUpload();
    print(result);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->getUserUpload: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<Status>**](Status.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserUploads**
> List<Status> getUserUploads(before, sortBy, sortOrder, page, size)

List previous uploads

Lists all previous uploads for the account ordered by creation date, newest first. These results can be paginated by specifying `before` and `size` parameters in the query string, using the creation date associated with the oldest upload returned in each batch as the value of `before` in subsequent calls.  Note this endpoint returns all uploads for the account not just the API key in use.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data. 

### Example
```dart
import 'package:FilecoinStorage/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = Web3StorageHTTPAPIApi();
final before = 2020-07-27T17:32:28Z; // DateTime | Specifies a date, in ISO 8601 format. Ensures that the call to `/user/uploads` will not return any results newer than the given date.
final sortBy = sortBy_example; // String | Sorts results by a given parameter.
final sortOrder = sortOrder_example; // String | Sorts the order of the results.
final page = 56; // int | Specifies the page of returned results, used for pagination.
final size = 56; // int | Specifies the maximum number of uploads to return.

try {
    final result = api_instance.getUserUploads(before, sortBy, sortOrder, page, size);
    print(result);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->getUserUploads: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **before** | **DateTime**| Specifies a date, in ISO 8601 format. Ensures that the call to `/user/uploads` will not return any results newer than the given date. | [optional] 
 **sortBy** | **String**| Sorts results by a given parameter. | [optional] 
 **sortOrder** | **String**| Sorts the order of the results. | [optional] 
 **page** | **int**| Specifies the page of returned results, used for pagination. | [optional] [default to 1]
 **size** | **int**| Specifies the maximum number of uploads to return. | [optional] [default to 10]

### Return type

[**List<Status>**](Status.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **headCarCid**
> headCarCid(cid)

Retrieve HTTP headers regarding a CAR

This method is useful for doing a dry run of a call to `/car/{cid}`. Because it only returns HTTP header information, it is far more lightweight and can be used to get only the metadata about the given CAR file without retrieving a whole payload in the body of the HTTP response. 

### Example
```dart
import 'package:FilecoinStorage/api.dart';

final api_instance = Web3StorageHTTPAPIApi();
final cid = cid_example; // String | 

try {
    api_instance.headCarCid(cid);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->headCarCid: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCar**
> UploadResponse postCar(body)

Upload a CAR

Upload a [CAR](https://ipld.io/specs/transport/car/) (Content Addressable aRchive) file and store the [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) it contains.  See the [Working with Content Archives guide](https://web3.storage/docs/how-tos/work-with-car-files) for details on creating CARs and splitting them into chunks for upload using the [carbites JavaScript API](https://github.com/nftstorage/carbites), [command line tool](https://github.com/nftstorage/carbites-cli/), or [Go library](https://github.com/alanshaw/go-carbites).  Requests to this endpoint have a maximum payload size of 100MB but partial DAGs are supported, so multiple CAR files with the same root but with different sub-trees can be sent. This enables uploading of files that are bigger than the maximum payload size.  Note that only one CAR can be uploaded at a time, and only CAR files are accepted. This is in contrast to [`/upload`](#operation/post-upload), which can upload multiple files at once and accepts both CAR files and files from the client.  You can also provide a name for the file using the header `X-NAME`, but be sure to encode the filename first. For example `LICENSE–MIT` should be sent as `LICENSE%E2%80%93MIT`. 

### Example
```dart
import 'package:FilecoinStorage/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = Web3StorageHTTPAPIApi();
final body = MultipartFile(); // MultipartFile | 

try {
    final result = api_instance.postCar(body);
    print(result);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->postCar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **MultipartFile**|  | 

### Return type

[**UploadResponse**](UploadResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/vnd.ipld.car, application/octet-stream
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUpload**
> UploadResponse postUpload(file)

Upload and store one or more files

Store files using web3.storage. You can upload either a single file or multiple files.  Send the POST request with one of the following: - a single file, with a single blob/file object as the body - multiple files, as `FormData` with `Content-Disposition` headers for each part to specify filenames and the request header `Content-Type: multipart/form-data`  Requests to this endpoint have a maximum payload size of 100MB. To upload larger files, see the documentation for the `/car` endpoint.  You can also provide a name for the file using the header `X-NAME`, but be sure to encode the filename first. For example `LICENSE–MIT` should be sent as `LICENSE%E2%80%93MIT`. 

### Example
```dart
import 'package:FilecoinStorage/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = Web3StorageHTTPAPIApi();
final file = [/path/to/file.txt]; // List<MultipartFile> | 

try {
    final result = api_instance.postUpload(file);
    print(result);
} catch (e) {
    print('Exception when calling Web3StorageHTTPAPIApi->postUpload: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | [**List<MultipartFile>**](MultipartFile.md)|  | [optional] 

### Return type

[**UploadResponse**](UploadResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

