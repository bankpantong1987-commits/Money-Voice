import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// หน้าขอสิทธิ์แบบกดทีละปุ่ม - ต้องทำก่อนทดสอบ ไม่งั้นพับแอปแล้วเสียงจะไม่ดัง
/// ลำดับที่ต้องเปิดให้ครบ:
/// 1. อ่านการแจ้งเตือน (Notification Listener)
/// 2. ไม่จำกัดแบตเตอรี่ (Battery Optimization)
/// 3. การแจ้งเตือน (POST_NOTIFICATIONS)
/// 4. ทำงานเบื้องหลัง (Foreground Service - เปิดอัตโนมัติตอนกดเริ่ม Pro)
class PermissionSetupScreen extends StatefulWidget {
  const PermissionSetupScreen({super.key});
  @override
  State<PermissionSetupScreen> createState() => _PermissionSetupScreenState();
}

class _PermissionSetupScreenState extends State<PermissionSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เปิดสิทธิ์ให้ครบก่อนทดสอบ')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('ถ้าเปิดไม่ครบ พับแอป / ล็อกจอแล้วเสียงจะไม่ดัง', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
        const SizedBox(height: 16),
        ListTile(
          title: const Text('1. อ่านการแจ้งเตือน'),
          subtitle: const Text('ตั้งค่า > แอป > Money Voice > การเข้าถึงการแจ้งเตือน > เปิด'),
          trailing: ElevatedButton(onPressed: () => openAppSettings(), child: const Text('เปิด')),
        ),
        ListTile(
          title: const Text('2. ไม่จำกัดแบตเตอรี่'),
          subtitle: const Text('ตั้งค่า > แบตเตอรี่ > ไม่จำกัด หรือ ไม่ปรับให้เหมาะสม'),
          trailing: ElevatedButton(onPressed: () => openAppSettings(), child: const Text('เปิด')),
        ),
        ListTile(
          title: const Text('3. การแจ้งเตือน'),
          subtitle: const Text('อนุญาตให้แอปแสดงการแจ้งเตือน'),
          trailing: ElevatedButton(onPressed: () async => await Permission.notification.request(), child: const Text('ขอสิทธิ์')),
        ),
        ListTile(
          title: const Text('4. ทดสอบโอนเงินจริง'),
          subtitle: const Text('ให้เพื่อนโอนเงิน 1 บาทมาที่พร้อมเพย์ของคุณ แล้วฟังว่าแอปพูดไหม'),
        ),
      ]),
    );
  }
}
