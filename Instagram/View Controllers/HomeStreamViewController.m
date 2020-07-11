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
#import "SceneDelegate.h"
#import "CreatePostViewController.h"
#import "PostCell.h"
#import "Post.h"
#import "DetailsViewController.h"
#import "NSDate+DateTools.h"
@import Parse;

@interface HomeStreamViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NSMutableArray *posts;
@end

@implementation HomeStreamViewController

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self fetchPosts];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView insertSubview:self.refreshControl atIndex:0];
    
}

-(void)fetchPosts {
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;
    [query includeKey:@"author"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        if (posts != nil) {
            self.posts = (NSMutableArray *) posts;
            NSLog(@"%@", self.posts);
            [self.tableView reloadData];
        }
        [self.refreshControl endRefreshing];
    }];
}

- (IBAction)didTapLogout:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        if (error == nil){
            SceneDelegate *sceneDelegate = (SceneDelegate *)self.view.window.windowScene.delegate;
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            sceneDelegate.window.rootViewController = loginViewController;
        }
    }];
}

- (IBAction)didTapCreatePost:(id)sender {
    [self performSegueWithIdentifier:@"createPostSegue" sender:nil];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.posts[indexPath.row];
    cell.captionLabel.text = post.caption;
    cell.usernameLabel.text = [PFUser currentUser].username;
    cell.timeStampLabel.text = post.createdAt.shortTimeAgoSinceNow;
    
    [cell setPost:post];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

-(void)didPost: (Post *)post {
    [self.posts insertObject:post atIndex:0];
    [self.tableView reloadData];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsView"]) {
        UITableViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell: tappedCell];
        Post *tappedPost = self.posts[indexPath.row];
        DetailsViewController *detailsViewConroller = [segue destinationViewController];
        detailsViewConroller.tapPost = tappedPost;
        [self.tableView deselectRowAtIndexPath:indexPath animated: YES];
    }
}
@end
