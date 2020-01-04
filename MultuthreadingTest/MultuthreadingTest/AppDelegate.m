//
//  AppDelegate.m
//  MultuthreadingTest
//
//  Created by Michael Sidoruk on 04.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong, nonatomic) NSMutableArray *array;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self performSelectorInBackground:@selector(testThread) withObject:nil];
    
//    [[NSThread currentThread] isMainThread];
//
//    for (int i = 0; i < 100; i++) {
//        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(testThread) object:nil];
//        thread.name = [NSString stringWithFormat:@"Thread %d", i + 1];
//        [thread start];
//    }
//
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(testThread) object:nil];
//    [thread start];
//    self.array = [NSMutableArray array];
//
//    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(addStringToArray:) object:@"x"];
//    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(addStringToArray:) object:@"0"];
//    thread1.name = @"Thread 1";
//    thread2.name = @"Thread 2";
//
//    [thread1 start];
//    [thread2 start];
//
//    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
//    dispatch_async(queue, ^{
//        double startTime = CACurrentMediaTime();
//
//        NSLog(@"%@ started", [[NSThread currentThread] name]);
//        for (int i = 0; i < 2000000000; i++) {
//        }
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
//        });
//    });
    
    self.array = [NSMutableArray array];

    __weak id weakSelf = self;
    
    dispatch_async(queue, ^{
        [weakSelf addStringToArray:@"X"];
    });
    
    dispatch_async(queue, ^{
        [weakSelf addStringToArray:@"0"];
    });
    
    [self performSelector:@selector(printArray) withObject:nil afterDelay:3];

    return YES;
}

- (void) printArray {
    NSLog(@"%@", self.array);
}

- (void) testThread {
    @autoreleasepool {
        
        double startTime = CACurrentMediaTime();
        
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        for (int i = 0; i < 20000; i++) {
//            NSLog(@"%d", i);
        }
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
}

- (void) addStringToArray:(NSString *)string {
    @autoreleasepool {
        double startTime = CACurrentMediaTime();
        NSLog(@"%@ started", [[NSThread currentThread] name]);
        
//        @synchronized (self) {
            NSLog(@"%@ calculation started", [[NSThread currentThread] name]);
            for (int i = 0; i < 200; i++) {
                [self.array addObject:string];
            }
            NSLog(@"%@ calculation finished", [[NSThread currentThread] name]);
//        }
        NSLog(@"%@ finished in %f", [[NSThread currentThread] name], CACurrentMediaTime() - startTime);
    }
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
