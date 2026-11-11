package com.moneyvoice.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

// หลังปิด-เปิดเครื่อง ต้องเปิด Foreground Service ขึ้นมาใหม่เอง
// ไม่งั้น Android จะไม่เปิดแอปให้เอง
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        if (intent?.action == Intent.ACTION_BOOT_COMPLETED) {
            val prefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            val isPro = prefs.getBoolean("flutter.isPro", false)
            // เปิด service ใหม่เฉพาะถ้าเคยเป็น Pro เท่านั้น
            // ถ้าเป็นฟรี ไม่ต้องเปิด เพราะฟรีทำงานแค่ตอนเปิดแอปค้างไว้
            if (isPro) {
                val serviceIntent = Intent(context, MoneyVoiceForegroundService::class.java)
                context.startForegroundService(serviceIntent)
            }
        }
    }
}
