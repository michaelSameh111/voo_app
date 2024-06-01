package com.example.voo_app

import android.content.Context
import com.zendrive.sdk.AccidentInfo
import com.zendrive.sdk.AnalyzedDriveInfo
import com.zendrive.sdk.DriveResumeInfo
import com.zendrive.sdk.DriveStartInfo
import com.zendrive.sdk.EstimatedDriveInfo
import com.zendrive.sdk.ZendriveBroadcastReceiver

class VooZendriveReceiver : ZendriveBroadcastReceiver() {
    override fun onDriveStart(p0: Context?, p1: DriveStartInfo?) {
        println("driver start")
    }

    override fun onDriveEnd(p0: Context?, p1: EstimatedDriveInfo?) {
        println("driver end")
    }

    override fun onDriveAnalyzed(p0: Context?, p1: AnalyzedDriveInfo?) {
        println("driver analyzed")
    }

    override fun onDriveResume(p0: Context?, p1: DriveResumeInfo?) {
        println("driver resume")
    }

    override fun onAccident(p0: Context?, p1: AccidentInfo?) {
        println("driver accident")
    }

    override fun onZendriveSettingsConfigChanged(p0: Context?, p1: Boolean, p2: Boolean) {
        println("setting changed")
    }

}