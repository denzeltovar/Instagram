//
//  CreatePostViewController.m
//  Instagram
//
//  Created by denzeltov on 7/7/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "CreatePostViewController.h"
#import"HomeStreamViewController.h"
#import <Parse/Parse.h>
#import "SceneDelegate.h"
#import"Post.h"

@interface CreatePostViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *composeImageView;
@property (weak, nonatomic) IBOutlet UITextField *captionTextField;

@end

@implementation CreatePostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        NSLog(@"Camera 🚫 available so we will use photo library instead");
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
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

- (IBAction)didTapPost:(id)sender {
    [Post postUserImage:self.composeImageView.image withCaption:self.captionTextField.text withCompletion:^(BOOL succeeded, NSError * _Nullable error){}];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma Mark - Delegate MEthods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    // Do something with the images (based on your use case)
    self.composeImageView.image = [self resizeImage:editedImage withSize:CGSizeMake(414, 414)];
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
