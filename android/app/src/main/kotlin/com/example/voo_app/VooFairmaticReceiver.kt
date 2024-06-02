package com.example.voo_app

import android.content.Context
import com.fairmatic.sdk.classes.AccidentInfo
import com.fairmatic.sdk.classes.AnalyzedDriveInfo
import com.fairmatic.sdk.classes.DriveResumeInfo
import com.fairmatic.sdk.classes.DriveStartInfo
import com.fairmatic.sdk.classes.EstimatedDriveInfo
import com.fairmatic.sdk.classes.FairmaticBroadcastReceiver

class VooFairmaticReceiver : FairmaticBroadcastReceiver() {
    override fun onAccident(context: Context, accidentInfo: AccidentInfo?) {
        println(">>> on Accident")
    }

    override fun onDriveAnalyzed(context: Context, analyzedDriveInfo: AnalyzedDriveInfo?) {
        println(">>> on Driver Analyzed")
    }

    override fun onDriveEnd(context: Context, estimatedDriveInfo: EstimatedDriveInfo?) {
        println(">>> on Driver Ended")
    }

    override fun onDriveResume(context: Context, driveResumeInfo: DriveResumeInfo?) {
        println(">>> on Driver Resumed")
    }

    override fun onDriveStart(context: Context, driveStartInfo: DriveStartInfo?) {
        println(">>> on Driver Started")
    }

    override fun onFairmaticSettingsConfigChanged(
        context: Context,
        errorsFound: Boolean,
        warningsFound: Boolean
    ) {
        println(">>> on Setting Changed")
    }
}