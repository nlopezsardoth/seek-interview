package com.example.seek_qr

import android.app.Activity
import android.content.Context
import com.example.seek_qr.pigeons.QRScannerApi
import com.example.seek_qr.pigeons.QRScanResult
import com.google.mlkit.common.MlKitException
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.codescanner.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import android.util.Log

/** SeekQRPlugin */
class SeekQrPlugin : FlutterPlugin, QRScannerApi, ActivityAware {
  private var activity: Activity? = null
  private lateinit var context: Context
  private lateinit var scanner: GmsBarcodeScanner

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    QRScannerApi.setUp(binding.binaryMessenger, this)
    context = binding.applicationContext
    initializeScanner()

    preloadBarcodeUI() // Trigger download of barcode scanning UI at startup
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    QRScannerApi.setUp(binding.binaryMessenger, null)
  }

  private fun initializeScanner() {
    val options = GmsBarcodeScannerOptions.Builder()
      .setBarcodeFormats(Barcode.FORMAT_QR_CODE)
      .build()
    scanner = GmsBarcodeScanning.getClient(context, options)
    scanner.startScan()
      .addOnFailureListener { exception ->
        if (exception is MlKitException) {
          Log.e("SeekQrPlugin", "Barcode UI download failed: ${exception.localizedMessage}")
        }
      }
  }

  override fun scanQRCode(callback: (Result<QRScanResult>) -> Unit) {
    scanner.startScan()
      .addOnSuccessListener { qrcode ->
        callback(Result.success(QRScanResult(code = qrcode.rawValue, errorMessage = null)))
      }
      .addOnCanceledListener {
        callback(Result.success(QRScanResult(code = null, errorMessage = "Scan canceled")))
      }
      .addOnFailureListener { exception ->
        callback(Result.success(QRScanResult(code = null, errorMessage = exception.localizedMessage)))
      }
  }

  private fun preloadBarcodeUI() {
    val options = GmsBarcodeScannerOptions.Builder()
      .setBarcodeFormats(Barcode.FORMAT_QR_CODE)
      .build()

    val preloadScanner = GmsBarcodeScanning.getClient(context, options)

    preloadScanner.startScan()
      .addOnSuccessListener {
        Log.d("SeekQrPlugin", "Barcode UI is ready")
      }
      .addOnFailureListener { exception ->
        Log.e("SeekQrPlugin", "Barcode UI preload failed: ${exception.localizedMessage}")
      }
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }
}
