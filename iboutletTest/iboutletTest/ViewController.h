//
//  ViewController.h
//  iboutletTest
//
//  Created by Michael Sidoruk on 07.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *testViews;

@property (weak, nonatomic) IBOutlet UIView *myView;

@end

