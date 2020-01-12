//
//  ViewController.h
//  ButtonTest
//
//  Created by Michael Sidoruk on 12.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;

- (IBAction)actionTest2:(UIButton *)sender;

- (IBAction)actionTest2TouchDown:(UIButton *)sender;

@end

