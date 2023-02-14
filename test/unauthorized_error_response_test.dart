import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for UnauthorizedErrorResponse
void main() {
  // final instance = UnauthorizedErrorResponse();

  Map<String, dynamic> sampleUnauthorizedErrorResponseJson = {
    'name': 'HTTP Error',
    'message': 'Unauthorized',
  };

  UnauthorizedErrorResponse sampleUnauthorizedErrorResponse = UnauthorizedErrorResponse(
      name: 'HTTP Error',
      message: 'Unauthorized',
  );

  group('test UnauthorizedErrorResponse', () {
    // String name (default value: 'HTTP Error')
    // String message (default value: 'Unauthorized')

    test("To test UnauthorizedErrorResponse initialization from Json", () async {
      expect(UnauthorizedErrorResponse.fromJson(sampleUnauthorizedErrorResponseJson),
          sampleUnauthorizedErrorResponse);
    });
  });
}
