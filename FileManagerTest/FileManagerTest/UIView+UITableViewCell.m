//
//  UIView+UITableViewCell.m
//  FileManagerTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "UIView+UITableViewCell.h"


@implementation UIView (UITableViewCell)
- (UITableViewCell *)superCell {
    if (!self.superview) {
        return nil;
    }
    
    if ([self.superview isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)self.superview;
    }
    
    return [self.superview superCell];
}
@end
