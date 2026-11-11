# Money Voice - Flutter (ตัวจริง)
เสียงบอกยอดเงินเข้า-ออก ภาษาไทย พับแอปก็ยังดัง

## ฟีเจอร์
- เสียงไทยตั้งแต่แพ็กเกจแรก พูดแค่ เงินเข้า X บาท / เงินออก X บาท ไม่พูดชื่อ ไม่พูดช่องทาง
- ฟังการแจ้งเตือนจากแอปธนาคาร (NotificationListenerService) ผู้ใช้ต้องกดอนุญาตเอง
- ทำงานเบื้องหลังด้วย Foreground Service เฉพาะ Pro
- Pro: รายเดือน 30 บาท/เดือน + รายปี 249 บาท/ปี ทดลองฟรี 3 วัน ผ่าน Google Play Billing เท่านั้น

## วิธีรัน
flutter pub get
flutter run

## วิธีสร้างไฟล์ลง Play Store
flutter build appbundle --release
ได้ไฟล์ build/app/outputs/bundle/release/app-release.aab

## สิ่งที่ต้องทำต่อก่อนส่งตรวจ
1. สร้าง Product ใน Play Console: money_voice_monthly (30 บาท) / money_voice_yearly (249 บาท) + Trial 3 วัน
2. ใส่ Privacy Policy URL ใน Play Console
3. ขอสิทธิ์ Notification Listener + Foreground Service + อธิบายเหตุผลเป็นภาษาไทยในแอป
4. ถ่ายคลิปสาธิตว่าแอปอ่านแจ้งเตือนแล้วพูดยอดยังไง
5. ทดสอบบนมือถือจริง: พับแอป / ล็อกจอ / ปิด-เปิดเครื่อง แล้วเสียงยังดังไหม
