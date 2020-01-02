//
//  ASGovernment.h
//  NotificationTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* const ASGovernmentTaxLevelDidChangeNotification;
extern NSString* const ASGovernmentSalaryDidChangeNotification;
extern NSString* const ASGovernmentPensionDidChangeNotification;
extern NSString* const ASGovernmentAveragePriceDidChangeNotification;

extern NSString* const ASGovernmentTaxLevelUserKey;
extern NSString* const ASGovernmentSalaryUserKey;
extern NSString* const ASGovernmentPensionUserKey;
extern NSString* const ASGovernmentAveragePriceUserKey;

NS_ASSUME_NONNULL_BEGIN

@interface ASGovernment : NSObject

@property (assign, nonatomic) CGFloat taxLevel;
@property (assign, nonatomic) CGFloat salary;
@property (assign, nonatomic) CGFloat pension;
@property (assign, nonatomic) CGFloat averagePrice;

@end

NS_ASSUME_NONNULL_END
