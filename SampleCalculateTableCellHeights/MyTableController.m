//
//  MyTableController.m
//  SampleCalculateTableCellHeights
//
//  Created by Peter Chen on 1/13/14.
//  Copyright (c) 2014 Peter Chen. All rights reserved.
//

#import "MyTableController.h"

#define kCellTopMargin  10
#define kCellLeftMargin 15
#define kFontSize       15

@interface MyTableController ()

@property (nonatomic, strong) NSArray *displayStrings;

@end

@implementation MyTableController

- (id)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.displayStrings = @[
                                @"Short string",
                                @"START alskdjhflkj ahsdlkfj hlkashdflkjhasdlfkhj aslkdf lkahjsdflkajhdsflkjhsd kh END",
                                @"START alskdjflaksd fhlkjahsdflkjhalllllll END",
                                @"START alskjdfhl uiyt zkchg hasfgh asdjhvgkuy gakjhba sdkjyga sdkfykasydf asduyg kauysdfg zxcky gasdfky gkuyasgdfk guyasdf END",
                                @"START yasdfg ashjdfgjhagsdfgkhasdf END",
                                ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
}

//==================================================
#pragma mark - Table view
//==================================================

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.displayStrings count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *displayString = self.displayStrings[indexPath.row];
    CGRect boundingRect = [displayString boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width - 2 * kCellLeftMargin, 1000)
                                                      options:NSStringDrawingUsesLineFragmentOrigin // from the doc, "To correctly draw and size multi-line text, pass
                                                                                                    // NSStringDrawingUsesLineFragmentOrigin in the options parameter"
                                                   attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:kFontSize] }
                                                      context:nil];
    CGFloat rowHeight = ceilf(boundingRect.size.height);
    NSLog(@"Height = %f for '%@'", rowHeight, displayString);
    return rowHeight + 2 * kCellTopMargin;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:kFontSize];
    
    NSString *displayString = self.displayStrings[indexPath.row];
    cell.textLabel.text = displayString;
    return cell;
}

@end
