import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Google Play Billing - ต้องใช้ตัวนี้เท่านั้น ห้ามจ่ายนอกแอป
class BillingService {
  static const monthlyId = 'money_voice_monthly'; // 30 บาท/เดือน
  static const yearlyId = 'money_voice_yearly'; // 249 บาท/ปี
  static const trialDays = 3;
  static bool isPro = false;
  static String plan = 'free';

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    isPro = prefs.getBool('isPro') ?? false;
    plan = prefs.getString('plan') ?? 'free';
    final available = await InAppPurchase.instance.isAvailable();
    if (available) {
      await InAppPurchase.instance.queryProductDetails({monthlyId, yearlyId});
    }
  }
}
