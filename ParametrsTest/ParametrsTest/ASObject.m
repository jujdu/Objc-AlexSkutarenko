//
//  ASObject.m
//  ParametrsTest
//
//  Created by Michael Sidoruk on 01.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASObject.h"

@implementation ASObject
- (void)dealloc {
    NSLog(@"object is dellocated");
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"object is created");
    }
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    ASObject *newObject = [[ASObject alloc] init];
    newObject.name = self.name;
    return newObject;
}

@end
