//
//  ViewController.h
//  TextFieldTest
//
//  Created by Michael Sidoruk on 13.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;

- (IBAction)actionLog:(UIButton *)sender;
- (IBAction)actionTextChanged:(UITextField *)sender;


@end
