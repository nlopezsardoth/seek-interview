import 'package:flutter/material.dart';
import 'package:seek_biometrics/seek_biometrics.dart';
import 'package:seek_biometrics/pigeons/pigeon.g.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seek Biometrics Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BiometricsScreen(),
    );
  }
}

class BiometricsScreen extends StatefulWidget {
  const BiometricsScreen({super.key});

  @override
 State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  final SeekBiometrics seekBiometrics = SeekBiometrics();
  String statusMessage = "Press a button to start";

  void _checkDeviceSupport() async {
    bool isSupported = await seekBiometrics.isDeviceSupported();
    setState(() {
      statusMessage = isSupported
          ? "This device supports biometrics!"
          : "Biometrics not supported.";
    });
  }

  void _checkEnrolledBiometrics() async {
    List<AuthClassification> biometrics =
        await seekBiometrics.getEnrolledBiometrics();
    setState(() {
      statusMessage =
          biometrics.isNotEmpty ? "Enrolled: $biometrics" : "No biometrics found.";
    });
  }

  void _authenticate() async {
    AuthResultDetails result = await seekBiometrics.authenticate(
      title: "Authentication Required",
      subtitle: "Please authenticate using biometrics.",
    );
    setState(() {
      statusMessage = result.result == AuthResult.success
          ? "Authentication Successful!"
          : "Authentication Failed: ${result.errorMessage}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Biometrics Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(statusMessage, textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkDeviceSupport,
              child: Text("Check Device Support"),
            ),
            ElevatedButton(
              onPressed: _checkEnrolledBiometrics,
              child: Text("Check Enrolled Biometrics"),
            ),
            ElevatedButton(
              onPressed: _authenticate,
              child: Text("Authenticate"),
            ),
          ],
        ),
      ),
    );
  }
}