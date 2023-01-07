# FilecoinStorage
This documentation describes the HTTP API Wrapper Client for [**web3.storage**](https://web3.storage), which allows you to quickly and easily build applications using decentralized data storage persisted by [Filecoin](https://filecoin.io) and available over [IPFS](https://ipfs.io).

## API endpoint URL

The main public API endpoint URL for web3.storage is `https://api.web3.storage`. All endpoints described in this document is made relative to this root URL. 

### Rate limits

This API imposes rate limits to ensure quality of service. You may receive a 429 \"Too many requests\" error if you make more than 30 requests with the same API token within a ten second window. Upon receiving a response with a 429 status, you should retry the failed request after a small delay. To avoid 429 responses, you may wish to implement client-side request throttling to stay within the limits.

## Requirements

Dart 2.12 or later

## Installation & Usage


## Tests

TODO

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

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

## Documentation for API Endpoints

All URIs are relative to *https://api.web3.storage*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*Web3StorageHTTPAPIApi* | [**getCarCid**](doc\/Web3StorageHTTPAPIApi.md#getcarcid) | **GET** /car/{cid} | Retrieve a CAR
*Web3StorageHTTPAPIApi* | [**getStatusCid**](doc\/Web3StorageHTTPAPIApi.md#getstatuscid) | **GET** /status/{cid} | Retrieve information about an upload
*Web3StorageHTTPAPIApi* | [**getUserUpload**](doc\/Web3StorageHTTPAPIApi.md#getuserupload) | **GET** /user/uploads/{cid} | Returns a single upload
*Web3StorageHTTPAPIApi* | [**getUserUploads**](doc\/Web3StorageHTTPAPIApi.md#getuseruploads) | **GET** /user/uploads | List previous uploads
*Web3StorageHTTPAPIApi* | [**headCarCid**](doc\/Web3StorageHTTPAPIApi.md#headcarcid) | **HEAD** /car/{cid} | Retrieve HTTP headers regarding a CAR
*Web3StorageHTTPAPIApi* | [**postCar**](doc\/Web3StorageHTTPAPIApi.md#postcar) | **POST** /car | Upload a CAR
*Web3StorageHTTPAPIApi* | [**postUpload**](doc\/Web3StorageHTTPAPIApi.md#postupload) | **POST** /upload | Upload and store one or more files


## Documentation For Models

 - [Deal](doc\/Deal.md)
 - [ErrorResponse](doc\/ErrorResponse.md)
 - [ForbiddenErrorResponse](doc\/ForbiddenErrorResponse.md)
 - [Pin](doc\/Pin.md)
 - [PinStatus](doc\/PinStatus.md)
 - [Status](doc\/Status.md)
 - [UnauthorizedErrorResponse](doc\/UnauthorizedErrorResponse.md)
 - [UploadResponse](doc\/UploadResponse.md)


## Documentation For Authorization


## bearerAuth

- **Type**: HTTP Bearer authentication


## Author
Ray Okaah.


