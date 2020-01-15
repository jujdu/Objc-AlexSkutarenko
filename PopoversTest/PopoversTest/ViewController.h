//
//  ViewController.h
//  PopoversTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAdaptivePresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *myBarButton;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

- (IBAction)actionAdd:(UIBarButtonItem *)sender;
- (IBAction)actionPressMe:(UIButton *)sender;


@end

