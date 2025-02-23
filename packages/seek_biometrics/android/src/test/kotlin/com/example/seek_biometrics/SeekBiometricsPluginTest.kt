package com.example.seek_biometrics

import android.app.Activity
import androidx.biometric.BiometricManager
import androidx.fragment.app.FragmentActivity
import com.example.seek_biometrics.AuthClassification
import com.example.seek_biometrics.AuthResult
import com.example.seek_biometrics.AuthResultDetails
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.mockito.ArgumentCaptor
import org.mockito.Mock
import org.mockito.Mockito.*
import org.mockito.MockitoAnnotations
import java.util.concurrent.Executor

class SeekBiometricsPluginTest {

    @Mock
    private lateinit var biometricManager: BiometricManager

    @Mock
    private lateinit var activity: Activity

    @Mock
    private lateinit var fragmentActivity: FragmentActivity

    private lateinit var plugin: SeekBiometricsPlugin

    @Before
    fun setUp() {
        MockitoAnnotations.openMocks(this)
        plugin = SeekBiometricsPlugin()
        plugin.onAttachedToActivity(object : androidx.core.app.ActivityCompat.OnRequestPermissionsResultCallback {
            override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {}
        })
    }

    @Test
    fun `isDeviceSupported should return true when biometricManager is initialized`() {
        plugin.biometricManager = biometricManager
        assertTrue(plugin.isDeviceSupported())
    }

    @Test
    fun `deviceCanSupportBiometrics should return true if BIOMETRIC_SUCCESS`() {
        `when`(biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK))
            .thenReturn(BiometricManager.BIOMETRIC_SUCCESS)

        plugin.biometricManager = biometricManager

        assertTrue(plugin.deviceCanSupportBiometrics())
    }

    @Test
    fun `deviceCanSupportBiometrics should return false if BIOMETRIC_ERROR_NO_HARDWARE`() {
        `when`(biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK))
            .thenReturn(BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE)

        plugin.biometricManager = biometricManager

        assertFalse(plugin.deviceCanSupportBiometrics())
    }

    @Test
    fun `getEnrolledBiometrics should return WEAK when BIOMETRIC_WEAK is available`() {
        `when`(biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_WEAK))
            .thenReturn(BiometricManager.BIOMETRIC_SUCCESS)

        plugin.biometricManager = biometricManager

        val enrolledBiometrics = plugin.getEnrolledBiometrics()
        assertTrue(enrolledBiometrics.contains(AuthClassification.WEAK))
    }

    @Test
    fun `getEnrolledBiometrics should return STRONG when BIOMETRIC_STRONG is available`() {
        `when`(biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_STRONG))
            .thenReturn(BiometricManager.BIOMETRIC_SUCCESS)

        plugin.biometricManager = biometricManager

        val enrolledBiometrics = plugin.getEnrolledBiometrics()
        assertTrue(enrolledBiometrics.contains(AuthClassification.STRONG))
    }

    @Test
    fun `authenticate should return ERROR when no authentication is available`() {
        `when`(biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_STRONG))
            .thenReturn(BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE)

        plugin.biometricManager = biometricManager

        val callbackCaptor = ArgumentCaptor.forClass(Result::class.java) as ArgumentCaptor<(Result<AuthResultDetails>) -> Unit>
        val callback: (Result<AuthResultDetails>) -> Unit = mock()

        plugin.authenticate("Title", "Subtitle", callback)

        verify(callback, times(1)).invoke(Result.success(AuthResultDetails(result = AuthResult.ERROR, errorMessage = "Biometrics/Device Credentials not available")))
    }
}
