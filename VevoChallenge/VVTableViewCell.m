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

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 8, 600, 36)];
        _titleLabel.textColor = [UIColor whiteColor];
        [_titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:24]];
        [self addSubview:_titleLabel];
        _titleLabel.text = @"";
        
        _viewCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 300, 40)];
        _viewCountLabel.textColor = [UIColor whiteColor];
        [_viewCountLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [self addSubview:_viewCountLabel];
        _viewCountLabel.text = @"";

        _thumbView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 14, 60, 60)];
        _thumbView.backgroundColor = [UIColor grayColor];
        [self addSubview:_thumbView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
