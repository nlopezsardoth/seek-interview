import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:shared_module/components/errors/error_bottom_sheet.dart';

mixin ErrorBottomSheetStatusMixin {
  final ErrorBottomSheetCubit errorBottomSheetStatus = ErrorBottomSheetCubit();
}

class ErrorBottomSheetCubit extends Cubit<BottomSheetErrorType?> {
  ErrorBottomSheetCubit() : super(null);

  void postSomethingWentWrongError() {
    post(BottomSheetErrorType(ErrorType.somethingWentWrong));
  }

  void postBiometricError(VoidCallback callback) {
    post(BottomSheetErrorType(ErrorType.validatedBiometricError, callback));
  }

  void postBiometricSettingsError(VoidCallback callback) {
    post(
        BottomSheetErrorType(ErrorType.enableBiometricSettingsError, callback));
  }

  Future<void> postBiometricUpdated(VoidCallback callback) async {
    post(BottomSheetErrorType(ErrorType.updatedBiometricError, callback));
  }

  void post(BottomSheetErrorType message) {
    emit(message);
  }

  void clearError() {
    emit(null);
  }

  @visibleForTesting
  void setValue(BottomSheetErrorType value) {
    emit(value);
  }

  @override
  String toString() => 'ErrorBottomSheetCubit(state: $state)';

}

class BottomSheetErrorType {
  final ErrorType type;
  final VoidCallback? callback;
  final VoidCallback? closeCallback;

  BottomSheetErrorType(this.type, [this.callback, this.closeCallback]);
}
