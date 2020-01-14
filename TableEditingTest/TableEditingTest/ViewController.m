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
    
    for (int i = 0; i < 10; i++) {
        Group *group = [[Group alloc]init];
        group.name = [NSString stringWithFormat:@"Group №%d", i];
        
        NSMutableArray *array = [NSMutableArray array];
        
        for (int j = 0; j < 15; j++) {
            [array addObject:[Student randomStudent]];
        }
        
        group.students = array;
        
        [self.groupsArray addObject:group];
    }
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.groupsArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.groupsArray objectAtIndex:section] name];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.groupsArray objectAtIndex:section] students] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    Group *group = [self.groupsArray objectAtIndex:indexPath.section];
    Student *student = [group.students objectAtIndex:indexPath.row];
    
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
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    Group *sourceGroup = [self.groupsArray objectAtIndex:sourceIndexPath.section];
    Student *student = [sourceGroup.students objectAtIndex:sourceIndexPath.row];
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:sourceGroup.students];
    
    NSLog(@"before%@", tempArray);

    if (sourceIndexPath.section == destinationIndexPath.section) {
        if (sourceIndexPath.row < destinationIndexPath.row) {
            [tempArray insertObject:student atIndex:destinationIndexPath.row + 1];
            [tempArray removeObjectAtIndex:sourceIndexPath.row];
        } else {
            [tempArray insertObject:student atIndex:destinationIndexPath.row];
            [tempArray removeObjectAtIndex:sourceIndexPath.row + 1];
        }
        NSLog(@"after%@", tempArray);
    } else {
        [tempArray removeObject:student];
        sourceGroup.students = tempArray;
        
        Group *destinationGroup = [self.groupsArray objectAtIndex:destinationIndexPath.section];
        tempArray = [NSMutableArray arrayWithArray:destinationGroup.students];
        [tempArray insertObject:student atIndex:destinationIndexPath.row];
        destinationGroup.students = tempArray;
    }
    
    
}

@end
