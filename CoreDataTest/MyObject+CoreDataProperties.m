//
//  MyObject+CoreDataProperties.m
//  CoreDataTest
//
//  Created by Michael Sidoruk on 18.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//
//

#import "MyObject+CoreDataProperties.h"

@implementation MyObject (CoreDataProperties)

+ (NSFetchRequest<MyObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"MyObject"];
}

- (BOOL)validateForDelete:(NSError *__autoreleasing  _Nullable *)error {
    NSLog(@"validateForDelete %@", [self class]);
    return YES;
}

@end
