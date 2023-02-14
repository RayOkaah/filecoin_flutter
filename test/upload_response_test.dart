import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for UploadResponse
void main() {
  // final instance = UploadResponse();

  Map<String, dynamic> sampleUploadResponseJson = {
    'cid': "bafkreidivzimqfqtoqxkrpge6bjyhlvxqs3rhe73owtmdulaxr5do5in7u",
  };
  
  UploadResponse sampleUploadResponse = UploadResponse(
      cid: "bafkreidivzimqfqtoqxkrpge6bjyhlvxqs3rhe73owtmdulaxr5do5in7u",
  );

  group('test UploadResponse', () {
    test('Test UploadResponse initialization from Json', () async {
      expect(UploadResponse.fromJson(sampleUploadResponseJson), sampleUploadResponse);
    });
  });
}
