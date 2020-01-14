//
//  Student.h
//  TableEditingTest
//
//  Created by Michael Sidoruk on 14.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) CGFloat averageGrade;

+ (Student *)randomStudent;

@end

NS_ASSUME_NONNULL_END
