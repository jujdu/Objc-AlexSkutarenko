//
//  ASChildClass.m
//  FuctionTest
//
//  Created by Michael Sidoruk on 31.12.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

#import "ASChildClass.h"

@implementation ASChildClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of child class is initialized");
    }
    return self;
}

- (NSString*) saySomeNumberString {
    return @"I'm a bad guy";
}

- (NSString*) saySomething {
    return [self saySomeNumberString];
}
@end
