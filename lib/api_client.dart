part of FilecoinStorage.client;

class ApiClient {
  ApiClient({this.basePath = 'api.web3.storage', this.authentication, this.httpClient});

  final String basePath;
  var httpClient;

  var _client = Client();

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => httpClient?? Client();

  /// Requests to use a new HTTP [Client] in this class.
  set client(var newClient) {
    _client = newClient;
  }

  final _defaultHeaderMap = <String, String>{
    //"Content-type": "multipart/form-data",
    //"accept": "application/json",
  };
  final Authentication? authentication;

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, dynamic> formParams,
    String? contentType,
      {String newBasePath = "api.web3.storage", html.File? fileResult =null}
  ) async {
    _updateParamsForAuth(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty
        ? '?${urlEncodedQueryParams.join('&')}'
        : '';
    //final uri = Uri.parse('$newBasePath$path$queryString');
    final uri = Uri.https(newBasePath, path,);

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (body is MultipartFile &&
          (contentType == null ||
              !contentType.toLowerCase().startsWith('multipart/form-data'))) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
              request.sink.add,
              onDone: request.sink.close,
              // ignore: avoid_types_on_closure_parameters
              onError: (Object error, StackTrace trace) => request.sink.close(),
              cancelOnError: true,
            );
        final response = await client.send(request);
        return Response.fromStream(response);
      }

      if(body is List<MultipartFile>){
        //bool isHtml= body[0] is html.File?true : false;
        MultipartRequest request = MultipartRequest(method, uri);
        //add headers
        request.headers.addAll(headerParams);

        for(int i=0; i<body.length; i++){
         // final bytesFromSingleFile = await getBytesFromFile(body[i]);
         // String fileName = isHtml? body[i].name : body[i].path.split("/").last;
          print('fida  '+body[i].field.toString());
          formParams['file'+i.toString()] = await body[i];
          request.headers['content-disposition'] = "attachment;filename="+ body[i].filename.toString();
          request.fields['content-disposition'] = "attachment;filename="+ body[i].filename.toString();
          request.fields['file'] = body[i].field;
        }

        request.files.addAll(body);

        print('zangolo2');
        var response = await request.send();
        // StreamedResponse responseStream = await request.send();
        print(response.statusCode);
        // Response.fromStream(response);
/**
            // listen for response
            response.stream.transform(utf8.decoder).listen((value) {
            print(value);
            print('pangolo4');
            });
            */

      }

      if(body is MultipartFile){
        final request = MultipartRequest(method, uri);

        //add headers
        request.headers.addAll(headerParams);

        //adding params
        request.fields['file'] = body.field;
        //request.fields['firstName'] = 'abc';
         //request.fields['lastName'] = 'efg';
        //request.fields.addAll(body.fields);
        // send
        // add file to multipart
        request.files.add(body);
        var response = await request.send();
        final respStr = await response.stream.bytesToString();
       // StreamedResponse responseStream = await request.send();
        //var response = await request.send();
        print(response.statusCode);
       // Response.fromStream(response);
        /**
        // listen for response
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);
          print('pangolo4');
      });
        */
            }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = formParams; //contentType == 'application/x-www-form-urlencoded'
        //  ? formParams
        //  : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch (method) {
        case 'POST':
          return await client.post(
            uri,
            headers: nullableHeaderParams,
            body: formParams,
          );
        case 'PUT':
          return await client.put(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'DELETE':
          return await client.delete(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PATCH':
          return await client.patch(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'HEAD':
          return await client.head(
            uri,
            headers: nullableHeaderParams,
          );
        case 'GET':
          return await client.get(
            uri,
            headers: nullableHeaderParams,
          );
      }/**
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
      */
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(
    String json,
    String targetType, {
    bool growable = false,
  }) async =>
      // ignore: deprecated_member_use_from_same_package
      deserialize(json, targetType, growable: growable);

  @Deprecated(
      'Scheduled for removal, use deserializeAsync() instead.')
  dynamic deserialize(
    String json,
    String targetType, {
    bool growable = false,
  }) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType =
        targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
        ? json
        : _deserialize(jsonDecode(json), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated(
      'Scheduled for removal. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Update query and header parameters based on authentication settings.
  void _updateParamsForAuth(
    List<QueryParam> queryParams,
    Map<String, String> headerParams,
  ) {
    if (authentication != null) {
      authentication!.applyToParams(queryParams, headerParams);
    }
  }

  static dynamic _deserialize(dynamic value, String targetType,
      {bool growable = false}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'Deal':
          return Deal.fromJson(value);
        case 'ErrorResponse':
          return ErrorResponse.fromJson(value);
        case 'ForbiddenErrorResponse':
          return ForbiddenErrorResponse.fromJson(value);
        case 'Pin':
          return Pin.fromJson(value);
        case 'PinStatus':
          return PinStatusTypeTransformer().decode(value);
        case 'Status':
          return Status.fromJson(value);
        case 'UnauthorizedErrorResponse':
          return UnauthorizedErrorResponse.fromJson(value);
        case 'UploadResponse':
          return UploadResponse.fromJson(value);
        default:
          dynamic match;
          if (value is List &&
              (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => _deserialize(
                      v,
                      match,
                      growable: growable,
                    ))
                .toList(growable: growable);
          }
          if (value is Set &&
              (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => _deserialize(
                      v,
                      match,
                      growable: growable,
                    ))
                .toSet();
          }
          if (value is Map &&
              (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => _deserialize(
                    v,
                    match,
                    growable: growable,
                  )),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.internalServerError,
        'Exception during deserialization.',
        error,
        trace,
      );
    }
    throw ApiException(
      HttpStatus.internalServerError,
      'Could not find a suitable class for deserialization',
    );
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
      ? message.json
      : ApiClient._deserialize(
          jsonDecode(message.json),
          targetType,
          growable: message.growable,
        );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async =>
    value == null ? '' : json.encode(value);

extension MapFromList<Element> on List<Element> {
  Map<Key, Element> toMap<Key>(
      MapEntry<Key, Element> Function(Element e) getEntry) =>
      Map.fromEntries(map(getEntry));

  Map<Key, Element> toMapWhereKey<Key>(Key Function(Element e) getKey) =>
      Map.fromEntries(map((e) => MapEntry(getKey(e), e)));
}