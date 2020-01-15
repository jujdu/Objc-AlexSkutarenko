//
//  ViewController.m
//  PopoversTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController ()
@property (strong,nonatomic) UIViewController *popover;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)showDetailasModal:(UIViewController *)vc {
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
     [self presentViewController:vc animated:YES completion:^{
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self dismissViewControllerAnimated:YES completion:nil];
         });
     }];
}

- (void)showPopoverController:(UIViewController *)vc fromSource:(id) source {
    
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    nc.modalPresentationStyle = UIModalPresentationPopover;
    nc.preferredContentSize = CGSizeMake(300, 300);
    nc.presentationController.delegate = self;
    vc.navigationItem.title = @"Popover";
    
    if ([source isKindOfClass:[UIBarButtonItem class]]) {
        nc.popoverPresentationController.barButtonItem = self.myBarButton;
    } else if ([source isKindOfClass:[UIView class]]) {
        nc.popoverPresentationController.sourceView = self.myButton;
    }
    
    self.popover = nc;
    
    [self presentViewController:nc animated:YES completion:nil];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.popover dismissViewControllerAnimated:YES completion:nil];
//        self.popover = nil;
//    });
}

- (IBAction)actionAdd:(UIBarButtonItem *)sender {
    
    DetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self showPopoverController:vc fromSource:sender];
    } else if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self showDetailasModal:vc];
    }

}

- (IBAction)actionPressMe:(UIButton *)sender {
    
    DetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
    
    if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
       [self showPopoverController:vc fromSource:sender];        
    } else if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self showDetailasModal:vc];
    }
}
 

- (void)presentationControllerDidDismiss:(UIPresentationController *)presentationController {
    self.popover = nil;
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end



//
//
//- (IBAction)actionAdd:(UIBarButtonItem *)sender {
//
//    DetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];
////    UIPopoverController is deprecated. Popovers are now implemented as UIViewController presentations. Use a modal presentation style of UIModalPresentationPopover and UIPopoverPresentationController.
////    UIPopoverPresentationController
//    if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//
////        UIPopoverPresentationController *popover = [[UIPopoverPresentationController alloc] initWithPresentedViewController:self presentingViewController:vc];
//        vc.modalPresentationStyle = UIModalPresentationPopover;
//        vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionLeft;
//        vc.popoverPresentationController.barButtonItem = self.myBarButton;
//        vc.preferredContentSize = CGSizeMake(300, 300);
//        vc.presentationController.delegate = self;
//
//        [self presentViewController:vc animated:true completion:nil];
//
//        self.popover = vc;
//    } else if ([UIDevice.currentDevice userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        [self showDetailasModal:vc];
//    }
//
//}
