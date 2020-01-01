//
//  AppDelegate.m
//  ArraysTest
//
//  Created by Michael Sidoruk on 01.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASObject.h"
#import "ASChildObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSArray* array = [[NSArray alloc] initWithObjects:@"string1", @"string2", @"string3", nil];
//    NSArray* array = [NSArray arrayWithObjects:@"string1", @"string2", @"string3", nil];
    
//    NSArray* array = @[@"string1",
//                       @"string2",
//                       @"string3"];
    
//    for (int i = 0; i < [array count]; i++) {
//        NSLog(@"%@", [array objectAtIndex:i]);
//        NSLog(@"i = %d", i);
//    }
    
//    for (int i = [array count] - 1; i >= 0 ; i--) {
//        NSLog(@"%@", [array objectAtIndex:i]);
//        NSLog(@"i = %d", i);
//    }
    
//    for (NSString* string in array) {
//        NSLog(@"%@", string);
//        NSLog(@"index of object: %d", [array indexOfObject:string]);
//    }
    
    ASObject* object1 = [[ASObject alloc] init];
    ASObject* object2 = [[ASObject alloc] init];
    ASChildObject* object3 = [[ASChildObject alloc] init];
    
    [object1 setName:@"Object 1"];
    object2.name = @"Object 2";
    [object3 setName:@"Object 3"];
    [object3 setLastName:@"LastName"];

    NSArray* array = [NSArray arrayWithObjects:object1, object2, object3, nil];
    
    for (ASObject* object in array) {
        NSLog(@"name = %@", [object name]);
        [object action];
        
        if ([object isKindOfClass:[ASChildObject class]]) {
            
            ASChildObject* child = (ASChildObject*)object;

            NSLog(@"lastName = %@", (ASChildObject*)[child lastName]);
        }
    }
    return YES;
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
