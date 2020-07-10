//
//  PostCell.m
//  Instagram
//
//  Created by denzeltov on 7/8/20.
//  Copyright © 2020 denzeltov. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setPost:(Post *)post {
    _post = post;
    self.homeStreamImageVIew.file = post[@"image"];
    [self.homeStreamImageVIew loadInBackground];
}

@end
