//
//  DetailsViewController.h
//  Instagram
//
//  Created by denzeltov on 7/9/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property(nonatomic, strong) Post *tapPost;


@end

NS_ASSUME_NONNULL_END
