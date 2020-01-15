//
//  ViewController.m
//  FileManagerTest
//
//  Created by Michael Sidoruk on 14.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "FileCell.h"
#import "UIView+UITableViewCell.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *contents;
@property (strong, nonatomic) NSString *selectedPath;

@end

@implementation ViewController

- (id) initWithFolderPath:(NSString *)path {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.path = path;
    }
    return self;
}

- (void)setPath:(NSString *)path {
    _path = path;
    
    NSError *error = nil;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path
                                                                        error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    [self.tableView reloadData];
    self.navigationItem.title = [self.path lastPathComponent];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!self.path) {
        self.path = @"/Users/jujdu/Desktop/Objc-AlexSkutarenko";
    }
    
//    UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
//    [self.tableView registerNib:nib forCellReuseIdentifier:@"CustomCell"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    
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

- (IBAction)actionInfoCell:(UIButton *)sender {
    NSLog(@"actionInfoCell");
    UITableViewCell* cell = [sender superCell];
    
    if (cell) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        UIAlertView
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Wow"
                                                                       message:[NSString stringWithFormat:@"Button's pressed at %d %d", indexPath.section, indexPath.row]
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:true completion:nil];
        NSLog(@"action %d %d", indexPath.section, indexPath.row);
    }
}

- (NSString *)fileSizeFromValue:(unsigned long long) size {
    static NSString *units[] = { @"B", @"KB", @"MB", @"GB", @"TB"};
    static int unitsCount = 5;
    
    int index = 0;
    
    double fileSize = (double)size;
    
    while (fileSize > 1024 && index < unitsCount) {
        fileSize /= 1024;
        index++;
    }
    
    return [NSString stringWithFormat:@"%.2f %@", fileSize, units[index]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *fileIdentifier = @"FileCell";
    static NSString *folderIdentifier = @"FolderCell";
    
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:folderIdentifier];
        //        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:folderIdentifier forIndexPath:indexPath];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:folderIdentifier];
        }
        cell.textLabel.text = fileName;
        return cell;
    } else {
        NSError *error = nil;
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:&error];
        
        FileCell *cell = [tableView dequeueReusableCellWithIdentifier:fileIdentifier];
        //        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:folderIdentifier forIndexPath:indexPath];
        if (!cell) {
            cell = [[FileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fileIdentifier];
        }
        cell.fileNameLabel.text = fileName;
        cell.sizeLabel.text = [self fileSizeFromValue:[attributes fileSize]];
        
        static NSDateFormatter *dateFormatter = nil;
        
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc]init];
            [dateFormatter setDateFormat:@"DD.MM.yyyy hh:mm a"];
        }
        
        cell.dateLabel.text = [dateFormatter stringFromDate:[attributes fileModificationDate]];
        return cell;
    }
    
//    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
//
//    if (!cell) {
//        cell = (CustomCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCell"];
//    }
//    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
//
//    if ([self isDirectoryAtIndexPath:indexPath]) {
//        [cell setForPath:fileName image:[UIImage imageNamed:@"folder"]];
//    } else {
//        [cell setForPath:fileName image:[UIImage imageNamed:@"file"]];
//    }
//
//    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        NSString *fileName = [self.contents objectAtIndex:indexPath.row];
        
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
//        ViewController *vc = [[ViewController alloc]initWithFolderPath:path];
//        [self.navigationController pushViewController:vc animated:YES];
        
        
//        UIStoryboard *sb = self.storyboard;
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//       ViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ViewController"];
//        vc.path = path;
//        [self.navigationController pushViewController:vc animated:YES];
        
        self.selectedPath = path;
        
        [self performSegueWithIdentifier:@"navigateDeep" sender:nil];
        
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"shouldPerformSegueWithIdentifier: %@", identifier);
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"navigateDeep"]) {
        ViewController *vc = (ViewController *)segue.destinationViewController;
        vc.path = self.selectedPath;
    }
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return UITableViewAutomaticDimension;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self isDirectoryAtIndexPath:indexPath]) {
        return 44;
    } else {
        return 88;
    }
}

@end
