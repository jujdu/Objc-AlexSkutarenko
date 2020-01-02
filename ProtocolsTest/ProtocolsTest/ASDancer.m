//
//  ASDancer.m
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASDancer.h"

@implementation ASDancer

- (void) dance {
}

//MARK: - ASPatient
- (BOOL)areYouOk {
    BOOL ok = arc4random() % 2;
    NSLog(@"Is dancer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
    return ok;
}

- (void)makeShot {
    NSLog(@"dancer %@ takes a shot", self.name);
}

- (void)takePill {
    NSLog(@"dancer %@ makes a pill", self.name);
}
    

@end
