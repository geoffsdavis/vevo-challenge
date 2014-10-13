//
//  VVTableViewController.m
//  VevoChallenge
//
//  Created by Geoffrey Scott Davis on 10/12/14.
//  Copyright (c) 2014 Geoffrey Scott Davis. All rights reserved.
//

#import "VVTableViewController.h"
#import "VVTableViewCell.h"
#import "VVTableViewDataSource.h"
#import "VVVideoPlayerViewController.h"

@interface VVTableViewController ()

@property (nonatomic, strong) VVTableViewDataSource* dataSource;

@end

@implementation VVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.dataSource = [[VVTableViewDataSource alloc] initWithTableView:self.tableView];
    [self.dataSource loadFeed];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source





#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *videoURL = [self.dataSource videoURLAtIndex:indexPath];
    NSLog(@"select: %@", videoURL);
    VVVideoPlayerViewController *videoPlayerVC = [[VVVideoPlayerViewController alloc] init];
    videoPlayerVC.videoURL = videoURL;
    [self.navigationController pushViewController:videoPlayerVC animated:YES];
}



@end
