import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});
  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final voices = ['ผู้หญิงสุภาพ', 'ผู้ชายสุภาพ', 'เสียงน่ารัก', 'เสียงเข้ม'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เสียงภาษาไทย')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        const Text('เสียงภาษาไทย ใช้ได้ตั้งแต่แพ็กเกจแรก', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...voices.map((v) => RadioListTile(value: v, groupValue: TtsService.voice, onChanged: (val) => setState(() => TtsService.voice = val.toString()), title: Text('$v - เสียงภาษาไทย'))),
        const SizedBox(height: 12),
        const Text('ข้อความที่จะพูด: เงินเข้า 350 บาท เท่านั้น ไม่พูดชื่อ ไม่พูดช่องทาง'),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: () => TtsService.testVoice(), child: const Text('ทดลองฟังเสียงไทย')),
        const SizedBox(height: 12),
        const Text('ถ้าเครื่องไม่มีเสียงไทย: ตั้งค่า > ภาษา > เพิ่มภาษาไทย > เปิด Text-to-speech'),
      ]),
    );
  }
}
