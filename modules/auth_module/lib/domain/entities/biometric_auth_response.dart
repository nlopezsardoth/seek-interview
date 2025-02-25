enum BioAuthResult { success, failure, error }

class AuthResultResponse {
  AuthResultResponse(
      {required this.result, this.errorMessage});

  /// The result of authenticating.
  final BioAuthResult result;

  /// An error message, if any.
  final String? errorMessage;

}