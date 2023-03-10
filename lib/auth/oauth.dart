part of FilecoinStorage.client;

class OAuth implements Authentication {
  OAuth({this.accessToken = ''});

  String accessToken;

  @override
  void applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    if (accessToken.isNotEmpty) {
      headerParams['Authorization'] = 'Bearer $accessToken';
    }
  }
}
