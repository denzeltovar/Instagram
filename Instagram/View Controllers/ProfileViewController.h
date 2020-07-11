//
//  ProfileViewController.h
//  Instagram
//
//  Created by denzeltov on 7/10/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCell.h"
#import "Post.h"
#import<Parse/Parse.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic, strong) Post *profileTab;
@end

NS_ASSUME_NONNULL_END
