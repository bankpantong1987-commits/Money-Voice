// แปลงข้อความแจ้งเตือนจากแอปธนาคาร -> ยอดเงิน
// อ่านแค่ข้อความแจ้งเตือนที่ผู้ใช้อนุญาตเท่านั้น ไม่ขอรหัสผ่าน
class NotificationParser {
  static ParsedTransfer? parse(String packageName, String title, String text) {
    final full = '$title $text';
    const allowed = ['scb', 'kasikorn', 'krungsri', 'ktb', 'bbl', 'truemoney'];
    if (!allowed.any((p) => packageName.toLowerCase().contains(p))) return null;
    final amountReg = RegExp(r'([0-9,]+\.?[0-9]*)\s*บาท');
    final m = amountReg.firstMatch(full);
    if (m == null) return null;
    final amount = int.tryParse(m.group(1)!.replaceAll(',', '').split('.').first) ?? 0;
    if (amount <= 0) return null;
    final isIncome = full.contains('เงินเข้า') || full.contains('ได้รับเงิน') || full.contains('รับเงิน');
    final isOutcome = full.contains('โอนออก') || full.contains('จ่าย') || full.contains('เงินออก');
    if (!isIncome && !isOutcome) return null;
    return ParsedTransfer(isIncome: isIncome, amount: amount);
  }
}

class ParsedTransfer {
  final bool isIncome;
  final int amount;
  ParsedTransfer({required this.isIncome, required this.amount});
}
