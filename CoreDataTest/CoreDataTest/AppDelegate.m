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

#pragma mark - Constants
static NSString* firstNames[] =  { @"Adam", @"Alex", @"Aaron", @"Ben", @"Carl", @"Dan", @"David", @"Edward", @"Fred", @"Frank", @"George", @"Hal", @"Hank", @"Ike", @"John", @"Jack", @"Joe", @"Larry", @"Monte", @"Matthew", @"Mark", @"Nathan", @"Otto", @"Paul", @"Peter", @"Roger", @"Roger", @"Steve", @"Thomas", @"Tim"};
static NSString* lastNames[] =  { @"Anderson", @"Ashwoon", @"Aikin", @"Bateman", @"Bongard", @"Bowers", @"Boyd", @"Cannon", @"Cast", @"Deitz", @"Dewalt", @"Ebner", @"Frick", @"Hancock", @"Haworth", @"Hesch", @"Hoffman", @"Kassing", @"Knutson", @"Lawless", @"Lawicki", @"Mccord", @"McCormack", @"Miller", @"Myers", @"Nugent", @"Ortiz", @"Orwig", @"Ory", @"Holms"};
static NSString* carModelNames[] =  { @"Honda", @"Dogde", @"Audi", @"Wolswagen", @"Tesla", @"Ford", @"Lamborgini", @"Lada", @"Mersedes", @"BMW", @"Reno", @"Toyota", @"Hynday", @"Chevrolet"};

@implementation AppDelegate
#pragma mark - Methods
- (Students *)addRandomStudent {
    Students *student = [NSEntityDescription insertNewObjectForEntityForName:@"Students" inManagedObjectContext:self.persistentContainer.viewContext];
    student.score = @((float)arc4random_uniform(201) / 100 + 2);
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

- (Course *)addCourseWithName:(NSString *)name {
    Course *course = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:self.persistentContainer.viewContext];
    course.name = name;
    return course;
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

- (void) printArray:(NSArray *)array {
    for (id object in array) {
        if ([object isKindOfClass:[Car class]]) {
            Car *car = (Car *)object;
            NSLog(@"CAR: %@, OWNER: %@ %@", car.model, car.owner.firstName, car.owner.lastName);
        } else if ([object isKindOfClass:[University class]]) {
            University *university = (University *)object;
            NSLog(@"UNIVERSITY: %@, STUDENT COUNT: %lu", university.name, (unsigned long)university.students.count);
        } else if ([object isKindOfClass:[Students class]]) {
            Students *student = (Students *)object;
            NSLog(@"STUDENT: %@ %@, SCORE: %1.2f, COURSES COUNT: %lu", student.firstName, student.lastName, [student.score floatValue], [student.courses count]);
        } else if ([object isKindOfClass:[Course class]]) {
            Course *course = (Course *)object;
            NSLog(@"COURSE: %@, STUDENTS: %lu", course.name, (unsigned long)[course.students count]);
        }
    }
}

- (void) printAllObjects {
    NSArray *result = [self allObjects];
    
    [self printArray:result];
}


- (void)deleteAllObjects {
    NSArray *result = [self allObjects];
    
    for (id object in result) {
        [self.persistentContainer.viewContext deleteObject:object];
    }
    [self saveContext];
}

#pragma mark - LifyCycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//
//    [self deleteAllObjects];
////
//    NSArray *courses = @[[self addCourseWithName:@"iOS"],
//                         [self addCourseWithName:@"Android"],
//                         [self addCourseWithName:@"PHP"],
//                         [self addCourseWithName:@"Javescript"],
//                         [self addCourseWithName:@"HTML"]];
//
//    University *university = [self addUniversity];
//
//    [university addCourses:[NSSet setWithArray:courses]];
//
//    for (int i = 0; i < 100; i++) {
//        Students *student = [self addRandomStudent];
//
//        if (arc4random_uniform(1000) / 500) {
//            Car *car = [self addRandomCar];
//            student.car = car;
//        }
//
//        student.university = university;
//
//        NSInteger number = arc4random_uniform(5) + 1;
//
//        while ([student.courses count] < number) {
//            Course *course = [courses objectAtIndex:arc4random_uniform(5)];
//
//            if (![student.courses containsObject:course]) {
//                [student addCoursesObject:course];
//            }
//        }
//    }
//
//    [self saveContext];
//
//    [self printAllObjects];
//
//    NSFetchRequest *request = [[NSFetchRequest alloc]init];
//    NSEntityDescription *description = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:self.persistentContainer.viewContext];
//    [request setEntity:description];
//    [request setRelationshipKeyPathsForPrefetching:@[@"courses"]];
//    [request setFetchBatchSize:20];
//    [request setFetchLimit:35];
//    [request setFetchOffset:10];
//    NSSortDescriptor *firstNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"firstName" ascending:YES];
//    NSSortDescriptor *lastNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"lastName" ascending:YES];
//    [request setSortDescriptors:@[firstNameDescriptor,lastNameDescriptor]];
//
//    NSSortDescriptor *nameDescriptoor = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
//    [request setSortDescriptors:@[nameDescriptoor]];

//    NSArray *validNames = @[@"Hank", @"John", @"George"];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"score > %f AND score <= %f AND "
//                              "courses.@count >= %d AND "
//                              "firstName IN %@", 3.0, 3.3, 3, validNames];
 
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"@avg.students.score > %f OR @sum.students.score > %d", 3.085, 100];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"@max.students.score == %f", 4.0f];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SUBQUERY(students, $student, $student.car.model == %@).@count >= %d", @"BMW", 3];
    
//    [request setPredicate:predicate];

//    NSError *errorRequest = nil;
//    NSArray *result = [self.persistentContainer.viewContext executeFetchRequest:request error:&errorRequest];
//
//    [self printArray:result];
//
//    NSFetchRequest *request = [[self.persistentContainer.managedObjectModel fetchRequestTemplateForName:@"FetchStudents"] copy];
//    
//    NSArray *result = [self.persistentContainer.viewContext executeFetchRequest:request error:nil];
//    
//    NSSortDescriptor *firstNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"firstName" ascending:YES];
//    NSSortDescriptor *lastNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"lastName" ascending:YES];
//    [request setSortDescriptors:@[firstNameDescriptor,lastNameDescriptor]];
////
//    [self printArray:result];

    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:self.persistentContainer.viewContext];
    [request setEntity:description];
    NSArray *result = [self.persistentContainer.viewContext executeFetchRequest:request error:nil];
    for (Course *course in result) {
        NSLog(@"COURSE NAME = %@", course.name);
        NSLog(@"BEST STUDENTS:");
        [self printArray:course.bestStudents];
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

