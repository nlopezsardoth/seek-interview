import 'package:flutter/material.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';
import 'package:shared_module/utils/extensions/datetime_extensions.dart';

class QrListItem extends StatelessWidget {
  final QrScan entry;

  const QrListItem({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        color: context.theme.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.qr_code_2_outlined, size: 40),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.data,  style: context.theme.textTheme.labelLarge, overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text(entry.scannedAt.toFriendlyString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
