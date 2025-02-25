import 'package:flutter/material.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';

class SeekButton extends StatelessWidget {
  const SeekButton({super.key, required this.label, this.onPressed,});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label, style: context.theme.textTheme.labelLarge),
      
    );
  }
}
