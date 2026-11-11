package com.moneyvoice.app

import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification

// อ่านแค่ข้อความแจ้งเตือนจากแอปธนาคารที่ผู้ใช้อนุญาต
// ไม่เก็บรหัสผ่าน ไม่ดึงข้อมูลจากธนาคารโดยตรง
class MoneyNotificationListener : NotificationListenerService() {
    override fun onNotificationPosted(sbn: StatusBarNotification?) {
        val pkg = sbn?.packageName ?: return
        val extras = sbn.notification.extras
        val title = extras.getString("android.title") ?: ""
        val text = extras.getString("android.text") ?: ""
        // ส่งไป Flutter ให้ NotificationParser.parse() ตัดสินว่าเป็นยอดเงินหรือไม่
    }
    override fun onNotificationRemoved(sbn: StatusBarNotification?) {}
}
