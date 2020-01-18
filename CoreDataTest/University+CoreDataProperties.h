//
//  University+CoreDataProperties.h
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "University+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface University (CoreDataProperties)

+ (NSFetchRequest<University *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Students *> *students;
@property (nullable, nonatomic, retain) NSSet<Course *> *courses;

@end

@interface University (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Students *)value;
- (void)removeStudentsObject:(Students *)value;
- (void)addStudents:(NSSet<Students *> *)values;
- (void)removeStudents:(NSSet<Students *> *)values;

- (void)addCoursesObject:(Course *)value;
- (void)removeCoursesObject:(Course *)value;
- (void)addCourses:(NSSet<Course *> *)values;
- (void)removeCourses:(NSSet<Course *> *)values;

@end

NS_ASSUME_NONNULL_END
