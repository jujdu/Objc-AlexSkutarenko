//
//  ViewController.m
//  TextFieldFormatTest
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
    // Do any additional setup after loading the view.
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"textField text = %@", textField.text);
//    NSLog(@"shouldChangeCharactersInRange = %@", NSStringFromRange(range));
//    NSLog(@"replacementString = %@", string);
    
    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
    }
        
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    // +XX (XXX) XXX-XXXX
    
    NSArray *validCompents = [newString componentsSeparatedByCharactersInSet:validationSet];
    
    newString = [validCompents componentsJoinedByString:@""];
    // XXXXXXXXXX
    
    static const int localNumberMaxLength = 7;
    static const int areaCodeMaxLength = 3;
    static const int countryCodeMaxLength = 3;
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength + countryCodeMaxLength) {
        return NO;
    }
    
    NSMutableString *resultString = [NSMutableString string];
    
    NSInteger localNumberLength = MIN([newString length], localNumberMaxLength);
    
    if (localNumberLength > 0) {
        NSString *number = [newString substringFromIndex:(int)([newString length] - localNumberLength)];
        [resultString appendString:number];
        
        if ([resultString length] > 3) {
            [resultString insertString:@"-" atIndex:3];
        }
    }
    
    if ([newString length] > localNumberMaxLength) {
        NSInteger areaCodeLength = MIN([newString length] - localNumberMaxLength, areaCodeMaxLength);
        
        NSRange areaRange = NSMakeRange([newString length] - localNumberMaxLength - areaCodeLength, areaCodeLength);
        
        NSString *areaCode = [newString substringWithRange:areaRange];
        
        areaCode = [NSString stringWithFormat:@"(%@) ", areaCode];
        
        [resultString insertString:areaCode atIndex:0];
    }
    
    if ([newString length] > localNumberMaxLength + areaCodeMaxLength) {
        NSInteger countryCodeLength = MIN([newString length] - localNumberMaxLength - areaCodeMaxLength, countryCodeMaxLength);
        
        NSRange countryCodeRange = NSMakeRange(0, countryCodeLength);
        
        NSString *countryCode = [newString substringWithRange:countryCodeRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        
        [resultString insertString:countryCode atIndex:0];
    }
    
    textField.text = resultString;
    
    return NO;
    
    
    /*
     XXX-XXXX
     
     */
    
//    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@" ,?"];
//    NSCharacterSet *set = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
//
////    NSArray *words = [resultString componentsSeparatedByString:@" "];
//    NSArray *words = [resultString componentsSeparatedByCharactersInSet:set];
//    NSLog(@"words = %@", words);
    
//    return [newString length] <= 10;
}
@end




//- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
