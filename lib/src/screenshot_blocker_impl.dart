import 'package:flutter/services.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';

class ScreenshotBlockerImpl implements ScreenshotBlocker {
  final MethodChannel _channel = const MethodChannel('screenshot_blocker');

  @override
  Future<void> blockWindow() => _channel.invokeMethod('blockWindow');

  @override
  Future<void> unblockWindow() => _channel.invokeMethod('unblockWindow');

  @override
  Future<bool> get isBlocked =>
      _channel.invokeMethod('getWindowStatus') as Future<bool>;
}
