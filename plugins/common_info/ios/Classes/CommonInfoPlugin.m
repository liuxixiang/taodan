#import "CommonInfoPlugin.h"
#if __has_include(<common_info/common_info-Swift.h>)
#import <common_info/common_info-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "common_info-Swift.h"
#endif

@implementation CommonInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCommonInfoPlugin registerWithRegistrar:registrar];
}
@end
