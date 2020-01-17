//
//  Student.m
//  KVCTest
//
//  Created by Michael Sidoruk on 17.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setName:(NSString *)name {
    _name = name;
    
    NSLog(@"student setName %@", name);
}

- (void)setAge:(NSInteger)age {
    _age = age;
    
    NSLog(@"student setAge %ld", (long)age);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Student: %@, %ld", self.name, (long)self.age];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"setValueForUndefinedKey");
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"valueForUndefinedKey");
    return nil;
}

- (void)changeName {
    
    [self willChangeValueForKey:@"name"];
    _name = @"Fakename";
    [self didChangeValueForKey:@"name"];
}

//- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError *__autoreleasing  _Nullable *)outError {
//
//    if ([inKey isEqualToString:@"name"]) {
//        NSString *newName = *ioValue;
//
//        if (![newName isKindOfClass:[NSString class]]) {
//            *outError = [[NSError alloc] initWithDomain:@"Not NSString" code:123 userInfo:nil];
//            return NO;
//        }
//
//        if ([newName rangeOfString:@"1"].location != NSNotFound) {
//            *outError = [[NSError alloc] initWithDomain:@"Has number" code:124 userInfo:nil];
//            return NO;
//        }
//    }
//
//    return YES;
//}

- (BOOL)validateName:(inout id  _Nullable __autoreleasing *)ioValue error:(out NSError *__autoreleasing  _Nullable *)outError{
    NSLog(@"asdasda");
    return YES;
}

@end
