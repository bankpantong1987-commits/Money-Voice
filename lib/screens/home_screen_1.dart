import 'package:flutter/material.dart';
import '../services/tts_service.dart';
import '../services/background_service.dart';
import '../services/billing_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListening = true;
  int todayIncome = 0;
  int todayOutcome = 0;
  final List<String> history = [];

  void _simulate(bool income) async {
    final amount = income ? 350 : 120;
    await TtsService.speakAmount(isIncome: income, amount: amount);
    setState(() {
      if (income) todayIncome += amount; else todayOutcome += amount;
      history.insert(0, '${income ? 'เงินเข้า' : 'เงินออก'} $amount บาท');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Money Voice')),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Card(child: ListTile(title: const Text('ยอดวันนี้'), subtitle: Text('เข้า $todayIncome บาท / ออก $todayOutcome บาท'), trailing: Switch(value: isListening, onChanged: (v) => setState(() => isListening = v)))),
        const SizedBox(height: 12),
        if (!BillingService.isPro)
          const Card(color: Color(0xFFFFF8E1), child: ListTile(title: Text('แพ็กเกจฟรี'), subtitle: Text('ใช้ได้เฉพาะตอนเปิดแอปค้างไว้ ถ้าพับแอปเสียงจะไม่ดัง'))),
        if (BillingService.isPro)
          Card(color: Colors.green.shade50, child: ListTile(title: const Text('PRO กำลังทำงานเบื้องหลัง'), subtitle: const Text('พับแอปได้เลย เสียงยังดังอยู่'), trailing: ElevatedButton(onPressed: BackgroundService.start, child: const Text('เปิดเบื้องหลัง')))),
        const SizedBox(height: 12),
        Row(children: [Expanded(child: ElevatedButton(onPressed: () => _simulate(true), child: const Text('จำลองเงินเข้า'))), const SizedBox(width: 12), Expanded(child: OutlinedButton(onPressed: () => _simulate(false), child: const Text('จำลองเงินออก')))]),
        const SizedBox(height: 16),
        const Text('ประวัติ', style: TextStyle(fontWeight: FontWeight.bold)),
        ...history.map((h) => ListTile(title: Text(h))),
      ]),
    );
  }
}
