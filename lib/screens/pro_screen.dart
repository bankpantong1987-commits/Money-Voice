import 'package:flutter/material.dart';

class ProScreen extends StatelessWidget {
  const ProScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สมัคร Pro')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('Pro: ทำงานเบื้องหลังได้ พับแอปก็ยังบอกยอด', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text('นอกนั้นเหมือนฟรีทุกอย่าง แค่ช่วยสนับสนุนแอป + ไม่มีโฆษณา'),
        const SizedBox(height: 16),
        Card(child: ListTile(title: const Text('รายเดือน 30 บาท/เดือน'), subtitle: const Text('ทดลองใช้ฟรี 3 วัน'), trailing: ElevatedButton(onPressed: () {}, child: const Text('สมัคร')))),
        Card(child: ListTile(title: const Text('รายปี 249 บาท/ปี'), subtitle: const Text('คุ้มสุด ประหยัด 111 บาท - ทดลองใช้ฟรี 3 วัน'), trailing: ElevatedButton(onPressed: () {}, child: const Text('สมัคร')))),
        const SizedBox(height: 12),
        const Text('หลังจากนั้น 30 บาท/เดือน หรือ 249 บาท/ปี ยกเลิกได้ทุกเมื่อ', style: TextStyle(color: Colors.grey)),
        const Text('ชำระผ่าน Google Play Billing เท่านั้น', style: TextStyle(color: Colors.grey)),
      ]),
    );
  }
}
