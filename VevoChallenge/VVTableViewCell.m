//
//  VVTableViewCell.m
//  VevoChallenge
//
//  Created by Geoffrey Scott Davis on 10/12/14.
//  Copyright (c) 2014 Geoffrey Scott Davis. All rights reserved.
//

#import "VVTableViewCell.h"

@implementation VVTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];

        UILabel *mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 40)];
        mainLabel.textColor = [UIColor whiteColor];
        [self addSubview:mainLabel];
        mainLabel.text = @"test";
        
        UILabel *viewCoutLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 40)];
        viewCoutLabel.textColor = [UIColor whiteColor];
        [self addSubview:viewCoutLabel];
        viewCoutLabel.text = @"Number of Views: ";

        UIImageView *thumbView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
        thumbView.backgroundColor = [UIColor grayColor];
        [self addSubview:thumbView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
