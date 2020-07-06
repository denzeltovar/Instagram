//
//  HomeStreamViewController.m
//  Instagram
//
//  Created by denzeltov on 7/6/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "HomeStreamViewController.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"

@interface HomeStreamViewController ()

@end

@implementation HomeStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
        if (error != nil) {
            NSLog(@"User log out failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged out successfully");
            // display view controller that needs to shown after successful login
            //Return back to Scene delgate
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
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
