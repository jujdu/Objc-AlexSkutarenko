//
//  ViewController.m
//  TableEditingTest
//
//  Created by Michael Sidoruk on 14.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Group.h"
 
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) UITableView *tableView;
@property (weak, nonatomic) UIBarButtonItem *addButton;

@property (strong, nonatomic) NSMutableArray* groupsArray;
@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    CGRect frame = self.view.bounds;
    frame.origin = CGPointZero;
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    self.view.backgroundColor = [UIColor redColor];
    
    tableView.editing = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.groupsArray = [NSMutableArray array];
    
//    for (int i = 0; i < 10; i++) {
//        Group *group = [[Group alloc]init];
//        group.name = [NSString stringWithFormat:@"Group №%d", i];
//
//        NSMutableArray *array = [NSMutableArray array];
//
//        for (int j = 0; j < 15; j++) {
//            [array addObject:[Student randomStudent]];
//        }
//
//        group.students = array;
//
//        [self.groupsArray addObject:group];
//    }
//
//    [self.tableView reloadData];
    
    self.navigationItem.title = @"Students";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(actionEdit:)];
    self.navigationItem.rightBarButtonItem = editButton;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(actionAddSection:)];
    self.addButton = addButton;
    self.navigationItem.leftBarButtonItem = self.addButton;
    self.tableView.editing = NO;
}

#pragma mark - Actions

- (void)actionEdit:(UIBarButtonItem *)sender {
    BOOL isEditing = self.tableView.editing;
    [self.tableView setEditing:!isEditing animated:YES];
    
    UIBarButtonSystemItem item = UIBarButtonSystemItemEdit;
    
    if (self.tableView.editing) {
        item = UIBarButtonSystemItemDone;
    }
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:item target:self action:@selector(actionEdit:)];
    [self.navigationItem setRightBarButtonItem:editButton animated:NO];
}

- (void)actionAddSection:(UIBarButtonItem *)sender {
    Group *group = [[Group alloc]init];
    group.name = [NSString stringWithFormat:@"Group №%d", [self.groupsArray count] + 1];
//    group.students = @[[Student randomStudent], [Student randomStudent]];
    
    [self.groupsArray insertObject:group atIndex:0];
    
    NSInteger newSectionIndex = 0;
    
//    [self.tableView beginUpdates];
//
//    NSIndexSet *insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
//    [self.tableView insertSections:insertSections withRowAnimation:UITableViewRowAnimationLeft];
//
//    [self.tableView endUpdates];
    
    [self.tableView performBatchUpdates:^{
        self.addButton.enabled = false;
        NSIndexSet *insertSections = [NSIndexSet indexSetWithIndex:newSectionIndex];
        [self.tableView insertSections:insertSections withRowAnimation: [self.groupsArray count] % 2 ? UITableViewRowAnimationLeft : UITableViewRowAnimationRight];
    } completion:^(BOOL finished) {
        self.addButton.enabled = true;
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.groupsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.groupsArray objectAtIndex:section] name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.groupsArray objectAtIndex:section] students] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *addStudentIdentifier = @"addStudentCell";
    
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:addStudentIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:addStudentIdentifier];
            cell.textLabel.textColor = [UIColor blueColor];
            cell.textLabel.text = @"Tap to add a new Student";
        }
        return cell;
    }
    
    static NSString *studentIdentifier = @"StudentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:studentIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:studentIdentifier];
    }
    
    Group *group = [self.groupsArray objectAtIndex:indexPath.section];
    Student *student = [group.students objectAtIndex:indexPath.row - 1];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%1.2f", student.averageGrade];
    
    if (student.averageGrade >= 4.0) {
        cell.detailTextLabel.textColor = [UIColor greenColor];
    } else if (student.averageGrade >= 3.0) {
        cell.detailTextLabel.textColor = [UIColor orangeColor];
    } else {
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row > 0;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Group *sourceGroup = [self.groupsArray objectAtIndex:sourceIndexPath.section];
    Student *student = [sourceGroup.students objectAtIndex:sourceIndexPath.row - 1];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:sourceGroup.students];
    
    NSLog(@"before%@", tempArray);

    if (sourceIndexPath.section == destinationIndexPath.section) {
        [tempArray removeObjectAtIndex:sourceIndexPath.row - 1];
        [tempArray insertObject:student atIndex:destinationIndexPath.row - 1];
        sourceGroup.students = tempArray;
        NSLog(@"after%@", tempArray);
    } else {
        [tempArray removeObject:student];
        sourceGroup.students = tempArray;
        
        Group *destinationGroup = [self.groupsArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationGroup.students];
        [tempArray insertObject:student atIndex:destinationIndexPath.row - 1];
        destinationGroup.students = tempArray;
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Group *sourceGroup = [self.groupsArray objectAtIndex:indexPath.section];
        Student *student = [sourceGroup.students objectAtIndex:indexPath.row - 1];
        
        NSMutableArray *tempArray = [NSMutableArray arrayWithArray:sourceGroup.students];
        [tempArray removeObject:student];
        sourceGroup.students = tempArray;
        [self.tableView performBatchUpdates:^{
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        } completion:^(BOOL finished) {
            
        }];
    }
}
#pragma mark - UITableViewDelegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row == 0 ? UITableViewCellEditingStyleNone : UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remove";
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    if (proposedDestinationIndexPath.row == 0) {
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (indexPath.row == 0) {
        Group *group = [self.groupsArray objectAtIndex:indexPath.section];
        NSMutableArray *tempArray = nil;
        
        if (group.students) {
            tempArray = [NSMutableArray arrayWithArray:group.students];
        } else {
            tempArray = [NSMutableArray array];
        }
        
        [tempArray insertObject:[Student randomStudent] atIndex:0];
        group.students = tempArray;
        
        [self.tableView performBatchUpdates:^{
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForItem:1 inSection:indexPath.section];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        } completion:^(BOOL finished) {
            
        }];
    } else {
        
    }
}

@end
