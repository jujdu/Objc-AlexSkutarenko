//
//  ASDoctor.h
//  DelegateTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASPatient.h"

@protocol ASPatientDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ASDoctor : NSObject <ASPatientDelegate>



@end

NS_ASSUME_NONNULL_END
