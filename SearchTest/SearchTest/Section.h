//
//  Section.h
//  SearchTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Section : NSObject
@property (strong, nonatomic) NSString *sectionName;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@end

NS_ASSUME_NONNULL_END
