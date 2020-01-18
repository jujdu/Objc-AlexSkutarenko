//
//  AppDelegate.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Students+CoreDataClass.h"
#import "Car+CoreDataClass.h"
#import "University+CoreDataClass.h"
#import "Course+CoreDataClass.h"

@interface AppDelegate ()

@end

static NSString* firstNames[] =  { @"Adam", @"Alex", @"Aaron", @"Ben", @"Carl", @"Dan", @"David", @"Edward", @"Fred", @"Frank", @"George", @"Hal", @"Hank", @"Ike", @"John", @"Jack", @"Joe", @"Larry", @"Monte", @"Matthew", @"Mark", @"Nathan", @"Otto", @"Paul", @"Peter", @"Roger", @"Roger", @"Steve", @"Thomas", @"Tim"};
static NSString* lastNames[] =  { @"Anderson", @"Ashwoon", @"Aikin", @"Bateman", @"Bongard", @"Bowers", @"Boyd", @"Cannon", @"Cast", @"Deitz", @"Dewalt", @"Ebner", @"Frick", @"Hancock", @"Haworth", @"Hesch", @"Hoffman", @"Kassing", @"Knutson", @"Lawless", @"Lawicki", @"Mccord", @"McCormack", @"Miller", @"Myers", @"Nugent", @"Ortiz", @"Orwig", @"Ory", @"Holms"};
static NSString* carModelNames[] =  { @"Honda", @"Dogde", @"Audi", @"Wolswagen", @"Tesla", @"Ford", @"Lamborgini", @"Lada", @"Mersedes", @"BMW", @"Reno", @"Toyota", @"Hynday", @"Chevrolet"};

@implementation AppDelegate

- (Students *)addRandomStudent {
    Students *student = [NSEntityDescription insertNewObjectForEntityForName:@"Students" inManagedObjectContext:self.persistentContainer.viewContext];
    student.score = @((float)arc4random_uniform(201) / 200 + 2);
    student.dateBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(20)];
    student.lastName = lastNames[arc4random_uniform(20)];
    return student;
}

- (Car *)addRandomCar {
    Car *car = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:self.persistentContainer.viewContext];
    car.model = carModelNames[arc4random_uniform(13)];
    return car;
}

- (University *)addUniversity {
    University *university = [NSEntityDescription insertNewObjectForEntityForName:@"University" inManagedObjectContext:self.persistentContainer.viewContext];
    university.name = @"ONPI";
    return university;
}

- (NSArray *)allObjects {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"MyObject" inManagedObjectContext:self.persistentContainer.viewContext];
    [request setEntity:description];
    
    NSError *errorRequest = nil;
    NSArray *result = [self.persistentContainer.viewContext executeFetchRequest:request error:&errorRequest];
    
    if (errorRequest) {
        NSLog(@"%@", [errorRequest localizedDescription]);
    }
    return result;
}

- (void) printAllObjects {
    NSArray *result = [self allObjects];
    
    for (id object in result) {
        if ([object isKindOfClass:[Car class]]) {
            Car *car = (Car *)object;
            NSLog(@"CAR: %@, OWNER: %@ %@", car.model, car.owner.firstName, car.owner.lastName);
        } else if ([object isKindOfClass:[University class]]) {
            University *university = (University *)object;
            NSLog(@"UNIVERSITY: %@, STUDENT COUNT: %lu", university.name, (unsigned long)university.students.count);
        } else {
            Students *student = (Students *)object;
            NSLog(@"STUDENT: %@ %@, CAR: %@, UNIVERSITY: %@", student.firstName, student.lastName, student.car.model, student.university.name);
        }
    }
}


- (void)deleteAllObjects {
    NSArray *result = [self allObjects];
    
    for (id object in result) {
        [self.persistentContainer.viewContext deleteObject:object];
    }
    [self saveContext];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//
//    University *university = [self addUniversity];
//
//    for (int i = 0; i < 30; i++) {
//        Students *student = [self addRandomStudent];
//
//        if (arc4random_uniform(1000) / 500) {
//            Car *car = [self addRandomCar];
//            student.car = car;
//        }
//
//        student.university = university;
//    }
//
//    NSError *error = nil;
//
//    if (![self.persistentContainer.viewContext save:&error]) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
////
    
    
    
//    [self deleteAllObjects];
    [self printAllObjects];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
       NSEntityDescription *description = [NSEntityDescription entityForName:@"University" inManagedObjectContext:self.persistentContainer.viewContext];
       [request setEntity:description];
       
       NSError *errorRequest = nil;
       NSArray *result = [self.persistentContainer.viewContext executeFetchRequest:request error:&errorRequest];
       
       if ([result count] > 0) {
           University *university = [result firstObject];
           
           NSLog(@"University to delete %@", university);
           
           [self.persistentContainer.viewContext deleteObject:university];
           [self saveContext];
       }
    [self printAllObjects];
    
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


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreDataTest"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

