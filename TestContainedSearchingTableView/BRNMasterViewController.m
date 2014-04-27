//
//  BRNMasterViewController.m
//  TestContainedSearchingTableView
//
//  Created by Philip Blackwell on 27/04/2014.
//  Copyright (c) 2014 Philip Blackwell. All rights reserved.
//

#import "BRNMasterViewController.h"

#import "BRNDetailViewController.h"

@interface BRNMasterViewController ()

@property (nonatomic, strong) NSArray *objects;
@property (nonatomic, strong) NSArray *searchObjects;

@end

@implementation BRNMasterViewController

- (NSArray *)objectsForTableView:(UITableView *)tableView {
    NSArray *result = nil;
    if (tableView == self.tableView) {
        result = self.objects;
    } else if (tableView == self.searchDisplayController.searchResultsTableView) {
        result = self.searchObjects;
    }
    return result;
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self objectsForTableView:tableView] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSObject *object = [[self objectsForTableView:tableView] objectAtIndex:indexPath.item];
    cell.textLabel.text = [object description];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableView *tableView;
    if (self.searchDisplayController.isActive) {
        tableView = self.searchDisplayController.searchResultsTableView;
    } else {
        tableView = self.tableView;
    }
    NSIndexPath *selectedRow = [tableView indexPathForSelectedRow];
    NSObject *object = [[self objectsForTableView:tableView] objectAtIndex:selectedRow.item];
    BRNDetailViewController *detailViewController = segue.destinationViewController;
    if ([detailViewController isKindOfClass:[BRNDetailViewController class]]) {
        [detailViewController setDetailItem:object];
    }
}

- (NSArray *)objects {
    if (!_objects) {
        _objects = @[@"A", @"B", @"C"];
    }
    return _objects;
}

-(NSArray *)searchObjects {
    if (!_searchObjects) {
        _searchObjects = @[@"1", @"2", @"3"];
    }
    return _searchObjects;
}

@end
