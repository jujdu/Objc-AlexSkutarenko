//
//  Students+CoreDataProperties.h
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "Students+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Students (CoreDataProperties)

+ (NSFetchRequest<Students *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateBirth;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSNumber *score;
@property (nullable, nonatomic, retain) Car *car;
@property (nullable, nonatomic, retain) University *university;
@property (nullable, nonatomic, retain) NSSet<Course *> *courses;

@end

@interface Students (CoreDataGeneratedAccessors)

- (void)addCoursesObject:(Course *)value;
- (void)removeCoursesObject:(Course *)value;
- (void)addCourses:(NSSet<Course *> *)values;
- (void)removeCourses:(NSSet<Course *> *)values;

@end

NS_ASSUME_NONNULL_END
