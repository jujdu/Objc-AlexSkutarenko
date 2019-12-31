//
//  ASParentClass.h
//  FuctionTest
//
//  Created by Michael Sidoruk on 31.12.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASParentClass : NSObject
//MARK: - Static methods
+ (void) whoAreYou;


//MARK: - Object methods
- (void) sayHello;
- (void) say:(NSString*) string;
- (void) say:(NSString*) string and:(NSString*) string2;
- (void) say:(NSString*) string :(NSString*) string2;
- (void) say:(NSString*) string and:(NSString*) string2 andAfterThat:(NSString*) string3;
- (NSString*) saySomeNumberString;

- (NSString*) saySomething;

@end

NS_ASSUME_NONNULL_END
