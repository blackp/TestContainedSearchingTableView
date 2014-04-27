//
//  BRNDetailViewController.h
//  TestContainedSearchingTableView
//
//  Created by Philip Blackwell on 27/04/2014.
//  Copyright (c) 2014 Philip Blackwell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRNDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
