import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:seek_qr/seek_qr.dart';
import 'package:shared_module/utils/extensions/context_extensions.dart';
import 'package:shared_module/widgets/seek_button.dart';

class QrScanSection extends StatelessWidget {
  final SeekQr qrScanner;

  const QrScanSection({super.key, required this.qrScanner});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.qrScan != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${context.l10nHome.scanned_code_data_label}${state.qrScan!.data}',
                    style: context.theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5
                    ,
                  ),
                ),
              const SizedBox(height: 10),
              SeekButton(
                label: context.l10nHome.scan_qr_code_button_text,
                onPressed: () {
                  context.read<QrBloc>().add(ScanQrCode());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
