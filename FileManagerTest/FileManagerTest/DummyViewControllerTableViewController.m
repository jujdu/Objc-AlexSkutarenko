//
//  DummyViewControllerTableViewController.m
//  FileManagerTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "DummyViewControllerTableViewController.h"

@interface DummyViewControllerTableViewController ()

@end

@implementation DummyViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"shouldPerformSegueWithIdentifier: %@", identifier);
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue %@", segue.identifier);
}
@end
