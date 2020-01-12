//
//  ViewController.m
//  ControlsTest
//
//  Created by Michael Sidoruk on 12.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

typedef enum {
    ASColorSchemeTypeRGB,
    ASColorSchemeTypeHSV
} ASColorSchemeType;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self refresScreen];
}

#pragma mark - Private Methods

- (void) refresScreen {
    CGFloat red = self.redComponetSlider.value;
    CGFloat green = self.greenComponetSlider.value;
    CGFloat blue = self.blueComponetSlider.value;

    UIColor *color = nil;
    
    if (self.colorSchemeControl.selectedSegmentIndex == ASColorSchemeTypeRGB) {
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    } else {
        color = [UIColor colorWithHue:red saturation:green brightness:blue alpha:1];
    }
    
    CGFloat hue, saturation, brightness, alpha;
    
    NSString *result = @"";
    
    if ([color getRed:&red green:&green blue:&blue alpha:&alpha]) {
        result = [result stringByAppendingFormat:@"RGB: %1.2f, %1.2f, %1.2f", red, green, blue];
    } else {
        result = [result stringByAppendingFormat:@"RGB: {NO DATA}"];
    }
    
    if ([color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha]) {
        result = [result stringByAppendingFormat:@"\tHVS: %1.2f, %1.2f, %1.2f", hue, saturation, brightness];
    } else {
        result = [result stringByAppendingFormat:@"\tHVS: {NO DATA}"];
    }
    
    self.textLabel.text = result;
    
    self.view.backgroundColor = color;
}

#pragma mark - Actions

- (IBAction)actionSlider:(UISlider *)sender {
    [self refresScreen];
}

- (IBAction)actionSwitch:(UISwitch *)sender {
    self.redComponetSlider.enabled = sender.isOn;
    self.greenComponetSlider.enabled = sender.isOn;
    self.blueComponetSlider.enabled = sender.isOn;
    
//    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
}
@end
