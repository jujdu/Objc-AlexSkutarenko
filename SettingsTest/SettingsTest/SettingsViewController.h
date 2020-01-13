//
//  SettingsViewController.h
//  SettingsTest
//
//  Created by Michael Sidoruk on 13.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *levelControl;
@property (weak, nonatomic) IBOutlet UISwitch *shadowsSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detalizationControl;
@property (weak, nonatomic) IBOutlet UISlider *soundSlider;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;

- (IBAction)actionTextChanged:(UITextField *)sender;
- (IBAction)actionValueChanged:(id)sender;

@end

NS_ASSUME_NONNULL_END
