//
//  ASObject.m
//  BlocksTest
//
//  Created by Michael Sidoruk on 04.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASObject.h"

@interface ASObject ()

@property (copy, nonatomic) ObjectBlock objectBlock;

@end

@implementation ASObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        __weak ASObject *weakSelf = self;
        
        self.objectBlock = ^{
            NSLog(@"%@", weakSelf.name);
        };
    }
    return self;
}

- (void) dealloc {
    NSLog(@"ASObject dealloc");
}

- (void) testMethod:(ObjectBlock) block{
    block();
}

@end
