//
//  ImageViewController.m
//  RTImageLoader
//
//  Created by Ryan Tang on 13-7-7.
//  Copyright (c) 2013年 Ericsson Labs. All rights reserved.
//

#import "ImageViewController.h"
#import "UIImageView+WebCache.h"

@interface ImageViewController ()

@end

@implementation ImageViewController
@synthesize imgURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 450)];
    [self.view addSubview:imageView];
    NSURL *graphURL = [NSURL URLWithString:self.imgURL];
    [imageView setImageWithURL:graphURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    //单独异步下载一个图片
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:self.imgURL] options:0 progress:^(NSUInteger receivedSize, long long expectedSize) {
//        
//    }  completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        if (image && finished) {
//            imageView.image = image;
//        }
//    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
