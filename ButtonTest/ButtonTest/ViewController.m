//
//  ViewController.m
//  ButtonTest
//
//  Created by Michael Sidoruk on 12.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(200, 200, 200, 200);
    button.backgroundColor = [UIColor blueColor];
    
    
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:30],
//                                 NSForegroundColorAttributeName: [UIColor orangeColor]};
//
//    NSAttributedString *title = [[NSAttributedString alloc]initWithString:@"Button" attributes:attributes];
//
//    [button setAttributedTitle:title forState:UIControlStateNormal];
//
//    NSDictionary *attributes2 = @{NSFontAttributeName: [UIFont systemFontOfSize:20],
//                                 NSForegroundColorAttributeName: [UIColor whiteColor]};
//
//    NSAttributedString *title2 = [[NSAttributedString alloc]initWithString:@"Button" attributes:attributes2];
//
//    [button setAttributedTitle:title2 forState:UIControlStateHighlighted];
//

    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button setTitle:@"Button Pressed" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
//    UIEdgeInsets insets = UIEdgeInsetsMake(100, 100, 0, 0);
    
//    button.titleEdgeInsets = insets;
//    [button setTitleEdgeInsets:insets];
    
    [button addTarget:self action:@selector(actionTest:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(actionTestOutside:) forControlEvents:UIControlEventTouchUpOutside];
    [button addTarget:self action:@selector(actionTestDown:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(actionTestDragExit:) forControlEvents:UIControlEventTouchDragExit];
    [button addTarget:self action:@selector(actionTestCancel:) forControlEvents:UIControlEventTouchCancel];


    
//    [self.view addSubview:button];
}

#pragma mark - Actions

- (void)actionTest:(UIButton *)but {
    NSLog(@"button pressed inside");
}

- (void)actionTestOutside:(UIButton *)but {
    NSLog(@"button pressed outside");
}

- (void)actionTestDown:(UIButton *)but {
    NSLog(@"button pressed down");
}

- (void)actionTestDragExit:(UIButton *)but {
    NSLog(@"button pressed drag exit");
}

- (void)actionTestCancel:(UIButton *)but {
    NSLog(@"button pressed cancel");
}



- (IBAction)actionTest2:(UIButton *)sender {
    NSLog(@"actionTest2 tag = %d", sender.tag);
    self.indicatorLabel.text = [NSString stringWithFormat:@"%d", sender.tag];
}

- (IBAction)actionTest2TouchDown:(UIButton *)sender {
//    NSLog(@"actionTest2TouchDown");
}


@end
