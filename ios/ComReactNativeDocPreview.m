#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ComReactNativeDocPreview, NSObject)

RCT_EXTERN_METHOD(show:(NSString)inputUrl
                  fileName:(NSString)fileName
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject
                  )

@end
