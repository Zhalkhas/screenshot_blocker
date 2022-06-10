import 'package:flutter/material.dart';
import 'package:screenshot_blocker/screenshot_blocker.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('ScreenshotBlocker'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Can take screenshot here'),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NoScreenshotPage(),
                  )),
                  child: const Text('Go to no screenshot page'),
                ),
              ],
            ),
          )),
    );
  }
}

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
