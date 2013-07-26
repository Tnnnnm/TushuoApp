//
//  TableViewController.m
//  RTImageLoader
//
//  Created by Ryan Tang on 13-7-7.
//  Copyright (c) 2013年 Ericsson Labs. All rights reserved.
//

#import "TableViewController.h"
#import "GalleryCell.h"

@interface TableViewController ()
{
    NSArray *arr_imgs;
}
@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"画廊";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
//    navigation bar
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:UITextAttributeTextColor];
    
    UIButton *setterView = [UIButton buttonWithType:UIButtonTypeCustom];
    [setterView setImage:[UIImage imageNamed:@"category"] forState:UIControlStateNormal];
    [setterView addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    [setterView setFrame:CGRectMake(0, 0, 28, 28)];
    UIBarButtonItem *setterButton = [[UIBarButtonItem alloc] initWithCustomView:setterView];
    self.navigationItem.leftBarButtonItem = setterButton;
    
    UIButton *detailView = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailView setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [detailView addTarget:self action:@selector(showDetail:) forControlEvents:UIControlEventTouchUpInside];
    [detailView setFrame:CGRectMake(0, 0, 28, 28)];
    UIBarButtonItem *detailButton = [[UIBarButtonItem alloc] initWithCustomView:detailView];
    self.navigationItem.rightBarButtonItem = detailButton;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"goback"] style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
//    [self.navigationController setNavigationBarHidden:YES];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    arr_imgs = @[
                                    @"https://lh4.googleusercontent.com/-Ql0jHSrea-A/T3R403mUfFI/AAAAAAAAAJM/qzI4SkcH9tY/s1024/sample_image_36.jpg",
                                    @"https://lh5.googleusercontent.com/-BL5FIBR_tzI/T3R41DA0AKI/AAAAAAAAAJk/GZfeeb-SLM0/s1024/sample_image_37.jpg",
                                    @"https://lh4.googleusercontent.com/-wF2Vc9YDutw/T3R41fR2BCI/AAAAAAAAAJc/JdU1sHdMRAk/s1024/sample_image_38.jpg",
                                    @"https://lh6.googleusercontent.com/-ZWHiPehwjTI/T3R41zuaKCI/AAAAAAAAAJg/hR3QJ1v3REg/s1024/sample_image_39.jpg",
                                    // Light images
                                    @"http://tabletpcssource.com/wp-content/uploads/2011/05/android-logo.png",
                                    @"http://simpozia.com/pages/images/stories/windows-icon.png",
                                    @"https://si0.twimg.com/profile_images/1135218951/gmail_profile_icon3_normal.png",
                                    @"http://www.krify.net/wp-content/uploads/2011/09/Macromedia_Flash_dock_icon.png",
                                    @"http://c.wrzuta.pl/wm16596/a32f1a47002ab3a949afeb4f",
                                    @"http://macprovid.vo.llnwd.net/o43/hub/media/1090/6882/01_headline_Muse.jpg",
                                    @"https://www.eff.org/sites/default/files/chrome150_0.jpg", // Image from HTTPS
                                    @"http://img001.us.expono.com/100001/100001-1bc30-2d736f_m.jpg"];
}

#pragma -UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_imgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *GalleryCellIdentifier = @"GalleryCell";
//    GalleryCell *cell = (GalleryCell *)[tableView dequeueReusableCellWithIdentifier:GalleryCellIdentifier];
//    if(cell == nil){
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GalleryCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    [cell.ImageArea setImageWithURL:[arr_imgs objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    cell.LabelArea.text = @"hello";
//    return cell;
    
    static NSString *customidentifier = @"GalleryCell";
    static BOOL nibsRegistered = NO;
    if(!nibsRegistered)
    {
        UINib *nib = [UINib nibWithNibName:@"GalleryCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:@"GalleryCell"];
        nibsRegistered = YES;
    }
    GalleryCell *cell = [tableView dequeueReusableCellWithIdentifier:customidentifier];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg"]];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    [cell.ImageArea setImageWithURL:[arr_imgs objectAtIndex:indexPath.row] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.LabelArea.text = @"在沉默和言语之间";
//    cell.LabelArea.font = [UIFont systemFontOfSize:13.0f];
    cell.LabelArea.textColor = [UIColor grayColor];
    
    cell.LabelAlpha.textColor = [UIColor whiteColor];
    cell.LabelAlpha.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];

//    cell.thewords.text = [self.filmkeys objectAtIndex:[indexPath row]];
//    cell.thewords.font = [UIFont systemFontOfSize:12.0];
//    cell.thewords.textColor = [UIColor grayColor];
//    cell.updateat.text = [self	.films objectForKey:[self.filmkeys objectAtIndex:[indexPath row]]];
//    cell.updateat.font = [UIFont systemFontOfSize:12.0];
//    cell.updateat.textColor = [UIColor grayColor];
    
    return cell;
    
    
//    static NSString *Identifier = @"UITableViewIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
//    }
//
//    NSInteger row = indexPath.row;
//    cell.textLabel.text = @"My Text";
//    [cell.imageView setImageWithURL:[arr_imgs objectAtIndex:row] placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    
//    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"the selected indexPath:%@",indexPath);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ImageViewController *imageViewCtrl = [[ImageViewController alloc] init];
    NSString *imgURL = [arr_imgs objectAtIndex:indexPath.row];
    imageViewCtrl.imgURL = imgURL;
    imageViewCtrl.navigationItem.title = @"ImageView";
    [self.navigationController pushViewController:imageViewCtrl animated:YES];
    if(self.navigationController == nil){
        NSLog(@"nil");
    }else{
        NSLog(@"not nil");
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
