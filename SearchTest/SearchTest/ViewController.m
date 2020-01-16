//
//  ViewController.m
//  SearchTest
//
//  Created by Michael Sidoruk on 15.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Random.h"
#import "Section.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *namesArray;

@property (strong, nonatomic) NSArray *sectionsArray;

@property (strong, nonatomic) NSOperation *operation;
@property (strong, nonatomic) NSOperationQueue *operationQueue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 0; i < 300000; i++) {
        [array addObject:[[NSString randomAlphanumeric] capitalizedString]];
    }
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"self" ascending:YES];
    [array sortUsingDescriptors:@[sortDescriptor]];
    self.namesArray = array;
//    self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFiler:self.searchBar.text];
    
    [self generateSectionsInBackgroundFromArray:self.namesArray withFiler:self.searchBar.text];
    [self.tableView reloadData];
}


- (void)generateSectionsInBackgroundFromArray:(NSArray *)array withFiler:(NSString *)filterString {
    [self.operation cancel];
    
    __weak ViewController *weakSelf = self;
    self.operationQueue = [[NSOperationQueue alloc]init];
    self.operation = [NSBlockOperation blockOperationWithBlock:^{
        NSArray *sectionsArray = [weakSelf generateSectionsFromArray:array withFiler:filterString];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.sectionsArray = sectionsArray;
            [weakSelf.tableView reloadData];
            
            weakSelf.operation = nil;
        });
    }];
    
    [self.operationQueue addOperation:self.operation];
//    [self.operation start];
}

- (NSArray *)generateSectionsFromArray:(NSArray *)array withFiler:(NSString *)filterString {
    NSMutableArray *sectionsArray = [NSMutableArray array];
    
    NSString *currentLetter = nil;
    
    for (NSString *string in array) {
        if ([filterString length] > 0 && [string rangeOfString:filterString].location == NSNotFound) {
            continue;
        }
        
        NSString *firstLetter = [string substringToIndex:1];
        
        Section *section = nil;
        
        if (![currentLetter isEqualToString:firstLetter]) {
            section = [[Section alloc]init];
            section.itemsArray = [NSMutableArray array];
            section.sectionName = firstLetter;
            currentLetter = firstLetter;
            [sectionsArray addObject:section];
        } else {
            section = [sectionsArray lastObject];
        }
        
        [section.itemsArray addObject:string];
    }
    return sectionsArray;
}

#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.sectionsArray objectAtIndex:section] itemsArray] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.sectionsArray objectAtIndex:section] sectionName];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    Section *section = [self.sectionsArray objectAtIndex:indexPath.section];
    NSString *name = [section.itemsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = name;
    
    return cell;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *array = [NSMutableArray array];
    
    for (Section *section in self.sectionsArray) {
        [array addObject:section.sectionName];
    }
    
    return array;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//    self.sectionsArray = [self generateSectionsFromArray:self.namesArray withFiler:self.searchBar.text];
//    [self.tableView reloadData];
    [self generateSectionsInBackgroundFromArray:self.namesArray withFiler:self.searchBar.text];
    [self.tableView reloadData];
}

@end
