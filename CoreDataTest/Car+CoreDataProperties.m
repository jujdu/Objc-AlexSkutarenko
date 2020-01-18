//
//  Car+CoreDataProperties.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "Car+CoreDataProperties.h"

@implementation Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Car"];
}

@dynamic model;
@dynamic owner;

@end
