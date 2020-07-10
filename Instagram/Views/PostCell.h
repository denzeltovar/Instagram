//
//  PostCell.h
//  Instagram
//
//  Created by denzeltov on 7/8/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Post.h"
@import Parse;

NS_ASSUME_NONNULL_BEGIN

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet PFImageView *homeStreamImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (strong, nonatomic) Post *post;
- (void)setPost:(Post *)post ;
@end

NS_ASSUME_NONNULL_END

