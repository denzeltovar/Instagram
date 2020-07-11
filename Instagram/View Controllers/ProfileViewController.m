//
//  ProfileViewController.m
//  Instagram
//
//  Created by denzeltov on 7/10/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"
# import <Parse/Parse.h>
#import"CreatePostViewController.h"



@import Parse;
@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet PFImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePickerVC animated:YES completion:nil];
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    self.usernameLabel.text = [PFUser currentUser].username;

}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (IBAction)tapToUpdateProfile:(id)sender {
    [Post postUserImage:self.profileImageView.image withCaption:self.descriptionLabel.text withCompletion:^(BOOL succeeded, NSError * _Nullable error) {}];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    self.profileImageView.image = [self resizeImage:editedImage withSize:CGSizeMake(414, 414)];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
