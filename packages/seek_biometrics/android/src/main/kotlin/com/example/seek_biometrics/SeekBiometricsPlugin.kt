package com.example.seek_biometrics

import SeekAuthApi
import AuthResultDetails
import AuthClassification

import androidx.biometric.BiometricManager
import androidx.biometric.BiometricPrompt
import androidx.biometric.BiometricPrompt.PromptInfo

import android.app.Activity
import androidx.fragment.app.FragmentActivity
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import java.security.*
import java.util.*
import java.util.concurrent.Executor
import android.util.Log


const val AUTH_FAILED = "AUTH_FAILED"


/** SeekBiometricsPlugin */
class SeekBiometricsPlugin: FlutterPlugin, SeekAuthApi, ActivityAware {

  private var activity: Activity? = null
  private var biometricManager: BiometricManager? = null
  private lateinit var executor: Executor


  override fun isDeviceSupported(): Boolean {
    return biometricManager?.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK) == BiometricManager.BIOMETRIC_SUCCESS
  }

  override fun deviceCanSupportBiometrics(): Boolean {
    return biometricManager?.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK) != BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE
  }

  override fun getEnrolledBiometrics(): List<AuthClassification> {
    val biometrics = mutableListOf<AuthClassification>()

    if (biometricManager == null) {
        Log.e("SeekBiometrics", "BiometricManager is NULL! Did onAttachedToActivity() run?")
        return biometrics
    }

    val weakAuth = biometricManager!!.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK)
    val strongAuth = biometricManager!!.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_STRONG)

    Log.d("SeekBiometrics", "Checking Biometrics - Weak: $weakAuth, Strong: $strongAuth")

    if (weakAuth == BiometricManager.BIOMETRIC_SUCCESS) {
        biometrics.add(AuthClassification.WEAK)
    }
    if (strongAuth == BiometricManager.BIOMETRIC_SUCCESS) {
        biometrics.add(AuthClassification.STRONG)
    }

    if (biometrics.isEmpty()) {
        Log.w("SeekBiometrics", "No enrolled biometrics found!")
    } else {
        Log.i("SeekBiometrics", "Found biometrics: $biometrics")
    }

    return biometrics
  }

  override fun authenticate (title: String, subtitle: String,  callback: (Result<AuthResultDetails>) -> Unit){
      try {
      val canAuthenticate: Int = if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
        biometricManager?.canAuthenticate(
          BiometricManager.Authenticators.BIOMETRIC_STRONG or
                  BiometricManager.Authenticators.DEVICE_CREDENTIAL
        ) ?: BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE
      } else {
        // For older devices, we just check if BIOMETRIC is available.
        biometricManager?.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_STRONG) ?: BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE
      }



      if (canAuthenticate != BiometricManager.BIOMETRIC_SUCCESS) {
        callback(Result.success(AuthResultDetails(result = AuthResult.ERROR, errorMessage = "Biometrics/Device Credentials not available")))
        return
      }

        val fragmentActivity = activity as? FragmentActivity
        if (fragmentActivity == null) {
          callback(Result.success(AuthResultDetails(result = AuthResult.ERROR, errorMessage = "Activity is not a FragmentActivity")))
          return
        }

        executor = ContextCompat.getMainExecutor(fragmentActivity)

        val biometricPrompt = BiometricPrompt(
          fragmentActivity,
          executor,
          object : BiometricPrompt.AuthenticationCallback() {
            override fun onAuthenticationError(errorCode: Int, errString: CharSequence) {
              super.onAuthenticationError(errorCode, errString)
              callback(Result.success(AuthResultDetails(result = AuthResult.ERROR, errorMessage = "$errString (code: $errorCode)")))
            }

            override fun onAuthenticationSucceeded(authResult: BiometricPrompt.AuthenticationResult) {
              super.onAuthenticationSucceeded(authResult)
              callback(Result.success(AuthResultDetails(result = AuthResult.SUCCESS, errorMessage = null)))
            }

            override fun onAuthenticationFailed() {
              super.onAuthenticationFailed()
              callback(Result.success(AuthResultDetails(result = AuthResult.ERROR, errorMessage = "Authentication failed")))
            }
          }
        )

        val promptInfo = PromptInfo.Builder()
          .setTitle(title)
          .setSubtitle(subtitle)
          .setDeviceCredentialAllowed(true)
          .build()

        biometricPrompt.authenticate(promptInfo)

      } catch (e: Exception){
       callback (Result.success(AuthResultDetails(result = AuthResult.ERROR, errorMessage = "Error generating signature: ${e.message}")))
    }

  }

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    Log.d("SeekBiometrics", "onAttachedToEngine called!")
    SeekAuthApi.setUp(binding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    SeekAuthApi.setUp(binding.binaryMessenger, null)
  }


  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    Log.d("SeekBiometrics", "onAttachedToActivity called!")
    activity = binding.activity
    if (activity == null) {
        Log.e("SeekBiometrics", "Activity is NULL in onAttachedToActivity!")
    } else {
        biometricManager = BiometricManager.from(activity!!)
        Log.d("SeekBiometrics", "BiometricManager initialized successfully.")
    }
  }


  override fun onDetachedFromActivity() {
    activity = null
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
    biometricManager = BiometricManager.from(activity!!)
  }

}
