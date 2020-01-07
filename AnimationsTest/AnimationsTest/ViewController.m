//
//  ViewController.m
//  AnimationsTest
//
//  Created by Michael Sidoruk on 07.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *testView;
@property (weak, nonatomic) UIImageView *testImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    //    view.backgroundColor = [UIColor greenColor];
    //    [self.view addSubview:view];
    //
    //    self.testView = view;
    
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    
    UIImage *image1 = [UIImage imageNamed:@"1"];
    UIImage *image2 = [UIImage imageNamed:@"2"];
    UIImage *image3 = [UIImage imageNamed:@"3"];

    NSArray *images = [NSArray arrayWithObjects:image1,image2,image3, image2, nil];
    
    view.animationImages = images;
    view.animationDuration = 1.5f;
    [view startAnimating];
    
    
    [self.view addSubview:view];
    
    self.testImageView = view;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self moveView:self.testImageView];
    
//    [UIView animateWithDuration:5
//                     animations:^{
//        self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, CGRectGetHeight(self.view.bounds) / 2);
//    }];
    
    
//    [UIView animateWithDuration:5
//                     animations:^{
//        self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) - CGRectGetWidth(self.testView.frame) / 2, 150);
//    }];
    
//    [UIView animateWithDuration:<#(NSTimeInterval)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
    
//    double delayInSeconds = 6;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^{
//        [self.testView.layer removeAllAnimations];
//
//        [UIView animateWithDuration:4
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
//                         animations:^{
//            self.testView.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2, 500);
//        }
//                         completion:^(BOOL finished) {
//            NSLog(@"compelete animation! %d", finished);
//        }];
//    });
    
//
//    [UIView animateWithDuration:<#(NSTimeInterval)#> delay:<#(NSTimeInterval)#> usingSpringWithDamping:<#(CGFloat)#> initialSpringVelocity:<#(CGFloat)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
}

- (void) moveView:(UIView *) view {
    
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);

    CGFloat s = (float)(arc4random() % 151) / 100.f + 0.5f;
    
    CGFloat r = (float)(arc4random() % (int)(M_PI * 2*10000)) / 10000 - M_PI;
    
    CGFloat d = (float)(arc4random() % 20001) / 10000 + 2;
    
        [UIView animateWithDuration:d
                              delay:0
                            options:UIViewAnimationOptionCurveLinear /*| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse*/
                         animations:^{
            view.center = CGPointMake(x, y);
            view.backgroundColor = [self randomColor];
    //
    //        self.testView.transform = CGAffineTransformMakeRotation(M_PI); //povorot
    ////        self.testView.transform = CGAffineTransformMakeTranslation(800, 0); //peredvijenie
    //        self.testView.transform = CGAffineTransformMakeScale(2, 0.5);
            
            
            CGAffineTransform scale = CGAffineTransformMakeScale(s, s);
            CGAffineTransform rotation = CGAffineTransformMakeRotation(r);
            
            CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
            
            view.transform = transform;
        }
                         completion:^(BOOL finished) {
            NSLog(@"compelete animation! %d", finished);
            NSLog(@"view frame = %@\nview bounds = %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
            
            __weak UIView *v = view;
            [self moveView:v];
        }];
}

- (UIColor *)randomColor {
    CGFloat r = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255.f;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255.;
    
    return [[UIColor alloc] initWithRed:r green:g blue:b alpha:1];
}

@end
