//
//  ViewController.h
//  FileManagerTest
//
//  Created by Michael Sidoruk on 14.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (strong, nonatomic) NSString *path;

- (id) initWithFolderPath:(NSString *)path;

- (IBAction)actionInfoCell:(id)sender;

@end

