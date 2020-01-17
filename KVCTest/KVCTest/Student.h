//
//  Student.h
//  KVCTest
//
//  Created by Michael Sidoruk on 17.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;

- (void)changeName;

@end

NS_ASSUME_NONNULL_END
