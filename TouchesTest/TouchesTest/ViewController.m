//
//  ViewController.m
//  TouchesTest
//
//  Created by Michael Sidoruk on 07.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *dragginView;
@property (assign, nonatomic) CGPoint touchOffset;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < 8; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10 + 110 * i, 100, 100, 100)];
        view.backgroundColor = [self randomColor];
        
        [self.view addSubview:view];
    }
    
    
//    self.testView = view;
    self.view.multipleTouchEnabled = YES;
}

- (UIColor *)randomColor {
    CGFloat r = (float)(arc4random() % 256) / 255.f;
    CGFloat g = (float)(arc4random() % 256) / 255.f;
    CGFloat b = (float)(arc4random() % 256) / 255.f;
    
    return [[UIColor alloc]initWithRed:r green:g blue:b alpha:1];
}

- (void)logTouches:(NSSet *)touches withMethod:(NSString *)methodName {
    NSMutableString *string = [NSMutableString stringWithString:methodName];
    for (UITouch *touch in touches) {
        CGPoint p = [touch locationInView:self.view];
        [string appendFormat:@" %@,", NSStringFromCGPoint(p)];
    }
    NSLog(@"%@", string);
}

#pragma mark - Touches

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self logTouches:touches withMethod:@"touchesBegan"];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint p = [touch locationInView:self.view];
    
    UIView *view = [self.view hitTest:p withEvent:event];
    
    if (![view isEqual:self.view]) {
        self.dragginView = view;
        [self.view bringSubviewToFront:self.dragginView];
        CGPoint touchPoint = [touch locationInView:self.dragginView];
        self.touchOffset = CGPointMake(CGRectGetMidX(self.dragginView.bounds) - touchPoint.x,
                                       CGRectGetMidY(self.dragginView.bounds) - touchPoint.y);
        NSLog(@"touchPoint = %@, touchOffset = %@", NSStringFromCGPoint(touchPoint), NSStringFromCGPoint(self.touchOffset));
        
//        [self.dragginView.layer removeAllAnimations];
        
        [UIView animateWithDuration:0.2
                         animations:^{
            self.dragginView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
            self.dragginView.alpha = 0.5f;
        }];
    } else {
        self.dragginView = nil;
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    [self logTouches:touches withMethod:@"touchesMoved"];
    
    if (self.dragginView) {
        UITouch *touch = [touches anyObject];
        CGPoint p = [touch locationInView:self.view];
        
        CGPoint correction = CGPointMake(p.x + self.touchOffset.x,
                                         p.y + self.touchOffset.y);
        self.dragginView.center = correction;
    }
}

- (void) onTouchesEnded {
    [UIView animateWithDuration:0.2
                     animations:^{
        self.dragginView.transform = CGAffineTransformIdentity;;
        self.dragginView.alpha = 1.f;
    }];
    self.dragginView = nil;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    [self logTouches:touches withMethod:@"touchesEnded"];
    [self onTouchesEnded];
    
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    [self logTouches:touches withMethod:@"touchesCancelled"];
    [self onTouchesEnded];
}

@end
