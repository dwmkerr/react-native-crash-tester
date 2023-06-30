#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CrashTester, NSObject)

RCT_EXTERN_METHOD(nativeCrash:(NSString *)message)

RCT_EXPORT_METHOD(nativeException:(NSString *)message) {
  NSLog(@"Raising test exception");
  [NSException raise:@"Native Exception" format:@"%@", [message description]];
}

RCT_EXPORT_METHOD(blockUIThread:(NSNumber *)sleepTimeSeconds) {
  //  Dispatch this work on the main thread - that'll block the UI.
  dispatch_async(dispatch_get_main_queue(), ^{
    //  Convert our sleep time seconds into an interval, then block the thread.
    NSTimeInterval timeInterval = [sleepTimeSeconds doubleValue];
    [NSThread sleepForTimeInterval:timeInterval];
  });
}

@end
