//
//  AppDelegate.m
//  SelectorTest
//
//  Created by Michael Sidoruk on 03.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.]
    
    //selector - указатель на метод. Или имя метода.
//
//    ASObject *object = [[ASObject alloc]init];
//
////    [self testMethod];
//    SEL selector1 = @selector(testMethod);
////    SEL selector2 = @selector(testMethod:);
////    SEL selector3 = @selector(testMethod:paramenter2:);
//
//
////    [self performSelector:selector2 withObject:@"test string"];
////    [self performSelector:selector3 withObject:@"test string" withObject:@"second parametr"];
////
////    [self performSelector:selector1 withObject:nil afterDelay:5];
//
//    [self performSelector:selector1];
//    [object performSelector:selector1];
//    [self performSelector:@selector(testMethodWithInt:) withObject:[NSNumber numberWithInt:5]];
//
//    NSString *data = [object performSelector:@selector(secretText)];
//    NSLog(@"secret: %@", data);
//
//    NSString *string1 = NSStringFromSelector(selector1);
//    SEL sel = NSSelectorFromString(string1);
//
//    NSString * string = [self testMethodWithPrimitive:2 paramenter2:3.5f paramenter3:4.1f];
//    NSLog(@"%@", string);
    SEL sel = @selector(testMethodWithPrimitive:paramenter2:paramenter3:);
    
    NSMethodSignature *signature = [AppDelegate instanceMethodSignatureForSelector:sel];
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setTarget:self];
    [invocation setSelector:sel];
    
    NSInteger iVal = 2;
    CGFloat fVal = 3.1f;
    double dVal = 4.5f;
    
    NSInteger *p1 = &iVal;
    CGFloat *p2 = &fVal;
    double *p3 = &dVal;
    
    [invocation setArgument:p1 atIndex:2];
    [invocation setArgument:p2 atIndex:3];
    [invocation setArgument:p3 atIndex:4];
    
    
    [invocation invoke];
    
    return YES;
}


- (void) testMethod {
    NSLog(@"testMethod");
}

- (void) testMethod:(NSString *) string {
    NSLog(@"testMethod: %@", string);
}

- (void) testMethod:(NSString *) string paramenter2:(NSString *) string2 {
    NSLog(@"testMethod:paramenter2 %@, %@", string, string2);
}

- (void) testMethodWithInt:(NSInteger *) intValue {
    NSLog(@"testMethod, %d", intValue);
}

- (NSString *) testMethodWithPrimitive:(NSInteger) intValue paramenter2:(CGFloat) floatValue paramenter3:(double) doubleValue {
    return [NSString stringWithFormat:@"testMethodWithPrimitive, param1: %d, param2: %f, param3: %f", intValue, floatValue, doubleValue];
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
