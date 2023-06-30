#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CrashTester, NSObject)

RCT_EXTERN_METHOD(nativeCrash:(NSString *)message)

RCT_EXPORT_METHOD(nativeException:(NSString *)message) {
  NSLog(@"Raising test exception");
  [NSException raise:@"Native Exception" format:@"%@", [message description]];
}

RCT_EXPORT_METHOD(blockUIThread:(RCTResponseSenderBlock)callback) {
  //https://stackoverflow.com/questions/29691046/purpose-of-running-dispatch-asyncdispatch-get-main-queue-on-ui-thread
  dispatch_async(dispatch_get_main_queue(), ^{
    [NSThread sleepForTimeInterval:60.0f];
    callback(@[60.0f]);
  });
}

@end
