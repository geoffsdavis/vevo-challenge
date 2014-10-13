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

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 8, 560, 36)];
        _titleLabel.textColor = [UIColor whiteColor];
        [_titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:24]];
        [self addSubview:_titleLabel];
        _titleLabel.text = @"";
        
        _viewCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 40, 300, 40)];
        _viewCountLabel.textColor = [UIColor whiteColor];
        [_viewCountLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
        [self addSubview:_viewCountLabel];
        _viewCountLabel.text = @"";

        _thumbView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 14, 120, 90)];
        _thumbView.backgroundColor = [UIColor grayColor];
        [self addSubview:_thumbView];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGRect whiteRect = CGRectMake(29.5, 13.5, 121, 91);

    CGContextStrokeRect(context, whiteRect);
}

- (void)setThumbURL:(NSString *)thumbURL {
    _thumbURL = thumbURL;

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:_thumbURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                if (error) {
                    NSLog(@"error obtaining image");
                }
                else {
                    __weak VVTableViewCell *weakSelf = self;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [weakSelf displayThumbnail:data];
                    });
                }
                
            }] resume];
    
}

- (void)displayThumbnail:(NSData *)data {
    UIImage *image = [UIImage imageWithData:data];
    self.thumbView.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
