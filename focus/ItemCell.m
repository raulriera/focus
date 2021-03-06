//
//  ItemCell.m
//  focus
//
//  Created by Lancy on 12-2-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ItemCell.h"

@interface ItemCell ()
- (void)configureFinishCheckbox;
- (NSString *)dateStringFromNSDate:(NSDate *)date;
@end


@implementation ItemCell

@synthesize detailItem;

@synthesize titleLabel;
@synthesize infoLabel;
@synthesize priorityImageView;
@synthesize duedateLabel;
@synthesize finishCheckbox;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configureFinishCheckbox];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self configureFinishCheckbox];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - finishCheckbox

- (void)configureFinishCheckbox
{
//    UIButton *checkbox = [[UIButton alloc] init];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"chechbox1.png"] forState:UIControlStateNormal];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"chechbox2.png"] forState:UIControlStateSelected];
//    [checkbox setBackgroundImage:[UIImage imageNamed:@"chechbox2.png"] forState:UIControlStateHighlighted];
//    checkbox.adjustsImageWhenHighlighted = YES;
//    
//    [checkbox addTarget:self action:@selector(changeCheckbox:) forControlEvents:UIControlEventTouchUpInside];
//    self.finishCheckbox = checkbox;
    _checkboxSelected = NO;
    [self.finishCheckbox setSelected:_checkboxSelected];
}

- (void)setFinishCheckboxSelected:(BOOL) toggle
{
    _checkboxSelected = toggle;
    [self.finishCheckbox setSelected:toggle];
}

- (IBAction)changeCheckbox:(id)sender
{
    if ([[self.detailItem finished] boolValue] == NO)
    {
        [self setFinishCheckboxSelected:YES];
        [self.detailItem setFinished:[NSNumber numberWithBool:YES]];
    }
    else
    {
        [self setFinishCheckboxSelected:NO];
        [self.detailItem setFinished:[NSNumber numberWithBool:NO]];
    }

}

#pragma mark - duedate string

- (NSString *)dateStringFromNSDate:(NSDate *)date
{
    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc]init];
    [dayFormatter setLocale:[NSLocale currentLocale]];
    [dayFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dayFormatter setDoesRelativeDateFormatting:YES];
    
    return [dayFormatter stringFromDate:date];
}

- (void)configureDuedateLabelFromDate:(NSDate *)aDate
{
    [self.duedateLabel setText:[self dateStringFromNSDate:aDate]];
    NSLog(@"%@", aDate);
    NSLog(@"%@", self.duedateLabel.text);
}

#pragma mark - set priority

- (void)configurePriority:(NSNumber *)priorityNumber    
{
    switch ([priorityNumber intValue]) {
        case 0:
            [self.priorityImageView setImage:[UIImage imageNamed:@"Minimal"]];
            break;
        case 1:
            [self.priorityImageView setImage:[UIImage imageNamed:@"Mild"]];
            break;
        case 2:
            [self.priorityImageView setImage:[UIImage imageNamed:@"Moderate"]];
            break;
        case 3:
            [self.priorityImageView setImage:[UIImage imageNamed:@"Severe"]];
            break;

            
        default:
            break;
    }
}





@end
