//
//  ASDoctor.m
//  NotificationTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASDoctor.h"
#import "ASGovernment.h"

@implementation ASDoctor

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:ASGovernmentSalaryDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:ASGovernmentAveragePriceDidChangeNotification
                 object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void) salaryChangedNotification:(NSNotification*) notification {
    NSNumber* value = [[notification userInfo] objectForKey:ASGovernmentSalaryUserKey];
    CGFloat salary = [value floatValue];
    
    if (salary < _salary) {
        NSLog(@"Doctors are not happy");
    } else {
        NSLog(@"Doctors are happy");
    }
    _salary = salary;
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {
    
}

@end
