import 'package:flutter/material.dart';
import 'package:seek_qr/seek_qr.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QRScannerScreen(),
    );
  }
}

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final SeekQr _qrScanner = SeekQr();
  String _scanResult = "Tap to scan QR code";

  Future<void> _scanQRCode() async {
    try {
      final result = await _qrScanner.scanQRCode();
      setState(() {
        _scanResult = result.code ?? "Error: ${result.errorMessage}";
      });
    } catch (e) {
      setState(() {
        _scanResult = "Failed to scan: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Scanner Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_scanResult, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanQRCode,
              child: Text("Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
