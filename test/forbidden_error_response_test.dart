import 'package:FilecoinStorage/api.dart';
import 'package:test/test.dart';

// tests for ForbiddenErrorResponse
void main() {
  // final instance = ForbiddenErrorResponse();

  Map<String, dynamic> sampleForbiddenErrorResponseMap = {
    'name': 'errorname',
    'message': ForbiddenErrorResponseMessageEnum.tokenIsNotValid
  };

  ForbiddenErrorResponse sampleForbiddenErrorResponse = ForbiddenErrorResponse(
      name: 'errorname',
      message: ForbiddenErrorResponseMessageEnum.tokenIsNotValid
  );

  group('test ForbiddenErrorResponse', () {
    // String name (default value: 'HTTP Error')
    // String message

    test("To test ForbiddenErrorResponse initialization from Json", () async {
      expect(ForbiddenErrorResponse.fromJson(sampleForbiddenErrorResponseMap),
          sampleForbiddenErrorResponse);
    });
  });
}
