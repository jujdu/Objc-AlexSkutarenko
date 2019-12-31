//
//  ASBoxer.m
//  PropertiesTest
//
//  Created by Michael Sidoruk on 31.12.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

#import "ASBoxer.h"

@interface ASBoxer () // <- Extension? Убрали это свойство из хедера, тем самым сделав приватным и не доступны вне. Можно использовать только в классе. Видимо это свойство private из Swift.
@property (assign, nonatomic) NSInteger nameCount;
@end

@implementation ASBoxer
@synthesize name = _name; // <- необходимо использовать для возможности переопределить getter и setter одновременно. Это называется iVar, внутренняя переменная

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setNameCount:0];
        [self setName:@"Armen"];
        [self setAge:45];
        [self setHeight:216.6f];
        [self setWeight:45.f];
    }
    return self;
}

- (void) setName:(NSString *)inputName {
    NSLog(@"setter setName: is called");
    _name = inputName;
}

- (NSString*)name {
    self.nameCount++;
//    self.nameCount = self.nameCount + 1;
//    self.nameCount += 1;
    NSLog(@"getter name is called %ld", (long)[self nameCount]);
    return _name;
}

- (NSInteger)age {
    NSLog(@"age getter is called");
    return _age;
}

- (NSInteger)howOldAreYou {
    return _age;
//    return [self age];
}


@end
