#import "ScreenshotBlockerPlugin.h"
#if __has_include(<screenshot_blocker/screenshot_blocker-Swift.h>)
#import <screenshot_blocker/screenshot_blocker-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "screenshot_blocker-Swift.h"
#endif

@implementation ScreenshotBlockerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftScreenshotBlockerPlugin registerWithRegistrar:registrar];
}
@end
