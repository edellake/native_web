#import "NativeWebPlugin.h"
#import "FlutterWeb.h"

@implementation NativeWebPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterWebFactory* webviewFactory =
      [[FlutterWebFactory alloc] initWithMessenger:registrar.messenger];
  [registrar registerViewFactory:webviewFactory withId:@"nativeweb"];
}

@end