# screenshot_blocker

Blocks screenshots on selected screens

## Usage

Import plugin into your project

```dart
import 'package:screenshot_blocker/screenshot_blocker.dart';
```

Then simply put ```ScreenshotBlock``` widget onto the page which should be blocked.

```dart
class NoScreenshotPage extends StatelessWidget {
  const NoScreenshotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenshotBlock(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('No screenshots page'),
        ),
        body: const Center(
          child: Text('Cannot take screenshot here'),
        ),
      ),
    );
  }
}

```

If you want to use plugin directly, you can call ```ScreenshotBlocker``` directly.
It can block, unblock and get window status
