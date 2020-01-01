//
//  AppDelegate.m
//  TypesTest
//
//  Created by Michael Sidoruk on 01.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "ASStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    BOOL boolVar = YES; //1bit
    BOOL boolVar1 = TRUE; //1bit

    NSInteger intVar = 10;
    NSUInteger uIntVar = 100;

    CGFloat floatVar = 10.5f;
    double doubleVar = 1.f;
    //мы не можем добавлять примитивы в массивы напрямую
    
    NSNumber* boolObject = [NSNumber numberWithBool:boolVar];
//    NSNumber* intObject = [NSNumber numberWithInt:intVar];
    NSNumber* intObject = [NSNumber numberWithInteger:intVar];
    NSNumber* uIntObject = [NSNumber numberWithUnsignedInteger:uIntVar];
    NSNumber* floatObject = [NSNumber numberWithFloat:floatVar];
    NSNumber* doubleObject = [NSNumber numberWithDouble:doubleVar];

    
    
    NSArray* array = [NSArray arrayWithObjects:boolObject, intObject, uIntObject, floatObject, doubleObject, nil];
    
    NSLog(@"boolVar = %d, intVar = %d, uIntVar = %u, floatVar = %f, doubleVar = %f",
          [[array objectAtIndex:0] boolValue],
          [[array objectAtIndex:1] integerValue],
          [[array objectAtIndex:2] unsignedIntegerValue],
          [[array objectAtIndex:3] floatValue],
          [[array objectAtIndex:4] doubleValue]);

    
    
//
//    NSLog(@"boolVar = %d, intVar = %d, uIntVar = %u, floatVar = %f, doubleVar = %f", boolVar, intVar, uIntVar, floatVar, doubleVar);
//    NSLog(@"boolVar = %ld, intVar = %ld, uIntVar = %ld, floatVar = %ld, doubleVar = %ld", sizeof(boolVar), sizeof(intVar), sizeof(uIntVar), sizeof(floatVar), sizeof(doubleVar));

    //объекты (там где есть указатель) хранятся в куче(heap). В динамической памяти
    //примитивные типа хранятся в стеке, т.к. имеют фиксированный размер и занимают малое пространнство. Для быстрого оперирования с ними.
    
    //MARK: - как работают ссылки с объектами
//    ASStudent* studentA = [[ASStudent alloc]init];
//    [studentA setName:@"Best student"];
//    NSLog(@"studentA name = %@", [studentA name]);
//
//    ASStudent* studentB = studentA;
//    studentB.name = @"Bad student";
//    NSLog(@"studentA name = %@", [studentA name]);
    //MARK: - как работают с примитивными типами.
//    NSInteger a = 10;
//    NSLog(@"a = %d", a);
//
//    NSInteger b = a;
//    b = 20;
//
//    NSLog(@"a = %d, b = %d", a, b);
////примитивные типы копируют значения. С примитивными типами не используются указатели.
//
//    NSInteger* c = &a;    //NSInteger* c - создать указатель///// &a - выдать адрес этой переменной в указатель
//
//    *c = 8; //*c обратиться по адресу указателя
//
//    NSLog(@"a = %d, b = %d", a, b);
//    //в стеке тоже есть адресное пространство и мы можем его указывать как было выше
//
//    NSInteger test = 0;
//    NSLog(@"test = %d", test);
//    NSInteger result = [self test:a testPointer:&test];
//    NSLog(@"test = %d", test);
    
//
//    ASStudent* student = [[ASStudent alloc]init];
//    [student setGender:ASGenderMale];
//    [student setGender1:ASGenderMale1];
//    [student setGender2:ASGenderMale2];
//
//    CGPoint point;
//
//    point.x = 10;
//    point.y = 30;
//
//    point = CGPointMake(6, 3);
//
//    CGSize size;
//
//    size.height = 400;
//    size.width = 300;
//
//    CGRect rect; // <- прямоугольник. Origin верхний левый угол. Size размер.
//
//    rect.origin = point;
//    rect.size = size;
//
//    rect = CGRectMake(0, 0, 39, 20);
//
//    CGRectContainsPoint(rect, point); // <- входит ли поинт в этот прямоугольник
    
    CGPoint point1 = CGPointMake(0, 5);
    CGPoint point2 = CGPointMake(2, 1);
    CGPoint point3 = CGPointMake(5, 4);
    CGPoint point4 = CGPointMake(9, 3);
    CGPoint point5 = CGPointMake(8, 7);
        
    NSArray* array2 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:point1], // из структуры CGPoint в  NSValue
                       [NSValue valueWithCGPoint:point2],
                       [NSValue valueWithCGPoint:point3],
                       [NSValue valueWithCGPoint:point4],
                       [NSValue valueWithCGPoint:point5], nil];

    for (NSValue* value in array2) {
        CGPoint point = [value CGPointValue]; // из объекта NSValue(value) в CGPoint
        NSLog(@"point = %@", NSStringFromCGPoint(point));
    }
    
    return YES;
}

- (NSInteger) test:(NSInteger) test testPointer:(NSInteger*) testPointer {
    
    *testPointer = 5;
    
    return test;
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
