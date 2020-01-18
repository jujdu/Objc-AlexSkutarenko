//
//  Students+CoreDataProperties.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "Students+CoreDataProperties.h"

@implementation Students (CoreDataProperties)

+ (NSFetchRequest<Students *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Students"];
}

@dynamic dateBirth;
@dynamic firstName;
@dynamic lastName;
@dynamic score;
@dynamic car;
@dynamic university;
@dynamic courses;

@end
