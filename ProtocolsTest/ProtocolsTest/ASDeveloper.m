//
//  ASDeveloper.m
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASDeveloper.h"

@implementation ASDeveloper

- (void) work {
    
}

//MARK: - ASPatient

- (BOOL)areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is developer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void)makeShot {
    NSLog(@"developer %@ takes a shot", self.name);
}

- (void)takePill {
    NSLog(@"developer %@ makes a pill", self.name);
}

- (NSString*) howIsUrJob {
    return @"fine";
}

@end
