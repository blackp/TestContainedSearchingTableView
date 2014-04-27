//
//  BRNDetailViewController.m
//  TestContainedSearchingTableView
//
//  Created by Philip Blackwell on 27/04/2014.
//  Copyright (c) 2014 Philip Blackwell. All rights reserved.
//

#import "BRNDetailViewController.h"

@implementation BRNDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}


@end
