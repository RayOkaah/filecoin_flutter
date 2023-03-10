part of FilecoinStorage.client;

class HttpBasicAuth implements Authentication {
  HttpBasicAuth({this.username = '', this.password = ''});

  String username;
  String password;

  @override
  void applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    if (username.isNotEmpty && password.isNotEmpty) {
      final credentials = '$username:$password';
      headerParams['Authorization'] =
          'Basic ${base64.encode(utf8.encode(credentials))}';
    }
  }
}
