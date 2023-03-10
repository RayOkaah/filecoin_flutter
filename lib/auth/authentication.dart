part of FilecoinStorage.client;

// ignore: one_member_abstracts
abstract class Authentication {
  /// Apply authentication settings to header and query params.
  void applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams);
}
