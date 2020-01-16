//
//  ViewController.h
//  MapTest
//
//  Created by Michael Sidoruk on 16.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

