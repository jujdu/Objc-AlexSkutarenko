//
//  University+CoreDataProperties.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "University+CoreDataProperties.h"

@implementation University (CoreDataProperties)

+ (NSFetchRequest<University *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"University"];
}

@dynamic name;
@dynamic students;
@dynamic courses;

@end
