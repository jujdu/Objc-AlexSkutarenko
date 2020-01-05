//
//  AppDelegate.m
//  BitsTest
//
//  Created by Michael Sidoruk on 05.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    ASStudent *student = [[ASStudent alloc]init];
    
//    student.studiesAnatomy = YES;
//    student.studiesDevelopment = YES;
//    student.studiesEngineering = YES;
//    student.studiesMath = YES;
//    student.studiesArt = NO;
//    student.studiesBiology = NO;
    
    ASStudent *student = [[ASStudent alloc]init];
    student.subjectType = ASStudentSubjectTypeAnatomy | ASStudentSubjectTypeDevelopment |           ASStudentSubjectTypeEngineering | ASStudentSubjectTypeMath; // <- составляем битовую маску путем битового сложения; Потом если нам нужно узнать тру или нет, делаем битовое умножение (subjectType && ASStudentSubjectTypeMath). Еслии результат больше 0, то тру.
    
    NSLog(@"%@", student);
    
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
