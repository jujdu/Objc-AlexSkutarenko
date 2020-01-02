//
//  ASGovernment.m
//  NotificationTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ASGovernment.h"

NSString* const ASGovernmentTaxLevelDidChangeNotification = @"ASGovernmentTaxLevelDidChangeNotification";
NSString* const ASGovernmentSalaryDidChangeNotification = @"ASGovernmentSalaryDidChangeNotification";
NSString* const ASGovernmentPensionDidChangeNotification = @"ASGovernmentPensionDidChangeNotification";
NSString* const ASGovernmentAveragePriceDidChangeNotification = @"ASGovernmentAveragePriceDidChangeNotification";

NSString* const ASGovernmentTaxLevelUserKey = @"ASGovernmentTaxLevelUserKey";
NSString* const ASGovernmentSalaryUserKey = @"ASGovernmentSalaryUserKey";
NSString* const ASGovernmentPensionUserKey = @"ASGovernmentPensionUserKey";
NSString* const ASGovernmentAveragePriceUserKey = @"ASGovernmentAveragePriceUserKey";

@implementation ASGovernment

- (instancetype)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10.f;
    }
    return self;
}

- (void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:ASGovernmentTaxLevelUserKey];
    [[NSNotificationCenter defaultCenter]postNotificationName:ASGovernmentTaxLevelDidChangeNotification
                                                       object:nil
                                                     userInfo:dic];
}

- (void) setSalary:(CGFloat)salary {
    _salary = salary;
    
    NSDictionary* dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:ASGovernmentSalaryUserKey];
    [[NSNotificationCenter defaultCenter]postNotificationName:ASGovernmentSalaryDidChangeNotification
                                                       object:nil
                                                     userInfo:dic];
}

- (void)setPension:(CGFloat)pension {
    _pension = pension;
    NSDictionary* dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:ASGovernmentPensionUserKey];
    [[NSNotificationCenter defaultCenter]postNotificationName:ASGovernmentPensionDidChangeNotification
                                                       object:nil
                                                     userInfo:dic];
}

- (void)setAveragePrice:(CGFloat)averagePrice {
    _averagePrice = averagePrice;
    NSDictionary* dic = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:ASGovernmentAveragePriceUserKey];
    [[NSNotificationCenter defaultCenter]postNotificationName:ASGovernmentAveragePriceDidChangeNotification
                                                       object:nil
                                                     userInfo:dic];
}

@end
