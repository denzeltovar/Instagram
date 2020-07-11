//
//  LoginViewController.m
//  Instagram
//
//  Created by denzeltov on 7/6/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//
#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapSignUp:(id)sender {
    PFUser *newUser = [PFUser user];
    newUser.username = self.usernameTextField.text;
    newUser.password = self.passwordTextField.text;
    [newUser signUpInBackground];
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error == nil){
            [self performSegueWithIdentifier:@"homeStreamSegue" sender:nil];
        }
    }];
}

- (IBAction)didTapLogin:(id)sender {
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error == nil) {
            [self performSegueWithIdentifier:@"homeStreamSegue" sender:nil];
        }
    }];
}
@end
