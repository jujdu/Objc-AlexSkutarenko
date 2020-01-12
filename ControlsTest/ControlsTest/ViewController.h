//
//  ViewController.h
//  ControlsTest
//
//  Created by Michael Sidoruk on 12.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UISlider *redComponetSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenComponetSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueComponetSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSchemeControl;

- (IBAction)actionSlider:(UISlider *)sender;
- (IBAction)actionSwitch:(UISwitch *)sender;

@end

