package com.example.voo_app

import com.zendrive.sdk.Zendrive
import com.zendrive.sdk.ZendriveConfiguration
import com.zendrive.sdk.ZendriveDriveDetectionMode
import com.zendrive.sdk.ZendriveDriverAttributes
import com.zendrive.sdk.ZendriveOperationCallback
import com.zendrive.sdk.insurance.ZendriveInsurance
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ZENDRIVE_CHANNEL)
            .setMethodCallHandler { call, result ->
                val args = call.arguments as Map<*, *>
                val driverId = args[DRIVER_ID]

                when (call.method) {
                    ZENDRIVE_CHANNEL_SETUP_METHOD -> {
                        val driverName = args[DRIVER_NAME]
                        if (driverName?.toString() != null && driverId?.toString() != null) {
                            zendriveSetup(driverName.toString(), driverId.toString())
                        }
                    }

                    ZENDRIVE_CHANNEL_START_TRIP_METHOD -> {
                        val tripId = args[TRIP_ID]
                        tripId?.let {
                            startTrip(tripId.toString())
                        } ?: run {
                            println(">>> trip id is null")
                        }
                    }

                    ZENDRIVE_CHANNEL_ON_WAY -> {
                        val tripId = args[TRIP_ID]
                        tripId?.let {
                            onWayToPickup(tripId.toString())
                        } ?: run {
                            println(">>> trip id is null")
                        }
                    }

                    ZENDRIVE_CHANNEL_END_TRIP_METHOD -> {
                        endTrip()
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
                println(">>> ZendriveSDK setup success with: $driverName")
            } else {
                println(">>> Error: ${result.errorMessage}")
            }
        }

    }

    private fun startTrip(tripId: String) {
        val startTripCallback = ZendriveOperationCallback { result ->
            if (result.isSuccess) {
                println(">>> trip start tracking success and tripId: $tripId")
            } else {
                println(">>> start trip has an error: ${result.errorMessage}")
            }
        }

        ZendriveInsurance.startDriveWithPeriod3(context, tripId, startTripCallback)
    }

    private fun onWayToPickup(tripId: String) {
        val onWayCallback = ZendriveOperationCallback { result ->
            if (result.isSuccess) {
                println(">>> driver on way to pickup the trip: $tripId")
            } else {
                println(">>> on way has an error: ${result.errorMessage}")
            }
        }
        ZendriveInsurance.startDriveWithPeriod2(context, tripId, onWayCallback)
    }

    private fun endTrip() {
        val stopTripCallback = ZendriveOperationCallback { result ->
            if (result.isSuccess) {
                println(">>> trip ended success")
            } else {
                println(">>> end trip has an error: ${result.errorMessage}")
            }
        }

        ZendriveInsurance.startDriveWithPeriod1(context, stopTripCallback)
    }

    companion object {
        private const val ZENDRIVE_CHANNEL = "zendrive_channel"
        private const val ZENDRIVE_CHANNEL_SETUP_METHOD = "setup"
        private const val ZENDRIVE_CHANNEL_START_TRIP_METHOD = "startTrip"
        private const val ZENDRIVE_CHANNEL_END_TRIP_METHOD = "endTrip"
        private const val ZENDRIVE_CHANNEL_ON_WAY = "onWay"
        private const val DRIVER_NAME = "driver_name"
        private const val DRIVER_ID = "driver_id"
        private const val TRIP_ID = "trip_id"

        private const val SDK_KEY = "msxuMLUGR65VBdk4x3MkNxIg7XvJeNdE"
    }

}
