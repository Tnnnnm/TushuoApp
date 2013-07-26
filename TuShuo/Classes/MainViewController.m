//
//  MainViewController.m
//  TuShuo
//
//  Created by ihj on 7/12/13.
//  Copyright (c) 2013 ihj.me. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

    @property (nonatomic, retain) NSMutableArray *items;


@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Home";
    }
    return self;
}

//-(void)loadView
//{
//    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
//    view.backgroundColor = [UIColor purpleColor];
//    self.view = view;
//}

@synthesize myScrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    The NavigationBar.titleView
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"magazine_title"] highlightedImage:[UIImage imageNamed:@"magazine_title_gry"]];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleView;
    
    
    //set the background to white color
//    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_nosie"]];
    //initialize and allocate your scroll view
    self.myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //set the paging to yes
    self.myScrollView.pagingEnabled = YES;
    
    NSArray *imgArr = [NSArray arrayWithObjects:@"photo.JPG",@"photo-1.JPG",@"photo-2.JPG",nil];
    NSArray *labelItems = [NSArray arrayWithObjects:@"First",@"Second",@"Third",nil];
//    for(id img in imgArr){
//        NSLog(@"imageName:%@", img);
//        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//        imgView.image = [UIImage imageNamed:img];
//        
//        self.myScrollView.delegate = self;
//        //add the subview to the scroll view
//        [self.myScrollView addSubview:imgView];
//    }
    
    //lets create 10 views
    for (int i = 0; i < [imgArr count]; i++) {
        
        //set the origin of the sub view
        CGFloat myOrigin = i * self.view.frame.size.width + 36;
        
        //create the sub view and allocate memory
//        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(myOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
        UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(myOrigin, 10, 248, 336)];
        myView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cover-magazine"]];
        
//        The image
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 228, 306)];
        imgView.image = [UIImage imageNamed:[imgArr objectAtIndex:i]];
        [myView addSubview:imgView];
        
//        The label
//        UILabel *label = nil;
//        //    label = [[UILabel alloc] initWithFrame:view.bounds];
//        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 320, 320, 35)];
//        //    NSArray *labelColor = [NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", nil]];
//        label.backgroundColor = [UIColor orangeColor];
//        //    visible
//        label.shadowColor = [[UIColor alloc] initWithWhite:0.6f alpha:0.3f];
//        label.textAlignment = UITextAlignmentCenter;
//        label.font = [label.font fontWithSize:50];
//        label.tag = 1;
////        label.text = [[labelItems objectAtIndex:i] stringValue];
//        label.text = @"Hello";
//        [imgView addSubview:label];
        
        //set the scroll view delegate to self so that we can listen for changes
        self.myScrollView.delegate = self;
        //add the subview to the scroll view
        [self.myScrollView addSubview:myView];
    }
    
    //set the content size of the scroll view, we keep the height same so it will only scroll horizontally
    self.myScrollView.contentSize = CGSizeMake(self.view.frame.size.width * [imgArr count],
                                               self.view.frame.size.height);
    
    //we set the origin to the 3rd page
    CGPoint scrollPoint = CGPointMake(self.view.frame.size.width * 2, 0);
    //change the scroll view offset the the 3rd page so it will start from there
    [self.myScrollView setContentOffset:scrollPoint animated:YES];
    
    [self.view addSubview:self.myScrollView];
    
}

//scrolling ends
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    //find the page number you are on
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"Scrolling - You are now on page %i",page);
}

//dragging ends, please switch off paging to listen for this event
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *) targetContentOffset NS_AVAILABLE_IOS(5_0){
    
    //find the page number you are on
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSLog(@"Dragging - You are now on page %i",page);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
