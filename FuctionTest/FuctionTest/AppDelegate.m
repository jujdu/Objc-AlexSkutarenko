//
//  AppDelegate.m
//  FuctionTest
//
//  Created by Michael Sidoruk on 31.12.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASParentClass.h"
#import "ASChildClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    ASChildClass* child = [[ASChildClass alloc] init]; //потому что у нас не существует объекта, поэтому требуется его создать через метод класса (static). Потом методом объекта инициализируем объект.
    //alloc выделят память для объекта
    //init инициализирует объект
    [child sayHello];
    [child say:@"How are you?"];
    [child say:@"third method" and:@"awesome"];
    [child say:@"same" :@"but withoutAnd"];
    [child say:@"wow" and:@"another awesome" andAfterThat:@"string"];
    NSLog(@"%@", [child saySomething]);
    [ASChildClass whoAreYou];
    
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
