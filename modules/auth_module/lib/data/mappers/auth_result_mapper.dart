import 'package:auth_module/domain/entities/biometric_auth_response.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';

class AuthResultMapper {
  static AuthResultResponse fromAuthResultDetails(AuthResultDetails details) {
    return AuthResultResponse(
      result: _mapResult(details.result),
      errorMessage: details.errorMessage,
    );
  }

  static BioAuthResult _mapResult(AuthResult result) {
    switch (result) {
      case AuthResult.success:
        return BioAuthResult.success;
      case AuthResult.failure:
        return BioAuthResult.failure;
      case AuthResult.error:
        return BioAuthResult.error;
    }
  }
}
