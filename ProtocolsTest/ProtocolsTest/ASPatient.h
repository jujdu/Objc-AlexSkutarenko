//
//  ASPatient.h
//  ProtocolsTest
//
//  Created by Michael Sidoruk on 02.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ASPatient <NSObject>

@required
@property (strong, nonatomic) NSString* name;

- (BOOL) areYouOk;
- (void) takePill;
- (void) makeShot;

@optional
- (NSString*) howIsUrFamily;
- (NSString*) howIsUrJob;

@end

NS_ASSUME_NONNULL_END
