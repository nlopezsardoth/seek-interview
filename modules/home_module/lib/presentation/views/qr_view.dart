import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:home_module/presentation/widgets/qr_history_section.dart';
import 'package:home_module/presentation/widgets/qr_scan_section.dart';
import 'package:seek_qr/seek_qr.dart';
import 'package:shared_module/ui_utils/overlay/loading_status_overlay.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  final SeekQr qrScanner = SeekQr();

  @override
  void initState() {
    super.initState();
    context.read<QrBloc>().add(LoadQrHistory());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrBloc, QrState>(
      builder: (context, state) {
        return LoadingStatusOverlay(
          loadingStatusCubit: context.read<QrBloc>().loadingStatus,
          errorBottomSheetStatus: context.read<QrBloc>().errorBottomSheetStatus,
          child: 
        Column(
            children: [
              // QR Scan Section
              Expanded(flex: 1, child: QrScanSection(qrScanner: qrScanner)),

              // QR History Section
              Expanded(flex: 2, child: QrHistorySection()),
            ]
         ),
        );
      },
    );
  }
}
