//
//  AppDelegate.m
//  DelegateTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASDoctor.h"
#import "ASPatient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ASPatient* patient1 = [[ASPatient alloc]init];
    patient1.name = @"Patient1";
    patient1.temperature = 36.6f;
    
    ASPatient* patient2 = [[ASPatient alloc]init];
    patient2.name = @"Patient2";
    patient2.temperature = 40.8f;
    
    ASPatient* patient3 = [[ASPatient alloc]init];
    patient3.name = @"Patient3";
    patient3.temperature = 37.1f;
    
    ASPatient* patient4 = [[ASPatient alloc]init];
    patient4.name = @"Patient4";
    patient4.temperature = 38.f;
    
    ASDoctor* doctor1 = [[ASDoctor alloc]init];
    
    patient1.delegate = doctor1;
    patient2.delegate = doctor1;
    patient3.delegate = doctor1;
    patient4.delegate = doctor1;
    
    NSLog(@"%@ are ok? %@", patient1.name, [patient1 howAreU] ? @"YES" : @"NO");
    NSLog(@"%@ are ok? %@", patient2.name, [patient2 howAreU] ? @"YES" : @"NO");
    NSLog(@"%@ are ok? %@", patient3.name, [patient3 howAreU] ? @"YES" : @"NO");
    NSLog(@"%@ are ok? %@", patient4.name, [patient4 howAreU] ? @"YES" : @"NO");
    


    
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
