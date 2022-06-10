import 'package:flutter/material.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';

/// Blocks screenshots for full window when appear in tree
/// Screenshots can be captured again when widget is disposed
class ScreenshotBlock extends StatefulWidget {
  const ScreenshotBlock({Key? key, this.child = const SizedBox.shrink()})
      : super(key: key);
  final Widget child;

  @override
  State<ScreenshotBlock> createState() => _ScreenshotBlockState();
}

class _ScreenshotBlockState extends State<ScreenshotBlock> {
  final ScreenshotBlocker _screenshotBlocker = ScreenshotBlocker();

  @override
  void initState() {
    _screenshotBlocker.blockWindow();
    super.initState();
  }

  @override
  void dispose() {
    _screenshotBlocker.unblockWindow();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
