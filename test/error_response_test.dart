import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for ErrorResponse
void main() {
  // final instance = ErrorResponse();
  Map<String, dynamic> sampleErrorResponseJson = {
    'name': 'errorname',
    'message': 'message here'
  };

  ErrorResponse sampleErrorResponse = ErrorResponse(
    name: 'errorname',
      message: 'message here'
  );

  group('test ErrorResponse', () {
    // String name
    // String message
    test("To test UnauthorizedErrorResponse initialization from Json", () async {
      expect(ErrorResponse.fromJson(sampleErrorResponseJson), sampleErrorResponse);
    });
  });
}
