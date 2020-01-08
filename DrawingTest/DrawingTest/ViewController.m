//
//  ViewController.m
//  DrawingTest
//
//  Created by Michael Sidoruk on 08.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import "DrawingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        printf("rotation is started\n"); //как только начинается поворот экрана
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        printf("rotation is done\n"); //как только заканчивается поворот экрана
        [self.drawingView setNeedsDisplay];
    }];
}

@end
