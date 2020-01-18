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

- (void)setFirstName:(NSString *)firstName {
    [self willChangeValueForKey:@"firstName"];
    [self setPrimitiveValue:firstName forKey:@"firstName"];
    [self didChangeValueForKey:@"firstName"];
    NSLog(@"SET FIRST NAME");
}

- (NSString *)firstName {
    NSString *string = nil;
    [self willAccessValueForKey:@"firstName"];
    string = [self primitiveValueForKey:@"firstName"];
    [self didAccessValueForKey:@"firstName"];
    NSLog(@"GET FIRST NAME");
    return string;
}
//
//- (BOOL)validateValue:(id  _Nullable __autoreleasing *)value forKey:(NSString *)key error:(NSError *__autoreleasing  _Nullable *)error

- (BOOL)validateLastName:(id  _Nullable __autoreleasing *)value error:(NSError *__autoreleasing  _Nullable *)error {
    
    *error = [NSError errorWithDomain:@"BAD LAST NAME" code:123 userInfo:nil];
    
    return NO;
}

@end
