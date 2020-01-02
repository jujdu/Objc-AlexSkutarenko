//
//  ASStudent.h
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASPatient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASStudent : NSObject <ASPatient>

@property (strong, nonatomic) NSString* universityName;
@property (strong, nonatomic) NSString* name;

- (void) study;

@end

NS_ASSUME_NONNULL_END
