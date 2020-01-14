//
//  ViewController.m
//  FileManagerTest
//
//  Created by Michael Sidoruk on 14.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSArray *contents;

@end

@implementation ViewController

- (id) initWithFolderPath:(NSString *)path {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
        
        NSError *error = nil;
        
        self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path
                                                                            error:&error];
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self.path lastPathComponent];
    
    if ([self.navigationController.viewControllers count] > 1) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Back to root" style:UIBarButtonItemStylePlain target:self action:@selector(actionBackToRoot:)];
        self.navigationItem.rightBarButtonItem = item;
    }
}

- (void)actionBackToRoot:(UIBarButtonItem *)item {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (BOOL)isDirectoryAtIndexPath:(NSIndexPath *)indexPath {
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    NSString *filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager]fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
        
    if ([self isDirectoryAtIndexPath:indexPath]) {
        cell.imageView.image = [UIImage imageNamed:@"folder"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"file"];
    }
    
    cell.textLabel.text = fileName;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        NSString *fileName = [self.contents objectAtIndex:indexPath.row];
        
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
        ViewController *vc = [[ViewController alloc]initWithFolderPath:path];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
