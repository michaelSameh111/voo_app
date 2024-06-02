package com.example.voo_app

import com.fairmatic.sdk.Fairmatic
import com.fairmatic.sdk.classes.FairmaticConfiguration
import com.fairmatic.sdk.classes.FairmaticDriverAttributes
import com.fairmatic.sdk.classes.FairmaticOperationCallback
import com.fairmatic.sdk.classes.FairmaticOperationResult
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FAIRMATIC_CHANNEL)
            .setMethodCallHandler { call, result ->
                val args = call.arguments as Map<*, *>
                val driverId = args[DRIVER_ID]

                when (call.method) {
                    SETUP_METHOD -> {
                        val driverName = args[DRIVER_NAME]
                        val driverEmail = args[DRIVER_EMAIL]
                        val driverPhone = args[DRIVER_PHONE]

                        if (driverName?.toString() != null && driverId?.toString() != null) {
                            fairmaticSetup(
                                driverName.toString(),
                                driverEmail?.toString(),
                                driverPhone?.toString(),
                                driverId.toString()
                            )
                        }
                    }

                    START_TRACKING -> {
                        val tripId = args[TRIP_ID]
                        tripId?.let {
                            startTrip(tripId.toString())
                        } ?: run {
                            println(">>> trip id is null")
                        }
                    }

                    ON_WAY -> {
                        val tripId = args[TRIP_ID]
                        tripId?.let {
                            onWayToPickup(tripId.toString())
                        } ?: run {
                            println(">>> trip id is null")
                        }
                    }

                    READY_TRACKING -> {
                        readyForTrip()
                    }

                    TURN_OFF->{
                        turnOff()
                    }

                }
            }

    }

    private fun fairmaticSetup(
        name: String,
        email: String?,
        phoneNumber: String?,
        driverId: String
    ) {
        val fairmaticDriverAttributes = FairmaticDriverAttributes(
            name = name,
            email = email,
            phoneNumber = phoneNumber
        )

        val fairmaticConfiguration = FairmaticConfiguration(
            sdkKey = SDK_KEY,
            driverId = driverId,
            driverAttributes = fairmaticDriverAttributes
        )

        Fairmatic.setup(
            context,
            fairmaticConfiguration,
            VooFairmaticReceiver::class.java, //rename to your custom class
            VooFairmaticNotificationProvider::class.java, //rename to your custom class
            object : FairmaticOperationCallback {
                override fun onCompletion(result: FairmaticOperationResult) {
                    if (result is FairmaticOperationResult.Success) {
                        println(">>> FairmaticSDK setup success");
                    } else {
                        println(">>> FairmaticSDK setup failed $result");
                    }
                }
            }
        );

    }

    private fun startTrip(tripId: String) {
        val startTrackingCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> trip started fairmatic successfully")
                } else {
                    println(">>> trip started fairmatic error: $result")
                }
            }
        }

        Fairmatic.startDriveWithPeriod3(context, tripId, startTrackingCallback)
    }

    private fun onWayToPickup(tripId: String) {
        val onWayCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> driver on way to pickup the trip: $tripId")
                } else {
                    println(">>> on way has an error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }
        Fairmatic.startDriveWithPeriod2(context, tripId, onWayCallback)
    }

    private fun readyForTrip() {
        val stopTripCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> trip ended success")
                } else {
                    println(">>> end trip has an error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }

        Fairmatic.startDriveWithPeriod1(context, stopTripCallback)
    }

    private fun turnOff() {
        val stopTripCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> driver turn off")
                } else {
                    println(">>> driver turn off error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }

        Fairmatic.stopPeriod(context, stopTripCallback)

    }

    companion object {
        private const val FAIRMATIC_CHANNEL = "fairmatic_channel"

        private const val SETUP_METHOD = "setup"
        private const val READY_TRACKING = "readyForTrip"
        private const val START_TRACKING = "startTrip"
        private const val ON_WAY = "onWay"
        private const val TURN_OFF = "turnOff"

        private const val DRIVER_NAME = "driver_name"
        private const val DRIVER_ID = "driver_id"
        private const val DRIVER_EMAIL = "driver_email"
        private const val DRIVER_PHONE = "driver_phone"

        private const val TRIP_ID = "trip_id"

        private const val SDK_KEY = "Zi7SdPnVwnmhYPVKcYrvCUUdyNEpU2kQ"
    }

}
