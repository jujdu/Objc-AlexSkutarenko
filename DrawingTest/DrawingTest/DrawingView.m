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
    /*
     CGRect rect1 = CGRectMake(100, 100, 100, 100);
     CGRect rect2 = CGRectMake(200, 200, 100, 100);
     CGRect rect3 = CGRectMake(300, 300, 100, 100);
     
     #pragma mark - stroke color
     CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
     
     CGContextSetLineWidth(context, 3);
     
     CGContextAddRect(context, rect1);
     CGContextAddRect(context, rect2);
     CGContextAddRect(context, rect3);
     
     CGContextStrokePath(context);
     
     #pragma mark - fill color
     CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
     
     //    CGContextFillRect(context, rect);
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
     
     CGContextSetLineWidth(context, 2);
     CGContextSetLineCap(context, kCGLineCapRound);
     
     CGContextMoveToPoint(context, CGRectGetMinX(rect1), CGRectGetMaxY(rect1));
     CGContextAddLineToPoint(context, CGRectGetMinX(rect3), CGRectGetMaxY(rect3));
     
     CGContextStrokePath(context);
     
     CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
     
     CGContextMoveToPoint(context, CGRectGetMaxX(rect1), CGRectGetMinY(rect1));
     CGContextAddLineToPoint(context, CGRectGetMaxX(rect3), CGRectGetMinY(rect3));
     
     CGContextStrokePath(context);
     
     #pragma mark - half ellipse
     
     CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
     
     CGContextMoveToPoint(context, CGRectGetMinX(rect1), CGRectGetMaxY(rect1));
     CGContextAddArc(context, CGRectGetMaxX(rect1), CGRectGetMaxY(rect1), CGRectGetWidth(rect1), M_PI, 0, YES);
     
     CGContextMoveToPoint(context, CGRectGetMaxX(rect2), CGRectGetMinY(rect2));
     //    CGContextAddArcToPoint(context, CGRectGetMaxX(rect2), CGRectGetMinY(rect2), CGRectGetMaxX(rect3), CGRectGetMinY(rect3), CGRectGetWidth(rect2));
     CGContextAddArc(context, CGRectGetMinX(rect3), CGRectGetMinY(rect3), CGRectGetWidth(rect3), 0, M_PI, YES);
     
     CGContextStrokePath(context);
     
     
     #pragma mark - draw text
     
     NSString *text = @"test";
     
     UIFont *font = [UIFont systemFontOfSize:19];
     
     NSShadow *shadow = [[NSShadow alloc] init];
     shadow.shadowOffset = CGSizeMake(1, 1);
     shadow.shadowColor = [UIColor yellowColor];
     shadow.shadowBlurRadius = 1;
     
     NSDictionary *attiributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, shadow, NSShadowAttributeName, font, NSFontAttributeName, nil];
     
     CGSize textSize = [text sizeWithAttributes:attiributes];
     
     //    [text drawAtPoint:CGPointMake(CGRectGetMidX(rect2) - textSize.width / 2, CGRectGetMidY(rect2) - textSize.height / 2) withAttributes:attiributes]; // из-за дробных частей может блюриться, чтобы такого не было надо приводить к целым числам как внизу
     
     CGRect textRect = CGRectMake(CGRectGetMidX(rect2) - textSize.width / 2, CGRectGetMidY(rect2) - textSize.height / 2, textSize.width, textSize.height);
     textRect = CGRectIntegral(textRect);
     
     [text drawInRect:textRect withAttributes:attiributes];
     //    CGContextAddRect(context, rect);
     //    CGContextFillPath(context);
     ////    CGContextFillRect(context, rect);
     //30:33
     */
    
#pragma mark - Chess board
    CGFloat offset = 50;
    CGFloat borderWith = 3.f;
    
    CGFloat maxBoardSize = MIN(CGRectGetWidth(rect), CGRectGetHeight(rect)) - (offset * 2) - (borderWith * 2);
    
    int cellSize = (int)maxBoardSize / 8;
    int boardSize = cellSize * 8;
    
    CGRect boardRect = CGRectMake((CGRectGetWidth(rect) - boardSize) / 2,
                                  (CGRectGetHeight(rect) - boardSize) / 2, boardSize, boardSize);
    
    boardRect = CGRectIntegral(boardRect);
    
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (i % 2 != j % 2) {
                CGRect cellRect = CGRectMake(CGRectGetMinX(boardRect) + i * cellSize, CGRectGetMinY(boardRect) + j * cellSize, cellSize, cellSize);
                CGContextAddRect(context, cellRect);
            }
        }
    }
    
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextSetLineWidth(context, borderWith);
    CGContextAddRect(context, boardRect);
    CGContextStrokePath(context);
    
#pragma mark - Chess letters
    
    UIFont *font = [UIFont systemFontOfSize:19];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowBlurRadius = 1;
    
    NSDictionary *attiributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName, shadow, NSShadowAttributeName, font, NSFontAttributeName, nil];
    
    NSArray *letters = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", nil];
    for (int i = 0; i < letters.count; i++) {
        NSString *text = letters[i];
        
        CGSize textSize = [text sizeWithAttributes:attiributes];
//        NSLog(@"%@", NSStringFromCGRect(boardRect));

        CGRect textRect = CGRectMake(CGRectGetMinX(boardRect) + i * cellSize + (cellSize / 2) - textSize.width / 2, CGRectGetMaxY(boardRect) + 10, MAX(textSize.width, textSize.height), MAX(textSize.width, textSize.height));
        textRect = CGRectIntegral(textRect);
        
        [text drawInRect:textRect withAttributes:attiributes];
        //        [text drawAtPoint:CGPointMake(CGRectGetMinX(boardRect) + i * cellSize + (cellSize / 2), CGRectGetMaxY(boardRect) + 20) withAttributes:nil];
    }
    
    NSArray *numbers = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
    for (int i = 0; i < numbers.count; i++) {
        //        NSString *text = numbers[i];
        NSString *text = [numbers objectAtIndex:i];
        
        CGSize textSize = [text sizeWithAttributes:attiributes];
        CGRect textRect = CGRectMake(CGRectGetMinX(boardRect) - 20, CGRectGetMaxY(boardRect) - i * cellSize - (cellSize / 2) - textSize.width, MAX(textSize.width, textSize.height), MAX(textSize.width, textSize.height));
        textRect = CGRectIntegral(textRect);
        
        [text drawInRect:textRect withAttributes:attiributes];
        
        //        [text drawAtPoint:CGPointMake(CGRectGetMinX(boardRect) - 20, CGRectGetMaxY(boardRect) - i * cellSize - (cellSize / 2)) withAttributes:nil];
    }
}
@end
