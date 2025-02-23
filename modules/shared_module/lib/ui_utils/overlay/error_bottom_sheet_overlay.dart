import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_module/components/errors/error_bottom_sheet.dart';
import 'package:shared_module/ui_utils/overlay/error_bottom_sheet_model.dart';

class ErrorBottomSheetOverlay extends StatelessWidget {
  final ErrorBottomSheetCubit errorBottomSheetStatus;
  final Widget child;

  const ErrorBottomSheetOverlay({
    super.key,
    required this.errorBottomSheetStatus,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ErrorBottomSheetCubit, BottomSheetErrorType?>(
      bloc: errorBottomSheetStatus,
      buildWhen: (previous, current) => previous != current,
      builder: (context, bottomSheetErrorType) {
        if (bottomSheetErrorType != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ErrorBottomSheet.showErrorModal(
              context,
              bottomSheetErrorType.type,
              bottomSheetErrorType.callback,
              bottomSheetErrorType.closeCallback,
            );
            errorBottomSheetStatus.clearError();
          });
        }
        return child;
      },
    );
  }
}
