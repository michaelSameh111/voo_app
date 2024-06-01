package com.example.voo_app

import com.zendrive.sdk.Zendrive
import com.zendrive.sdk.ZendriveConfiguration
import com.zendrive.sdk.ZendriveDriveDetectionMode
import com.zendrive.sdk.ZendriveDriverAttributes
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ZENDRIVE_CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    ZENDRIVE_CHANNEL_SETUP_METHOD -> {
                        val args = call.arguments as Map<*, *>
                        val driverName = args[DRIVER_NAME]
                        val driverId = args[DRIVER_ID]
                        if (driverName?.toString() != null && driverId?.toString() != null) {
                            zendriveSetup(driverName.toString(), driverId.toString())
                        }
                    }
                }
            }

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
                println(">>> ZendriveSDK setup success with: ${driverName}")
            } else {
                println(">>> Error: ${result.errorMessage}")
            }
        }

    }

    companion object {
        private const val ZENDRIVE_CHANNEL = "zendrive_channel"
        private const val ZENDRIVE_CHANNEL_SETUP_METHOD = "setup"
        private const val DRIVER_NAME = "driver_name"
        private const val DRIVER_ID = "driver_id"
        private const val SDK_KEY = "msxuMLUGR65VBdk4x3MkNxIg7XvJeNdE"
    }

}
