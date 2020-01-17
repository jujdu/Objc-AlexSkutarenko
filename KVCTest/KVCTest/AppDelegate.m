//
//  AppDelegate.m
//  KVCTest
//
//  Created by Michael Sidoruk on 17.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"
#import "Group.h"

@interface AppDelegate ()
@property (strong, nonatomic) Student *student;
@property (strong, nonatomic) NSArray *groups;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    Student *student1 = [[Student alloc]init];
    student1.name = @"Michael";
    student1.age = 25;
    
    Student *student2 = [[Student alloc]init];
    student2.name = @"Alex";
    student2.age = 30;
    
    Student *student3 = [[Student alloc]init];
    student3.name = @"Maya";
    student3.age = 19;
    
    Student *student4 = [[Student alloc]init];
    student4.name = @"Fred";
    student4.age = 41;
    
    Group *group = [[Group alloc] init];
    group.students = @[student1, student2, student3, student4];
    
    Student *student5 = [[Student alloc]init];
    student5.name = @"SAdas";
    student5.age = 19;
    
    Student *student6 = [[Student alloc]init];
    student6.name = @"TWEsa";
    student6.age = 41;
    
    Group *group2 = [[Group alloc] init];
    group2.students = @[student5, student6];
    
    self.groups = @[group, group2];
    
    NSLog(@"groups count %@", [self valueForKeyPath:@"groups.@count"]);
    
    NSArray *allStudens = [self valueForKeyPath:@"groups.@distinctUnionOfArrays.students"];
    NSLog(@"all students = %@", allStudens);
    
    NSNumber *minAge = [allStudens valueForKeyPath:@"@min.age"];
    NSNumber *maxAge = [allStudens valueForKeyPath:@"@max.age"];
    NSNumber *sumAge = [allStudens valueForKeyPath:@"@sum.age"];
    NSNumber *avgAge = [allStudens valueForKeyPath:@"@avg.age"];

    NSLog(@"minAge = %@", minAge);
    NSLog(@"maxAge = %@", maxAge);
    NSLog(@"sumAge = %@", sumAge);
    NSLog(@"avgAge = %@", avgAge);
    
    NSArray *allNames = [allStudens valueForKeyPath:@"@distinctUnionOfObjects.name"];

    NSLog(@"all names = %@", allNames);

//    self.student = student1;
    
//    NSString *name = @"Mic123";
////    NSNumber *name = @6;
//    NSError *error = nil;
//
//    NSLog(@"name = %@", [self valueForKeyPath:@"student"]);
//
//    if (![self.student validateValue:&name forKey:@"name" error:&error]) {
//        NSLog(@"%@",error.localizedDescription);
//    }
    
    
//    NSLog(@"%@", group.students);
//
//    [group addObserver:self
//            forKeyPath:@"students"
//               options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
//               context:nil];
//
//    NSMutableArray *array = [group mutableArrayValueForKey:@"students"];
//
//    [array removeLastObject];
//
//    NSLog(@"%@", array);
    
//    self.student = student;
//
//    [self.student addObserver:self
//                   forKeyPath:@"name"
//                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
//                      context:nil];
//
//    student.name = @"Michael";
//    student.age = 25;
//
//    NSLog(@"%@\n", student);
//
//    [student setName:@"Mike"];
//    student.age = 24;
//
//    NSLog(@"%@\n", student);
//
//    [student setValue:@"Misha" forKeyPath:@"name"];
//    [student setValue:@26 forKeyPath:@"age"];
//
////    NSLog(@"name1 = %@, name2 = %@", student.name, [student valueForKey:@"name"]);
//
//    NSLog(@"%@\n", student);
//
//    [student changeName];
//    NSLog(@"%@\n", student);
    
    return YES;
}

- (void)dealloc {
    [self.student removeObserver:self forKeyPath:@"name"];
}

#pragma mark - Observing

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    NSLog(@"observeValueForKeyPath: %@\nofObject: %@\nchange: %@", keyPath, object, change);
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
