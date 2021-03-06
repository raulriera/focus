//
//  RootViewController.h
//  test
//
//  Created by Lan Chenyu on 30/01/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SimpleViewController.h"

@interface RootViewController : UIViewController<UIScrollViewDelegate, UIGestureRecognizerDelegate> {
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}

@property (strong, nonatomic) SimpleViewController *simpleViewController;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIView *scrollBar;
@property (weak, nonatomic) IBOutlet UIImageView *pointer;

@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

@property (nonatomic, strong) IBOutlet UIImageView *inboxBarImageView;
@property (nonatomic, strong) IBOutlet UIImageView *todayBarImageView;
@property (nonatomic, strong) IBOutlet UIImageView *afterBarImageView;
@property (nonatomic, strong) IBOutlet UIImageView *somedayBarImageView;

- (void)updateBadge;

- (IBAction)pressScrollBarIcon:(id)sender;


@end
