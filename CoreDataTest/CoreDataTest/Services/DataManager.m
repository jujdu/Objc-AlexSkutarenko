//
//  DataManager.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 19.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "DataManager.h"
#import "Students+CoreDataClass.h"
#import "Car+CoreDataClass.h"
#import "University+CoreDataClass.h"
#import "Course+CoreDataClass.h"

#pragma mark - Constants
static NSString* firstNames[] =  { @"Adam", @"Alex", @"Aaron", @"Ben", @"Carl", @"Dan", @"David", @"Edward", @"Fred", @"Frank", @"George", @"Hal", @"Hank", @"Ike", @"John", @"Jack", @"Joe", @"Larry", @"Monte", @"Matthew", @"Mark", @"Nathan", @"Otto", @"Paul", @"Peter", @"Roger", @"Roger", @"Steve", @"Thomas", @"Tim"};
static NSString* lastNames[] =  { @"Anderson", @"Ashwoon", @"Aikin", @"Bateman", @"Bongard", @"Bowers", @"Boyd", @"Cannon", @"Cast", @"Deitz", @"Dewalt", @"Ebner", @"Frick", @"Hancock", @"Haworth", @"Hesch", @"Hoffman", @"Kassing", @"Knutson", @"Lawless", @"Lawicki", @"Mccord", @"McCormack", @"Miller", @"Myers", @"Nugent", @"Ortiz", @"Orwig", @"Ory", @"Holms"};
static NSString* carModelNames[] =  { @"Honda", @"Dogde", @"Audi", @"Wolswagen", @"Tesla", @"Ford", @"Lamborgini", @"Lada", @"Mersedes", @"BMW", @"Reno", @"Toyota", @"Hynday", @"Chevrolet"};


@implementation DataManager

+ (DataManager *)sharedManager {
    static DataManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DataManager alloc]init];
    });
    
    return manager;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CoreDataTest"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
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
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - Methods
- (Students *)addRandomStudent {
    Students *student = [NSEntityDescription insertNewObjectForEntityForName:@"Students" inManagedObjectContext:[DataManager sharedManager].persistentContainer.viewContext];
    student.score = @((float)arc4random_uniform(201) / 100 + 2);
    student.dateBirth = [NSDate dateWithTimeIntervalSince1970:60*60*24*365*arc4random_uniform(31)];
    student.firstName = firstNames[arc4random_uniform(20)];
    student.lastName = lastNames[arc4random_uniform(20)];
    return student;
}

- (Car *)addRandomCar {
    Car *car = [NSEntityDescription insertNewObjectForEntityForName:@"Car" inManagedObjectContext:[DataManager sharedManager].persistentContainer.viewContext];
    car.model = carModelNames[arc4random_uniform(13)];
    return car;
}

- (University *)addUniversity {
    University *university = [NSEntityDescription insertNewObjectForEntityForName:@"University" inManagedObjectContext:[DataManager sharedManager].persistentContainer.viewContext];
    university.name = @"ONPI";
    return university;
}

- (Course *)addCourseWithName:(NSString *)name {
    Course *course = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:[DataManager sharedManager].persistentContainer.viewContext];
    course.name = name;
    return course;
}

- (NSArray *)allObjects {
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *description = [NSEntityDescription entityForName:@"MyObject" inManagedObjectContext:[DataManager sharedManager].persistentContainer.viewContext];
    [request setEntity:description];
    
    NSError *errorRequest = nil;
    NSArray *result = [[DataManager sharedManager].persistentContainer.viewContext executeFetchRequest:request error:&errorRequest];
    
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
        [[DataManager sharedManager].persistentContainer.viewContext deleteObject:object];
    }
    [[DataManager sharedManager] saveContext];
}

- (void)generateUniversity {
    //    [self deleteAllObjects];
    
    NSArray *courses = @[[self addCourseWithName:@"iOS"],
                         [self addCourseWithName:@"Android"],
                         [self addCourseWithName:@"PHP"],
                         [self addCourseWithName:@"Javescript"],
                         [self addCourseWithName:@"HTML"]];
    
    University *university = [self addUniversity];
    [university addCourses:[NSSet setWithArray:courses]];
    
    for (int i = 0; i < 100; i++) {
        Students *student = [self addRandomStudent];
        
        if (arc4random_uniform(1000) / 500) {
            Car *car = [self addRandomCar];
            student.car = car;
        }
        
        student.university = university;
        
        NSInteger number = arc4random_uniform(5) + 1;
        
        while ([student.courses count] < number) {
            Course *course = [courses objectAtIndex:arc4random_uniform(5)];
            
            if (![student.courses containsObject:course]) {
                [student addCoursesObject:course];
            }
        }
    }
    
    [self saveContext];
    [self printAllObjects];
}

@end

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
//
//    NSFetchRequest *request = [[NSFetchRequest alloc]init];
//    NSEntityDescription *description = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:[DataManager sharedManager].persistentContainer.viewContext];
//    [request setEntity:description];
//    NSArray *result = [[DataManager sharedManager].persistentContainer.viewContext executeFetchRequest:request error:nil];
//    for (Course *course in result) {
//        NSLog(@"COURSE NAME = %@", course.name);
//        NSLog(@"BEST STUDENTS:");
//        [self printArray:course.bestStudents];
//    }
