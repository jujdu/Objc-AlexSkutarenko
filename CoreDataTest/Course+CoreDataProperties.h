//
//  Course+CoreDataProperties.h
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "Course+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

+ (NSFetchRequest<Course *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) University *university;
@property (nullable, nonatomic, retain) NSSet<Students *> *students;

@end

@interface Course (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(Students *)value;
- (void)removeStudentsObject:(Students *)value;
- (void)addStudents:(NSSet<Students *> *)values;
- (void)removeStudents:(NSSet<Students *> *)values;

@end

NS_ASSUME_NONNULL_END
