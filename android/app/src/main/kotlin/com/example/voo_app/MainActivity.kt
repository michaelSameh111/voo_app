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

                when (call.method) {
                    SETUP_METHOD -> {
                        val args = call.arguments as Map<*, *>
                        val driverId = args[DRIVER_ID]
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

                    TURN_ON -> {
                        turnOn()
                    }

                    ACCEPT_REQUEST -> {
                        val args = call.arguments as Map<*, *>
                        val tripId = args[TRIP_ID]?.toString()
                        if (tripId != null) acceptRequest(tripId)
                    }

                    CANCEL_REQUEST -> {
                        cancelRequest()
                    }

                    START_TRIP -> {
                        val args = call.arguments as Map<*, *>
                        val tripId = args[TRIP_ID]?.toString()
                        tripId?.let {
                            startTrip(tripId)
                        } ?: run {
                            println(">>> trip id is null")
                        }
                    }

                    END_TRIP -> {
                        endTrip()
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

    private fun turnOn() {
        val turnOnCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> driver ready for a trip")
                } else {
                    println(">>> driver ready for a trip has an error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }
        requestP1(turnOnCallback)
    }

    private fun acceptRequest(tripId: String) {
        val acceptRequestCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> driver has accept the request: $tripId")
                } else {
                    println(">>> accept request has an error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }
        requestP2(tripId, acceptRequestCallback)
    }

    private fun cancelRequest() {
        val cancelReqCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> driver canceled request")
                } else {
                    println(">>> cancel request has an error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }
        requestP1(cancelReqCallback)
    }

    private fun startTrip(tripId: String) {
        val startTrackingCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> trip started  successfully")
                } else {
                    println(">>> trip started fairmatic error: $result")
                }
            }
        }
        requestP3(tripId, startTrackingCallback)
    }

    private fun endTrip() {
        val endTripCallback = object : FairmaticOperationCallback {
            override fun onCompletion(result: FairmaticOperationResult) {
                if (result is FairmaticOperationResult.Success) {
                    println(">>> driver end trip")
                } else {
                    println(">>> end trip has an error: ${(result as FairmaticOperationResult.Failure).errorMessage}")
                }
            }
        }
        requestP1(endTripCallback)
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

        requestStop(stopTripCallback)

    }

    private fun requestP3(tripId: String, callback: FairmaticOperationCallback) {
        Fairmatic.startDriveWithPeriod3(context, tripId, callback)
    }

    private fun requestP2(tripId: String, callback: FairmaticOperationCallback) {

        Fairmatic.startDriveWithPeriod2(context, tripId, callback)
    }

    private fun requestP1(callback: FairmaticOperationCallback) {
        Fairmatic.startDriveWithPeriod1(context, callback)
    }

    private fun requestStop(callback: FairmaticOperationCallback) {
        Fairmatic.stopPeriod(context, callback)
    }

    companion object {
        private const val FAIRMATIC_CHANNEL = "fairmatic_channel"

        private const val SETUP_METHOD = "setup"
        private const val START_TRIP = "startTrip"
        private const val END_TRIP = "endTrip"
        private const val TURN_OFF = "turnOff"
        private const val TURN_ON = "turnON"
        private const val ACCEPT_REQUEST = "acceptRequest"
        private const val CANCEL_REQUEST = "cancelRequest"

        private const val DRIVER_NAME = "driver_name"
        private const val DRIVER_ID = "driver_id"
        private const val DRIVER_EMAIL = "driver_email"
        private const val DRIVER_PHONE = "driver_phone"

        private const val TRIP_ID = "trip_id"

        private const val SDK_KEY = "Zi7SdPnVwnmhYPVKcYrvCUUdyNEpU2kQ"
    }

}
