import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'tts_service.dart';

// Foreground Service = พับแอป / ล็อกจอแล้วเสียงยังดัง ใช้เฉพาะ Pro
class BackgroundService {
  static Future<void> init() async {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'money_voice_bg',
        channelName: 'Money Voice กำลังฟังยอดเงิน',
        channelDescription: 'พับแอปได้เลย เสียงยังดังอยู่',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
      ),
      iosNotificationOptions: const IOSNotificationOptions(showNotification: true),
      foregroundTaskOptions: const ForegroundTaskOptions(interval: 5000, isOnceEvent: false, autoRunOnBoot: true),
    );
  }

  static Future<void> start() async {
    if (await FlutterForegroundTask.isRunningService) return;
    await FlutterForegroundTask.startService(
      notificationTitle: 'Money Voice กำลังทำงาน',
      notificationText: 'พับแอปได้เลย เสียงยังดังอยู่',
      callback: startCallback,
    );
  }

  static Future<void> stop() async {
    await FlutterForegroundTask.stopService();
  }
}

@pragma('vm:entry-point')
void startCallback() {
  FlutterForegroundTask.setTaskHandler(MoneyVoiceTaskHandler());
}

class MoneyVoiceTaskHandler extends TaskHandler {
  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    await TtsService.init();
  }
  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {}
  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {}
  @override
  void onButtonPressed(String id) {}
  @override
  void onNotificationPressed() {}
}
