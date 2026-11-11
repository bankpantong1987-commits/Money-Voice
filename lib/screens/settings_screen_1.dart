import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ตั้งค่า')),
      body: ListView(padding: const EdgeInsets.all(16), children: const [
        ListTile(title: Text('ทำงานเบื้องหลัง (Pro)'), subtitle: Text('พับแอปก็ยังบอกยอด')),
        ListTile(title: Text('สิทธิ์ที่ต้องเปิดสำหรับของจริง')),
        ListTile(title: Text('1. อ่านการแจ้งเตือน'), subtitle: Text('เพื่อเอายอดเงินมาพูด')),
        ListTile(title: Text('2. ไม่จำกัดการใช้แบตเตอรี่'), subtitle: Text('ไม่งั้น Android จะปิดแอปตอนพับ')),
        ListTile(title: Text('3. การแจ้งเตือน'), subtitle: Text('เพื่อแสดงว่ากำลังฟังอยู่')),
        ListTile(title: Text('Privacy Policy'), subtitle: Text('แอปไม่เก็บรหัสผ่านธนาคาร ไม่ดูดเงิน')),
      ]),
    );
  }
}
