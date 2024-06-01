package com.example.voo_app

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import androidx.core.app.NotificationCompat
import com.zendrive.sdk.ZendriveNotificationContainer
import com.zendrive.sdk.ZendriveNotificationProvider


class VooZendriveNotificationProvider : ZendriveNotificationProvider {

    private fun createNotification(content: String, context: Context): Notification {
        createNotificationChannels(context)
        val notification = NotificationCompat.Builder(context, FOREGROUND_CHANNEL_KEY)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle("Voo")
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .setContentText(content).build()
        return notification
    }

    private fun createNotificationChannels(context: Context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val manager = context.getSystemService(
                NotificationManager::class.java
            )
            val foregroundNotificationChannel = NotificationChannel(
                FOREGROUND_CHANNEL_KEY, "voo trip tracking",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            foregroundNotificationChannel.setShowBadge(false)
            val issuesNotificationChannel = NotificationChannel(
                ISSUES_CHANNEL_KEY, "Issues",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            issuesNotificationChannel.setShowBadge(true)

            if (manager != null) {
                manager.createNotificationChannel(foregroundNotificationChannel)
                manager.createNotificationChannel(issuesNotificationChannel)
            }
        }
    }

    override fun getWaitingForDriveNotificationContainer(context: Context): ZendriveNotificationContainer {
        createNotificationChannels(context)
        val notification = createNotification("waiting for Drive", context)
        return ZendriveNotificationContainer(ZENDRIVE_NOTIFICATION_ID, notification)
    }

    override fun getMaybeInDriveNotificationContainer(context: Context): ZendriveNotificationContainer {
        createNotificationChannels(context)
        val notification = createNotification("Detecting Possible Drive", context)
        return ZendriveNotificationContainer(ZENDRIVE_NOTIFICATION_ID, notification)
    }

    override fun getInDriveNotificationContainer(context: Context): ZendriveNotificationContainer {
        createNotificationChannels(context)
        val notification = createNotification("Drive Active.", context)
        return ZendriveNotificationContainer(ZENDRIVE_NOTIFICATION_ID, notification)
    }


    companion object {
        private var ZENDRIVE_NOTIFICATION_ID: Int = 495
        private var FOREGROUND_CHANNEL_KEY: String = "Voo_channel"
        private var ISSUES_CHANNEL_KEY: String = "Voo_issues_channel"

    }
}