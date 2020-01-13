//
//  ViewController.m
//  TextFieldTest
//
//  Created by Michael Sidoruk on 13.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstNameField.delegate = self;
    self.lastNameField.delegate = self;
    
    [self.firstNameField becomeFirstResponder];
    // Do any additional setup after loading the view.
//    self.firstNameField.keyboardAppearance = UIKeyboardAppearanceDark;
//    self.lastNameField.keyboardAppearance = UIKeyboardAppearanceLight;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(notificationTextDidBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidEndEditing:) name:UITextFieldTextDidEndEditingNotification object:nil];
    [nc addObserver:self selector:@selector(notificationTextDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

- (void)notificationTextDidBeginEditing:(NSNotification *)notification {
    NSLog(@"notificationTextDidBeginEditing");
}

- (void)notificationTextDidEndEditing:(NSNotification *)notification {
    NSLog(@"notificationTextDidEndEditing");
}

- (void)notificationTextDidChange:(NSNotification *)notification {
    NSLog(@"notificationTextDidChange");
}

#pragma mark - Actions
- (IBAction)actionLog:(UIButton *)sender {
    NSLog(@"First name = %@, Last name = %@",self.firstNameField.text, self.lastNameField.text);
    
    if ([self.firstNameField isFirstResponder]) {
        [self.firstNameField resignFirstResponder];
    } else if ([self.lastNameField isFirstResponder]) {
        [self.firstNameField resignFirstResponder];
    }
}

- (IBAction)actionTextChanged:(UITextField *)sender {
    NSLog(@"%@",sender.text);

}
#pragma mark - UITextFieldDelegate
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return [textField isEqual:self.firstNameField];
//}       // return NO to disallow editing.
//
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField {
//    return NO;
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.firstNameField]) {
        [self.lastNameField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end



//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
//- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)); // if implemented, called in place of textFieldDidEndEditing:
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
//
//- (void)textFieldDidChangeSelection:(UITextField *)textField API_AVAILABLE(ios(13.0), tvos(13.0));
//
//- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
//- (BOOL)textFieldShouldReturn:(UITextField *)textField;
