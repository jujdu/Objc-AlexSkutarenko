//
//  ASPatient.m
//  DelegateTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASPatient.h"

@implementation ASPatient

- (void) takePill {
    NSLog(@"%@ takes a pill", [self name]);
}
- (void) makeShot {
    NSLog(@"%@ makes a shot", [self name]);
}
- (BOOL) howAreU {
    BOOL iFeelGood = arc4random() % 2;
    
    if (!iFeelGood) {
        [[self delegate]patientFeelsBad:self];
    } else {
        [[self delegate]patient:self hasQuestion:@"Am I fine?"];
    }
    
    return iFeelGood;
}

@end
