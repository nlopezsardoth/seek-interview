import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SeekLoader extends StatelessWidget {
  const SeekLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        color: Theme.of(context).primaryColor,
        size: 50,
      ),
    );
  }
}
