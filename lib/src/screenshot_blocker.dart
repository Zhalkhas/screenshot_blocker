import 'package:screenshot_blocker/src/screenshot_blocker_impl.dart';

abstract class ScreenshotBlocker {
  static ScreenshotBlockerImpl get _instance => ScreenshotBlockerImpl();

  factory ScreenshotBlocker() => _instance;

  Future<bool> get isBlocked;

  Future<void> blockWindow();

  Future<void> unblockWindow();
}
