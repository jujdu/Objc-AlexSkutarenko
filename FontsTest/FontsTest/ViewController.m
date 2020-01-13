//
//  ViewController.m
//  FontsTest
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
//    UIEdgeInsets inset = UIEdgeInsetsMake(228, 0, 0, 0);
//    self.tableView.contentInset = inset;
//    self.tableView.scrollIndicatorInsets = inset;
    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection %d", section);
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    return [fontNames count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[section];
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath {%d, %d}", indexPath.section, indexPath.row);
    static NSString *identifire = @"Cell";
    
//    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifire];
        NSLog(@"cell created");
    } else {
        NSLog(@"cell reused");
    }
    
    NSArray *familyNames = [UIFont familyNames];
    NSString *familyName = familyNames[indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    NSString *fontName = fontNames[indexPath.row];
    
    cell.textLabel.text = fontName;
    UIFont *font = [UIFont fontWithName:fontName size:15];
    cell.textLabel.font = font;
    
    return cell;
}

@end


