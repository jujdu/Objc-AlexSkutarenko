//
//  ASDancer.h
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASPatient.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASDancer : NSObject <ASPatient>

@property (strong, nonatomic) NSString* favoriteDance;
@property (strong, nonatomic) NSString* name;

- (void) dance;

@end

NS_ASSUME_NONNULL_END
