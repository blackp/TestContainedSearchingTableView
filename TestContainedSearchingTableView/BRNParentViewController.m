//
//  BRNParentViewController.m
//  TestContainedSearchingTableView
//
//  Created by Philip Blackwell on 27/04/2014.
//  Copyright (c) 2014 Philip Blackwell. All rights reserved.
//

#import "BRNParentViewController.h"

@interface BRNParentViewController ()

@end

@implementation BRNParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *masterViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MasterViewController"];
    [self addChildViewController:masterViewController];
    UIScrollView *scrollView = (UIScrollView *)masterViewController.view;
    if ([scrollView isKindOfClass:[UIScrollView class]]) {
        scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    }
    [self.view addSubview:masterViewController.view];
    [masterViewController didMoveToParentViewController:self];
}


-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Make sure any scroll views have insets taking into account our topLayoutGuide
    for (UIView * subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]){
            UIScrollView * scrollView = (UIScrollView *)subview;
            UIEdgeInsets currentInsets = scrollView.contentInset;
            scrollView.contentInset = (UIEdgeInsets){
                .top = self.topLayoutGuide.length,
                .bottom = currentInsets.bottom,
                .left = currentInsets.left,
                .right = currentInsets.right
            };
            scrollView.scrollIndicatorInsets = scrollView.contentInset;
        }
    }
}


@end
