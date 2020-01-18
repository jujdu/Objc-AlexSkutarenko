//
//  AppDelegate.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "AppDelegate.h"
#import "Students+CoreDataClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static NSString* firstNames[] =  { @"Adam", @"Alex", @"Aaron", @"Ben", @"Carl", @"Dan", @"David", @"Edward", @"Fred", @"Frank", @"George", @"Hal", @"Hank", @"Ike", @"John", @"Jack", @"Joe", @"Larry", @"Monte", @"Matthew", @"Mark", @"Nathan", @"Otto", @"Paul", @"Peter", @"Roger", @"Roger", @"Steve", @"Thomas", @"Tim"};
static NSString* lastNames[] =  { @"Anderson", @"Ashwoon", @"Aikin", @"Bateman", @"Bongard", @"Bowers", @"Boyd", @"Cannon", @"Cast", @"Deitz", @"Dewalt", @"Ebner", @"Frick", @"Hancock", @"Haworth", @"Hesch", @"Hoffman", @"Kassing", @"Knutson", @"Lawless", @"Lawicki", @"Mccord", @"McCormack", @"Miller", @"Myers", @"Nugent", @"Ortiz", @"Orwig", @"Ory", @"Holms"};

- (Students *)addRandomStudent {
    Students *student = [NSEntityDescription insertNewObjectForEntityForName:@"Students" inManagedObjectContext:self.persistentContainer.viewContext];
    student.score = @((float)arc4random_uniform(201) / 200 + 2);
    student.dateBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(50)];
    student.lastName = lastNames[arc4random_uniform(50)];
    return student;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

//    NSLog(@"%@",[self.persistentContainer.managedObjectModel entitiesByName]);
//
//    NSManagedObject *student = [NSEntityDescription insertNewObjectForEntityForName:@"Students" inManagedObjectContext:self.persistentContainer.viewContext];
//
//    [student setValue:@"Misha" forKey:@"firstName"];
//    [student setValue:@"Sidoruk" forKey:@"lastName"];
//    [student setValue:[NSDate dateWithTimeIntervalSinceReferenceDate:0] forKey:@"dateBirth"];
//    [student setValue:@4 forKey:@"score"];
//
//    NSError *error = nil;
//
//    if (![self.persistentContainer.viewContext save:&error]) {
//        NSLog(@"%@", [error localizedDescription]);
//    }
    
    [self addRandomStudent];
//    [student.managedObjectContext save:nil];
    
     NSError *error = nil;
    
    if (![self.persistentContainer.viewContext save:&error]) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    
    
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Students" inManagedObjectContext:self.persistentContainer.viewContext];
    [request setEntity:description];
//    [request setResultType:NSDictionaryResultType];
    NSError *errorRequest = nil;
    NSArray *result = [self.persistentContainer.viewContext executeFetchRequest:request error:&errorRequest];
    if (errorRequest) {
        NSLog(@"%@", [errorRequest localizedDescription]);
    }
    
//    NSLog(@"%@", result);
//
//    for (NSManagedObject *object in result) {
//        NSLog(@"%@ %@ - %@", [object valueForKey:@"firstName"], [object valueForKey:@"lastName"], [object valueForKey:@"score"]);
//    }
    
        NSLog(@"%@", result);
    
        for (Students *object in result) {
            NSLog(@"%@ %@ - %@", object.firstName, object.lastName, object.score);
//            NSLog(@"%@", object);
        }
    
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
