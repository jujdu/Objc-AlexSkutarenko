//
//  ASObject.m
//  NSDateTest
//
//  Created by Michael Sidoruk on 05.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASObject.h"


@interface ASObject ()

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation ASObject
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"init");

        __weak id weakSelf = self;//ne rabotaet
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:weakSelf selector:@selector(timerTest:) userInfo:nil repeats:YES];
        [timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
        
        self.timer = timer;
    }
    return self;
}

- (void)dealloc {
    [self.timer invalidate];
    NSLog(@"dealloc");
}


- (void) timerTest:(NSTimer *) timer {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);

}
@end
