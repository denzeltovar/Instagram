//
//  DetailsViewController.m
//  Instagram
//
//  Created by denzeltov on 7/9/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "DetailsViewController.h"
#import <Parse/Parse.h>
#import "HomeStreamViewController.h"
#import "NSDate+DateTools.h"


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *detailsImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionDetailsLabel;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.captionDetailsLabel.text = self.tapPost.caption;
    self.detailsImageView.file = self.tapPost.image;
    self.timeStampLabel.text = [self.tapPost.createdAt shortTimeAgoSinceNow];
    [self.detailsImageView loadInBackground];
}

@end
