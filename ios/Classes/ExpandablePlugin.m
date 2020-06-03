#import "ExpandablePlugin.h"
#if __has_include(<expandable/expandable-Swift.h>)
#import <expandable/expandable-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "expandable-Swift.h"
#endif

@implementation ExpandablePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftExpandablePlugin registerWithRegistrar:registrar];
}
@end
