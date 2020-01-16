//
//  NSString+Random.h
//  SearchTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Random)
+ (NSString *)randomAlphanumeric;
+ (NSString *)randomAlphanumericStringWithLength:(NSInteger)length;

@end

NS_ASSUME_NONNULL_END
