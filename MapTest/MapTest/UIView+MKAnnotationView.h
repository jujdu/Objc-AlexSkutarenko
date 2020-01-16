//
//  UIView+MKAnnotationView.h
//  MapTest
//
//  Created by Michael Sidoruk on 16.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKAnnotationView;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MKAnnotationView)

- (MKAnnotationView *)superAnnotationView;

@end

NS_ASSUME_NONNULL_END
