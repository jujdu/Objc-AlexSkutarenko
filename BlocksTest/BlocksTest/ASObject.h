//
//  ASObject.h
//  BlocksTest
//
//  Created by Michael Sidoruk on 04.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ObjectBlock)(void);

@interface ASObject : NSObject
@property (strong, nonatomic) NSString *name;

- (void) testMethod:(ObjectBlock) block;

@end

NS_ASSUME_NONNULL_END
