// Autogenerated from Pigeon (v22.7.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")

package com.example.seek_qr.pigeons

import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMethodCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is QrscannerFlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class QrscannerFlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

/** Generated class from Pigeon that represents data sent in messages. */
data class QRScanResult (
  /** The scanned QR code result. */
  val code: String? = null,
  /** Error message in case of failure. */
  val errorMessage: String? = null
)
 {
  companion object {
    fun fromList(pigeonVar_list: List<Any?>): QRScanResult {
      val code = pigeonVar_list[0] as String?
      val errorMessage = pigeonVar_list[1] as String?
      return QRScanResult(code, errorMessage)
    }
  }
  fun toList(): List<Any?> {
    return listOf(
      code,
      errorMessage,
    )
  }
}
private open class QrscannerPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      129.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          QRScanResult.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is QRScanResult -> {
        stream.write(129)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}


/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface QRScannerApi {
  /** Starts the QR scanning process. */
  fun scanQRCode(callback: (Result<QRScanResult>) -> Unit)

  companion object {
    /** The codec used by QRScannerApi. */
    val codec: MessageCodec<Any?> by lazy {
      QrscannerPigeonCodec()
    }
    /** Sets up an instance of `QRScannerApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: QRScannerApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.seek_qr.QRScannerApi.scanQRCode$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.scanQRCode{ result: Result<QRScanResult> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
