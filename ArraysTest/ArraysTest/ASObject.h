//
//  ASObject.h
//  ArraysTest
//
//  Created by Michael Sidoruk on 01.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASObject : NSObject

@property (strong, nonatomic) NSString* name;

- (void) action;

@end

NS_ASSUME_NONNULL_END
