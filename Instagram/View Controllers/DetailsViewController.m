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
//#import "NS"


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *detailsImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionDetailsLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.captionDetailsLabel.text = self.tapPost.caption;
    self.detailsImageView.file = self.tapPost.image;
    self.timeStampLabel.text = [NSString stringWithFormat:@"%@", self.tapPost.createdAt];
    [self.detailsImageView loadInBackground];
    // fetch data asynchronously
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
