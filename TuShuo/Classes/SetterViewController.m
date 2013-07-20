//
//  SetterViewController.m
//  TuShuo
//
//  Created by ihj on 7/12/13.
//  Copyright (c) 2013 ihj.me. All rights reserved.
//

#import "SetterViewController.h"

@interface SetterViewController ()

@end

@implementation SetterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    view.backgroundColor = [UIColor orangeColor];
    self.view = view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
