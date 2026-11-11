import 'package:flutter_tts/flutter_tts.dart';

// พูดแค่ยอดเงินเท่านั้น ไม่พูดชื่อ ไม่พูดช่องทาง
// ตัวอย่าง: เงินเข้า 350 บาท / เงินออก 120 บาท
class TtsService {
  static final FlutterTts _tts = FlutterTts();
  static String voice = 'ผู้หญิงสุภาพ';
  static double rate = 0.55;
  static double volume = 1.0;

  static Future<void> init() async {
    await _tts.setLanguage('th-TH');
    await _tts.setSpeechRate(rate);
    await _tts.setVolume(volume);
    await _tts.setPitch(1.0);
    try {
      final voices = await _tts.getVoices;
      final thai = (voices as List).where((v) => (v['locale'] ?? '').toString().startsWith('th')).toList();
      if (thai.isNotEmpty) {
        await _tts.setVoice({'name': thai.first['name'], 'locale': 'th-TH'});
      }
    } catch (_) {}
  }

  static Future<void> speakAmount({required bool isIncome, required int amount}) async {
    await init();
    final text = isIncome ? 'เงินเข้า $amount บาท' : 'เงินออก $amount บาท';
    await _tts.speak(text);
  }

  static Future<void> testVoice() async {
    await speakAmount(isIncome: true, amount: 350);
  }
}
