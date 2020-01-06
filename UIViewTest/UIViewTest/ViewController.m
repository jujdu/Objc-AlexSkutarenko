//
//  ViewController.m
//  UIViewTest
//
//  Created by Michael Sidoruk on 06.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *testView;
@property (weak, nonatomic) UIView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view.
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
//    view1.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.6];
//    [self.view addSubview:view1];
//
//    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(90, 80, 40, 100)];
//    view2.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.7];
//    view2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
//    [self.view addSubview:view2];
//
//    self.testView = view2;
//
//    [self.view bringSubviewToFront:view1];
//
//    CGRect rect = self.view.bounds;
//       rect.origin.y = 0;
//       rect.origin.x = CGRectGetWidth(rect) - 100;
//       rect.size = CGSizeMake(100, 100);
//
//    UIView* myView = [[UIView alloc]initWithFrame:rect];
//    myView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
//    [self.view addSubview:myView];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    self.testView.bounds = CGRectMake(2, 2, 100, 150);
//    NSLog(@"\n frame = %@ \nbounds = %@", NSStringFromCGRect(self.testView.frame), NSStringFromCGRect(self.testView.bounds));
    NSLog(@"\n frame = %@ \nbounds = %@", NSStringFromCGRect(self.view.frame), NSStringFromCGRect(self.view.bounds));
    
    CGPoint origin = CGPointZero;
    
    origin = [self.view convertPoint:origin toView:self.view.window];
    
    NSLog(@"origin = %@", NSStringFromCGPoint(origin));
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 0;
    rect.origin.x = CGRectGetWidth(rect) - 100;
    rect.size = CGSizeMake(100, 100);
    
    self.myView.bounds = rect;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"ScrollView%@", NSStringFromCGPoint(scrollView.contentOffset));
    NSLog(@"Bounds%@", NSStringFromCGPoint(scrollView.bounds.origin));
}


@end
