//
//  AppDelegate.m
//  BlocksTest
//
//  Created by Michael Sidoruk on 04.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASObject.h"

typedef void (^OurTestBlock)(void); //typealiece
typedef NSString *(^FromIntToStr)(NSInteger);

@interface AppDelegate ()

@property (copy, nonatomic) OurTestBlock testBlock;
@property (strong, nonatomic) NSString *name;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self testMethod];
//
//    void (^testBlock)(void);
//
//    testBlock = ^{
//        NSLog(@"testBlock");
//    };
//
//    testBlock();
//
////    [self testMethodWithParams:@"hello" value:5];
//
//    void (^testBlockWithParams)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
//        NSLog(@"testBlockWithParams: %@, %d", string, intValue);
//    };
//
//    testBlockWithParams(@"test", 5);
//
//
////    NSString *result = [self testMethodWithReturnValueAndParams:@"test" value:5];
////    NSLog(@"%@", result);
//
//    NSString *(^testBlockWithReturnValueAndParams)(NSString *, NSInteger) = ^(NSString *string, NSInteger intValue) {
//        return [NSString stringWithFormat:@"testBlockWithReturnValueAndParams: %@, %d", string, intValue];
//    };
//
//    NSString *result = testBlockWithReturnValueAndParams(@"test", 15);
//    NSLog(@"%@", result);
//
//    __block NSString *string = @"How is it possible?";
//    __block NSInteger intValue = 0;
//
//    void (^testBlock2)(void);
//
//    testBlock2 = ^{
//        NSLog(@"test block");
//        string = [NSString stringWithFormat:@"How is it possible? %d", ++intValue];
//        NSLog(@"%@", string);
//    };
//
//    testBlock2();
//    testBlock2();
//    testBlock2();
//    testBlock2();
    
//    [self testBlocksMethod:^{
//        NSLog(@"BLOCK");
//    }];
//
//    OurTestBlock testBlock2 = ^{
//        NSLog(@"BLOCK");
//    };
//
//    [self testBlocksMethod2:testBlock2];
//
//    FromIntToStr myBlock = ^(NSInteger inValue){
//        return [NSString stringWithFormat:@"%d", inValue];
//    };
//
//    NSLog(@"here%@", myBlock(5));
    
    self.name = @"hello";
//
    ASObject *obj = [[ASObject alloc]init];
    obj.name = @"obj1";
    
    
    
//    [obj testMethod:^{
//        NSLog(@"%@", self.name);
//    }];
    
    
    
//    __weak ASObject *weakObj = obj;
//
//    self.testBlock = ^{
//        NSLog(@"%@",weakObj.name);
//    };
//
//    self.testBlock();
    
    return YES;
}

//- (void) testMethod {
//    NSLog(@"testMethod");
//}
//
//- (void) testMethodWithParams:(NSString *) string value:(NSInteger) intValue {
//    NSLog(@"%@, %d", string, intValue);
//}
//
//- (NSString *) testMethodWithReturnValueAndParams:(NSString *) string value:(NSInteger) intValue {
//    return [NSString stringWithFormat:@"testMethodWithReturnValueAndParams: %@, %d", string, intValue];
//}

- (void) testBlocksMethod:(void(^)(void)) block {
    NSLog(@"testBlocksMethod");
    block();
}

- (void) testBlocksMethod2:(OurTestBlock) block {
    NSLog(@"testBlocksMethod2");
    block();
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
