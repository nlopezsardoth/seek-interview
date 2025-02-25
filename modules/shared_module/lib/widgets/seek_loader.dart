import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';

class SeekLoader extends StatelessWidget {
  const SeekLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        color: context.theme.primaryColor,
        size: 50,
      ),
    );
  }
}
