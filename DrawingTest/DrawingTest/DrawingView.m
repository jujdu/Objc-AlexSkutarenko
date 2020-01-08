//
//  DrawingView.m
//  DrawingTest
//
//  Created by Michael Sidoruk on 08.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"drawRect %@", NSStringFromCGRect(rect));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect rect1 = CGRectMake(100, 100, 100, 100);
    CGRect rect2 = CGRectMake(200, 200, 100, 100);
    CGRect rect3 = CGRectMake(300, 300, 100, 100);
    
#pragma mark - stroke color
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextSetLineWidth(context, 10);
    
    CGContextAddRect(context, rect1);
    CGContextAddRect(context, rect2);
    CGContextAddRect(context, rect3);
    
    CGContextStrokePath(context);

#pragma mark - fill color
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextAddRect(context, rect1);
    CGContextAddRect(context, rect2);
    CGContextAddRect(context, rect3);
    
    CGContextFillPath(context);
    
#pragma mark - ellipse
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);

    CGContextAddEllipseInRect(context, rect1);
    CGContextAddEllipseInRect(context, rect2);
    CGContextAddEllipseInRect(context, rect3);
    
    CGContextFillPath(context);

#pragma mark - lines
    
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    
    CGContextSetLineWidth(context, 3);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextMoveToPoint(context, CGRectGetMinX(rect1), CGRectGetMaxY(rect1));
    CGContextAddLineToPoint(context, CGRectGetMinX(rect3), CGRectGetMaxY(rect3));
    
    CGContextMoveToPoint(context, CGRectGetMaxX(rect1), CGRectGetMinY(rect1));
    CGContextAddLineToPoint(context, CGRectGetMaxX(rect3), CGRectGetMinY(rect3));
    
    CGContextStrokePath(context);
    
//    CGContextAddRect(context, rect);
//    CGContextFillPath(context);
////    CGContextFillRect(context, rect);
    //30:33
}

@end
