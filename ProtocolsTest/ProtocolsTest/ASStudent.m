//
//  ASStudent.m
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASStudent.h"

@implementation ASStudent

- (void) study {
    
}

//MARK: - ASPatient
- (BOOL)areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is student %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void)makeShot {
    NSLog(@"student %@ takes a shot", self.name);
}

- (void)takePill {
    NSLog(@"student %@ makes a pill", self.name);
}

- (NSString *)howIsUrFamily {
    return @"good";
}
@end
