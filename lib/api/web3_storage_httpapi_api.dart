part of FilecoinStorage.client;

class Web3StorageHTTPAPIApi {
  Web3StorageHTTPAPIApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  Future<Response> viewCarFilesCid(
      String cid,
      ) async {
    // ignore: prefer_c+onst_declarations
    final path = "/";
    String directorySubDomain = ".ipfs.w3s.link";

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      newBasePath: "https://"+cid+directorySubDomain
    );
  }

  /// Retrieve a CAR
  ///
  /// Retrieve an [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) packaged in a CAR file by using `/car/{cid}`, supplying the CID of the data you are interested in.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cid (required):
  Future<Response> _getCarCidWithHttpInfo(
    String cid,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/car/{cid}'.replaceAll('{cid}', cid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve a CAR
  ///
  /// Retrieve an [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) packaged in a CAR file by using `/car/{cid}`, supplying the CID of the data you are interested in.
  ///
  /// Parameters:
  ///
  /// * [String] cid (required):
  Future<MultipartFile?> getCarCid(
    String cid,
  ) async {
    final response = await _getCarCidWithHttpInfo(
      cid,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final ret = await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'String',
      ); //as MultipartFile;
      //print('ret '+ret.toString());
      return MultipartFile.fromString('field', ret, filename: 'filenamehere',);
      /**
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'String',
      ) as MultipartFile;
      */
    }
    return null;
  }

  /// Retrieve information about an upload
  ///
  /// Retrieve metadata about a specific file by using `/status/{cid}`, supplying the CID of the file you are interested in. This metadata includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cid (required):
  Future<Response> _getStatusCidWithHttpInfo(
    String cid,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/status/{cid}'.replaceAll('{cid}', cid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve information about an upload
  ///
  /// Retrieve metadata about a specific file by using `/status/{cid}`, supplying the CID of the file you are interested in. This metadata includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
  ///
  /// Parameters:
  ///
  /// * [String] cid (required):
  Future<Status?> getStatusCid(
    String cid,
  ) async {
    final response = await _getStatusCidWithHttpInfo(
      cid,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'Status',
      ) as Status;
    }
    return null;
  }

  /// Returns a single upload
  ///
  /// Retrieve the upload metadata of as single upload.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> _getUserUploadWithHttpInfo(String cid) async {
    // ignore: prefer_const_declarations
    final path = r'/user/uploads/{cid}'.replaceAll('{cid}', cid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Returns a single upload
  ///
  /// Retrieve the upload metadata of as single upload.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
  Future<List<Status>?> getUserUpload(String cid) async {
    final response = await _getUserUploadWithHttpInfo(cid);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Status>')
              as List)
          .cast<Status>()
          .toList();
    }
    return null;
  }

  /// List previous uploads
  ///
  /// Lists all previous uploads for the account ordered by creation date, newest first. These results can be paginated by specifying `before` and `size` parameters in the query string, using the creation date associated with the oldest upload returned in each batch as the value of `before` in subsequent calls.  Note this endpoint returns all uploads for the account not just the API key in use.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [DateTime] before:
  ///   Specifies a date, in ISO 8601 format. Ensures that the call to `/user/uploads` will not return any results newer than the given date.
  ///
  /// * [String] sortBy:
  ///   Sorts results by a given parameter.
  ///
  /// * [String] sortOrder:
  ///   Sorts the order of the results.
  ///
  /// * [int] page:
  ///   Specifies the page of returned results, used for pagination.
  ///
  /// * [int] size:
  ///   Specifies the maximum number of uploads to return.
  Future<Response> _getUserUploadsWithHttpInfo({
    DateTime? before,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? size,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/user/uploads';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (before != null) {
      queryParams.addAll(_queryParams('', 'before', before));
    }
    if (sortBy != null) {
      queryParams.addAll(_queryParams('', 'sortBy', sortBy));
    }
    if (sortOrder != null) {
      queryParams.addAll(_queryParams('', 'sortOrder', sortOrder));
    }
    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (size != null) {
      queryParams.addAll(_queryParams('', 'size', size));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List previous uploads
  ///
  /// Lists all previous uploads for the account ordered by creation date, newest first. These results can be paginated by specifying `before` and `size` parameters in the query string, using the creation date associated with the oldest upload returned in each batch as the value of `before` in subsequent calls.  Note this endpoint returns all uploads for the account not just the API key in use.  The information returned includes the creation date and file size, as well as details about how the network is storing your data. Using this information, you can identify peers on the [IPFS (InterPlanetary File System)](https://ipfs.io) network that are pinning the data, and [Filecoin](https://filecoin.io) storage providers that have accepted deals to store the data.
  ///
  /// Parameters:
  ///
  /// * [DateTime] before:
  ///   Specifies a date, in ISO 8601 format. Ensures that the call to `/user/uploads` will not return any results newer than the given date.
  ///
  /// * [String] sortBy:
  ///   Sorts results by a given parameter.
  ///
  /// * [String] sortOrder:
  ///   Sorts the order of the results.
  ///
  /// * [int] page:
  ///   Specifies the page of returned results, used for pagination.
  ///
  /// * [int] size:
  ///   Specifies the maximum number of uploads to return.
  Future<List<Status>?> getUserUploads({
    DateTime? before,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? size,
  }) async {
    final response = await _getUserUploadsWithHttpInfo(
      before: before,
      sortBy: sortBy,
      sortOrder: sortOrder,
      page: page,
      size: size,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Status>')
              as List)
          .cast<Status>()
          .toList();
    }
    return null;
  }

  /// Retrieve HTTP headers regarding a CAR
  ///
  /// This method is useful for doing a dry run of a call to `/car/{cid}`. Because it only returns HTTP header information, it is far more lightweight and can be used to get only the metadata about the given CAR file without retrieving a whole payload in the body of the HTTP response.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cid (required):
  Future<Response> _headCarCidWithHttpInfo(
    String cid,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/car/{cid}'.replaceAll('{cid}', cid);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'HEAD',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Retrieve HTTP headers regarding a CAR
  ///
  /// This method is useful for doing a dry run of a call to `/car/{cid}`. Because it only returns HTTP header information, it is far more lightweight and can be used to get only the metadata about the given CAR file without retrieving a whole payload in the body of the HTTP response.
  ///
  /// Parameters:
  ///
  /// * [String] cid (required):
  Future<void> headCarCid(
    String cid,
  ) async {
    final response = await _headCarCidWithHttpInfo(
      cid,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Upload a CAR
  ///
  /// Upload a [CAR](https://ipld.io/specs/transport/car/) (Content Addressable aRchive) file and store the [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) it contains.  See the [Working with Content Archives guide](https://web3.storage/docs/how-tos/work-with-car-files) for details on creating CARs and splitting them into chunks for upload using the [carbites JavaScript API](https://github.com/nftstorage/carbites), [command line tool](https://github.com/nftstorage/carbites-cli/), or [Go library](https://github.com/alanshaw/go-carbites).  Requests to this endpoint have a maximum payload size of 100MB but partial DAGs are supported, so multiple CAR files with the same root but with different sub-trees can be sent. This enables uploading of files that are bigger than the maximum payload size.  Note that only one CAR can be uploaded at a time, and only CAR files are accepted. This is in contrast to [`/upload`](#operation/post-upload), which can upload multiple files at once and accepts both CAR files and files from the client.  You can also provide a name for the file using the header `X-NAME`, but be sure to encode the filename first. For example `LICENSE–MIT` should be sent as `LICENSE%E2%80%93MIT`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] body (required):
  Future<Response> postCarWithHttpInfo(
    MultipartFile body,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/car';

    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[
      'application/vnd.ipld.car',
      //'application/octet-stream'
    ];
    //const contentTypes = <String>['application/x-www-form-urlencoded'];

print('zawq');
    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Upload a CAR
  ///
  /// Upload a [CAR](https://ipld.io/specs/transport/car/) (Content Addressable aRchive) file and store the [IPFS DAG](https://docs.ipfs.io/concepts/merkle-dag/) (Directed Acyclic Graph) it contains.  See the [Working with Content Archives guide](https://web3.storage/docs/how-tos/work-with-car-files) for details on creating CARs and splitting them into chunks for upload using the [carbites JavaScript API](https://github.com/nftstorage/carbites), [command line tool](https://github.com/nftstorage/carbites-cli/), or [Go library](https://github.com/alanshaw/go-carbites).  Requests to this endpoint have a maximum payload size of 100MB but partial DAGs are supported, so multiple CAR files with the same root but with different sub-trees can be sent. This enables uploading of files that are bigger than the maximum payload size.  Note that only one CAR can be uploaded at a time, and only CAR files are accepted. This is in contrast to [`/upload`](#operation/post-upload), which can upload multiple files at once and accepts both CAR files and files from the client.  You can also provide a name for the file using the header `X-NAME`, but be sure to encode the filename first. For example `LICENSE–MIT` should be sent as `LICENSE%E2%80%93MIT`.
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] body (required):
  Future<UploadResponse?> postCar(
    MultipartFile body,
  ) async {
    final response = await postCarWithHttpInfo(
      body,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    print('bazx');
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'UploadResponse',
      ) as UploadResponse;
    }
    return null;
  }

  /// Upload and store one file
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<MultipartFile>] file:
  Future<Response> _postUploadWithHttpInfo({
    MultipartFile? file,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/upload';

    // ignore: prefer_final_locals
    Object? postBody;

    print('lakai q');
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    //const contentTypes = <String>['multipart/form-data'];
    const contentTypes = <String>['application/x-www-form-urlencoded'];

    bool hasFields = false;
    print('lakai q1');
    final mp = MultipartRequest('POST', Uri.parse(path));
    print('lakai q2');
    if (file != null) {
      print('lakai q3');
      hasFields = true;
      mp.fields[r'file'] = file.field;
      mp.files.add(file);
    }
    if (hasFields) {
      //postBody = mp;
    }
    postBody = file;
    print('lakai q4'+path.toString()+' nbk '+queryParams.toString()+ ' nfj '+postBody.toString()+
        ' xmx '+headerParams.toString()+ ' jl '+formParams.toString());
    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Upload and store one file
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] file:
  Future<UploadResponse?> postUpload({
    MultipartFile? file,
  }) async {
    print('lakai0 ');
    final response = await _postUploadWithHttpInfo(
      file: file,
    );
    print('lakai1 '+ response.toString());
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    print('lakai2 ');
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      print('lakai3 '+response.body.toString());
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'UploadResponse',
      ) as UploadResponse;
    }
    return null;
  }



  /// Upload and store one or more files
  /// * [List<MultipartFile>] file:
  Future<Response> _postUploadMultipleWithHttpInfo({
    List<MultipartFile>? files, html.File? fileResult
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/upload';

    // ignore: prefer_final_locals
    Object? postBody;

    print('lakai q');
    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    //const contentTypes = <String>['multipart/form-data'];
    //const contentTypes = <String>['application/x-www-form-urlencoded'];
    const contentTypes = <String>[
      'application/x-www-form-urlencoded',
      'multipart/form-data'
    ];

    print('lakai q1');
      print('lakai q3');
      postBody = files;
    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }


  /// Upload and store more than one file at once
  ///
  /// Parameters:
  ///
  /// * [List<MultipartFile>] files:
  Future<UploadResponse?> uploadMultipleFiles({
    List<MultipartFile>? files, var fileResult = null
  }) async {
    final response = await _postUploadMultipleWithHttpInfo(
      files: files,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.

    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'UploadResponse',
      ) as UploadResponse;
    }
    return null;
  }
}
