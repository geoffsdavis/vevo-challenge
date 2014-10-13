//
//  VVTableViewDataSource.h
//  VevoChallenge
//
//  Created by Geoffrey Scott Davis on 10/12/14.
//  Copyright (c) 2014 Geoffrey Scott Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VVTableViewDataSource : NSObject <UITableViewDataSource, NSXMLParserDelegate>

- (id)initWithTableView:(UITableView*)aTableView;

- (void)loadFeed;

- (NSString *)videoURLAtIndex:(NSIndexPath *)indexPath;

@end
