package com.example.seek_qr

import QRScanResult
import QRScannerApi

import android.app.Activity
import android.content.Intent
import androidx.activity.result.contract.ActivityResultContracts
import androidx.fragment.app.FragmentActivity
import com.google.zxing.integration.android.IntentIntegrator;
import com.journeyapps.barcodescanner.CaptureActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import kotlin.Result

/** SeekQrPlugin */
class SeekQrPlugin : FlutterPlugin, QRScannerApi, ActivityAware {

  private var activity: Activity? = null
  private var resultCallback: ((Result<QRScanResult>) -> Unit)? = null

  // ActivityResultLauncher for handling the QR scan result
  private lateinit var qrScanLauncher: androidx.activity.result.ActivityResultLauncher<Intent>

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    QRScannerApi.setUp(binding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    QRScannerApi.setUp(binding.binaryMessenger, null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity

    // Initialize the ActivityResultLauncher
    val fragmentActivity = activity as? FragmentActivity
    if (fragmentActivity != null) {

      qrScanLauncher = fragmentActivity.registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
        val data = result.data
        val resultCode = result.resultCode

        val scanResult = IntentIntegrator.parseActivityResult(IntentIntegrator.REQUEST_CODE, resultCode, data)
        if (scanResult != null) {
          if (scanResult.contents == null) {
            // Scan was cancelled
            resultCallback?.invoke(Result.success(QRScanResult(code = null, errorMessage = "Scan cancelled")))
          } else {
            // Scan was successful
            resultCallback?.invoke(Result.success(QRScanResult(code = scanResult.contents, errorMessage = null)))
          }
        } else {
          // Scan failed
          resultCallback?.invoke(Result.success(QRScanResult(code = null, errorMessage = "Scan failed")))
        }
      }
    }
  }

  override fun scanQRCode(callback: (Result<QRScanResult>) -> Unit) {
    val fragmentActivity = activity as? FragmentActivity
    if (fragmentActivity == null) {
      callback(Result.success(QRScanResult(code = null, errorMessage = "Activity is not a FragmentActivity")))
      return
    }

    resultCallback = callback

    // Initialize IntentIntegrator
    val integrator = IntentIntegrator(fragmentActivity)
    integrator.setDesiredBarcodeFormats(IntentIntegrator.QR_CODE)
    integrator.setPrompt("Escanea un QR")
    integrator.setCameraId(0)
    integrator.setBarcodeImageEnabled(false)
    integrator.setBeepEnabled(true)
    integrator.captureActivity = com.example.seek_qr.CustomScannerActivity::class.java


    // Launch the QR scanner
    qrScanLauncher.launch(integrator.createScanIntent())
  }


  class CustomScannerActivity : CaptureActivity() {
    // This activity will use the custom layout defined in res/layout/custom_scanner_layout.xml
  }

  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }
}