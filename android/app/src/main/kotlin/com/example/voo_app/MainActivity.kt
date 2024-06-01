package com.example.voo_app

import android.os.Bundle
import com.zendrive.sdk.Zendrive
import com.zendrive.sdk.ZendriveConfiguration
import com.zendrive.sdk.ZendriveDriveDetectionMode
import com.zendrive.sdk.ZendriveDriverAttributes
import io.flutter.embedding.android.FlutterActivity


class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //todo android channel for setup zendrive after user login.

    }

    private fun zendriveSetup(driverName: String, driverId: String) {
        val driverAttributes = ZendriveDriverAttributes().apply {
            alias = driverName
        }
        val zendriveConfig =
            ZendriveConfiguration(SDK_KEY, driverId, ZendriveDriveDetectionMode.INSURANCE).apply {
                this.driverAttributes = driverAttributes
            }


        Zendrive.setup(
            context, zendriveConfig, VooZendriveReceiver::class.java,  //rename to your custom class
            VooZendriveNotificationProvider::class.java
        ) { result ->
            if (result.isSuccess) {
                println(">>> ZendriveSDK setup success")
            } else {
                println(">>> Error: ${result.errorMessage}")
            }
        }

    }

    companion object {
        private const val SDK_KEY = "msxuMLUGR65VBdk4x3MkNxIg7XvJeNdE"
    }

}
