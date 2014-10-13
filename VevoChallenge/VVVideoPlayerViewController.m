//
//  VVVideoPlayerViewController.m
//  VevoChallenge
//
//  Created by Geoffrey Scott Davis on 10/12/14.
//  Copyright (c) 2014 Geoffrey Scott Davis. All rights reserved.
//

#import "VVVideoPlayerViewController.h"


@interface VVVideoPlayerViewController ()

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation VVVideoPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,768,720)];
    self.webView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.webView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSURL *url = [NSURL URLWithString:self.videoURL];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.webView = nil;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
