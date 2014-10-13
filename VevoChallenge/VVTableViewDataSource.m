//
//  VVTableViewDataSource.m
//  VevoChallenge
//
//  Created by Geoffrey Scott Davis on 10/12/14.
//  Copyright (c) 2014 Geoffrey Scott Davis. All rights reserved.
//

#import "VVTableViewDataSource.h"
#import "VVTableViewCell.h"


@interface VVTableViewDataSource ()

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray *videos;
@property (nonatomic, strong) NSMutableDictionary *currentItem;
@property (nonatomic, strong) NSString *foundCharacters;

@end

@implementation VVTableViewDataSource

- (id)initWithTableView:(UITableView*)aTableView
{
    self = [super init];
    if(self) {
        _tableView = aTableView;
        _tableView.dataSource = self;
        _videos = @[].mutableCopy;
    }
    return self;
}


- (void)loadFeed {
    
    NSString *mapURL = @"http://gdata.youtube.com/feeds/api/videos";
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:mapURL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                
                if (error) {
                    NSLog(@"error obtaining feed");
                    //[self.delegate trailDataLoaded:nil];
                }
                else {
                    NSLog(@"success!");
                    
                    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
                    parser.delegate = self;
                    [parser parse];
                    
                }
                
            }] resume];
}


#pragma mark XML Parser Delegates

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    self.videos = @[].mutableCopy;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqual:@"entry"] ) {
        self.currentItem = @{}.mutableCopy;
    }

}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    self.foundCharacters = string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqual:@"entry"] ) {
        [self.videos addObject:self.currentItem.copy];
    }
    else if ([elementName isEqual:@"title"] ) {
        self.currentItem[@"title"] = self.foundCharacters;
    }
}

- (void) parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"total videos: %ld", (long)self.videos.count);
    [self.tableView reloadData];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
    NSString *errorString = [NSString stringWithFormat:@"Error code %i", [parseError code]];
    NSLog(@"Error parsing XML: %@", errorString);

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"VideoCell";
    [tableView registerClass:[VVTableViewCell class] forCellReuseIdentifier:cellIdentifier];
    VVTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSDictionary *videoItem = self.videos[indexPath.row];
    cell.titleLabel.text = videoItem[@"title"];
    
    return cell;
}

@end
