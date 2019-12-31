//
//  AppDelegate.m
//  PropertiesTest
//
//  Created by Michael Sidoruk on 31.12.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASBoxer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ASBoxer* boxer = [[ASBoxer alloc] init];
    
//    [boxer setName:@"Misha"];
//    [boxer setAge:25];
//    [boxer setHeight:1.96f];
//    [boxer setWeight:95.f];
    
//    [boxer setNameCount:0];
    
    [boxer name];
    boxer.name;
    
    NSLog(@"name = %@", [boxer name]);
    NSLog(@"age = %ld", (long)[boxer howOldAreYou]);
//    NSLog(@"name = %@", [boxer name]);
//    NSLog(@"age = %ld", [boxer age]);
//    NSLog(@"height = %f", [boxer height]);
//    NSLog(@"weight = %f", [boxer weight]);
    
//    boxer.name = @"Misha";
//    boxer.age = 25;
//    boxer.height = 1.96f;
//    boxer.weight = 85.f;
//
//    NSLog(@"name = %@", boxer.name);
//    NSLog(@"age = %ld", (long)boxer.age);
//    NSLog(@"height = %f", boxer.height);
//    NSLog(@"weight = %f", boxer.weight);
    
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
