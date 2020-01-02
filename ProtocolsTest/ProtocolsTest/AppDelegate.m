//
//  AppDelegate.m
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASPatient.h"
#import "ASDeveloper.h"
#import "ASDancer.h"
#import "ASStudent.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ASDancer* dancer1 =[[ASDancer alloc]init];
    ASDancer* dancer2 =[[ASDancer alloc]init];
    
    ASStudent* student1 = [[ASStudent alloc]init];
    ASStudent* student2 = [[ASStudent alloc]init];
    ASStudent* student3 = [[ASStudent alloc]init];
    
    ASDeveloper* developer1 = [[ASDeveloper alloc]init];
    
    dancer1.name = @"Oleg";
    dancer2.name = @"Phill";
    student1.name = @"John";
    student2.name = @"Marry";
    student3.name = @"Amalfi";
    developer1.name = @"Michael";
    
    NSObject* fake = [[NSObject alloc]init];
    
    NSArray* patients = [NSArray arrayWithObjects:fake,dancer2,student1,developer1,student2,dancer1, student3, nil];
    
    for (id <ASPatient> patient in patients) {
        
        if ([patient conformsToProtocol:@protocol(ASPatient)]) {
            NSLog(@"Patient name = %@", [patient name]);
            
            if ([patient respondsToSelector:@selector(howIsUrFamily)]) { // узнать есть ли такой метод
                NSLog(@"how's ur family? \n%@", [patient howIsUrFamily]);
            }
            
            if ([patient respondsToSelector:@selector(howIsUrJob)]) {
                NSLog(@"how's ur job? \n%@", [patient howIsUrJob]);
            }
            
            if (![patient areYouOk]) {
                [patient takePill];
                
                if (![patient areYouOk]) {
                    [patient makeShot];
                }
            }
        } else {
            NSLog(@"doesn't conform %@ protocol", @protocol(ASPatient));
        }
        

    }
    
//    for (int i = 0; patients.count > 0; i++) {
//        id patient = [patients objectAtIndex:i];
//        [patient makeShot];
//    }
    
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
