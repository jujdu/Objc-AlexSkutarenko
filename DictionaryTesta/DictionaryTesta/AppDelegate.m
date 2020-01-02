//
//  AppDelegate.m
//  DictionaryTesta
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSDictionary* dic = [[NSDictionary alloc]initWithObjectsAndKeys:
                         @"Petrove", @"lastName",
                         @"Vasily", @"name",
                         [NSNumber numberWithInt:25], @"age",
                         nil];
    
    NSDictionary* dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"Petrove", @"lastName",
                          @"Vasily", @"name",
                          [NSNumber numberWithInt:25], @"age",
                          nil];
    
    NSInteger number = 26;
    
    NSDictionary* dic3 = @{@"lastName": @"Petrov",
                           @"name": @"Vasy",
                           @"age": @(number)}; //or @25 as NSNumber
    
    NSLog(@"%@, \n count = %d", dic3, [dic3 count]);
    
    NSLog(@"name = %@, lastName = %@, age = %d",
          [dic objectForKey:@"name"],
          [dic objectForKey:@"lastName"],
          [[dic objectForKey:@"age"] intValue]);
    
    for (NSString* key in [dic3 allKeys]) {
        id obj = [dic3 objectForKey:key];
        NSLog(@"key = %@, obj = %@", key, obj);
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
