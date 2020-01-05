//
//  AppDelegate.m
//  NSDateTest
//
//  Created by Michael Sidoruk on 05.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//
//    NSDate *date = [NSDate date];
//
//    NSLog(@"%@", date);
//
//    NSLog(@"%@", [date dateByAddingTimeInterval:10]);
//    NSLog(@"%@", [date dateByAddingTimeInterval:5000]);
//
//    [date compare:[date dateByAddingTimeInterval:5000]];
//    [date earlierDate:[date dateByAddingTimeInterval:5000]];
//
//    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:5];
//    NSLog(@"%@", date2);
    
//    NSDate *date = [NSDate date];
////    NSLog(@"%@", date);
//
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////
//    [formatter setDateStyle:NSDateFormatterShortStyle];
//    NSLog(@"%@", [formatter stringFromDate:date]);
//
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    NSLog(@"%@", [formatter stringFromDate:date]);
//
//    [formatter setDateStyle:NSDateFormatterLongStyle];
//    NSLog(@"%@", [formatter stringFromDate:date]);
//
//    [formatter setDateStyle:NSDateFormatterFullStyle];
//    NSLog(@"%@", [formatter stringFromDate:date]);
    
//    [formatter setDateFormat:@"yyyy M MM MMM MMMM MMMMM"];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
//    NSLog(@"%@", [dateFormatter stringFromDate:date]);
//
//    NSDate *date3 = [dateFormatter dateFromString:@"2020-01-05 06:56 PM"];
//    NSLog(@"%@", date3);
    
//    NSDate *date1 = [NSDate date];
//    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-1005000];
//
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//
//    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:date];
//
//    NSLog(@"%@", components);
//
//    NSInteger hours = [components hour];
//    NSDate *date1 = [NSDate date];
//    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-1000000];
//
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//
//    NSDateComponents *components = [calendar components:NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date2 toDate:date1 options:0];
//    NSLog(@"%@", components);

    
    ASObject *obj = [[ASObject alloc] init];
    
    
    
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
