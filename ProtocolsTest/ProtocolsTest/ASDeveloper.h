//
//  ASDeveloper.h
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASPatient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASDeveloper : NSObject <ASPatient>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString* name;

- (void) work;

@end

NS_ASSUME_NONNULL_END
