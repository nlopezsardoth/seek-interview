import 'package:flutter/material.dart';
import 'package:home_module/presentation/views/qr_view.dart';
import 'package:router_module/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRScannerView(),
    );
  }
}