//
//  ASParentClass.m
//  FuctionTest
//
//  Created by Michael Sidoruk on 31.12.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

#import "ASParentClass.h"

@implementation ASParentClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"Instance of parent class is initialized");
    }
    return self;
}

+ (void) whoAreYou {
    NSLog(@"I am ASParentClass %@", self); // тут self это название класса
}


- (void) sayHello {
    NSLog(@"Parent says hello! %@", self); // тут self это экзепляр класса
}
- (void) say:(NSString*) string {
    NSLog(@"%@", string);
}
- (void) say:(NSString*) string and:(NSString*) string2 {
    NSLog(@"%@, %@", string, string2);
}
- (void) say:(NSString*) string :(NSString*) string2 {
    NSLog(@"%@, %@", string, string2);
}
- (void) say:(NSString*) string and:(NSString*) string2 andAfterThat:(NSString*) string3 {
    NSLog(@"%@, %@, %@", string, string2, string3);
}
- (NSString*) saySomeNumberString {
    return [NSString stringWithFormat:@"%@", [NSDate date]];
}
- (NSString*) saySomething {
    NSString* string = [self saySomeNumberString];
    return string;
}

@end
