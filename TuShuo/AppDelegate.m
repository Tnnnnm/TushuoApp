//
//  AppDelegate.m
//  TuShuo
//
//  Created by ihj on 7/12/13.
//  Copyright (c) 2013 ihj.me. All rights reserved.
//

#import "AppDelegate.h"
#import "TKTabBarController.h"
#import "TKTabBarItem.h"

#import "MainViewController.h"
#import "GalleryViewController.h"
#import "SearchViewController.h"
#import "UserViewController.h"
#import "SetterViewController.h"

#import "TableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    The statusBar backgroundColor
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
//    The NavigationController
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [navigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_bar"] forBarMetrics:UIBarMetricsDefault];
    mainVC.tabBarItem = [[TKTabBarItem alloc] initWithTitle:@"专题" unselectedImage:[UIImage imageNamed:@"xiangqu"] selectedImage:[UIImage imageNamed:@"xiangqu"] tag:0];
//    The NavigationController
    [viewControllers addObject:navigation];
    
    TableViewController *galleryVC = [[TableViewController alloc] init];
    galleryVC.tabBarItem = [[TKTabBarItem alloc] initWithTitle:@"画廊" unselectedImage:[UIImage imageNamed:@"goods"] selectedImage:[UIImage imageNamed:@"goods"] tag:1];
    [viewControllers addObject:galleryVC];
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    searchVC.tabBarItem = [[TKTabBarItem alloc] initWithTitle:@"动态" unselectedImage:[UIImage imageNamed:@"feed"] selectedImage:[UIImage imageNamed:@"feed"] tag:2];
    [viewControllers addObject:searchVC];
    
    UserViewController *userVc = [[UserViewController alloc] init];
    userVc.tabBarItem = [[TKTabBarItem alloc] initWithTitle:@"我的" unselectedImage:[UIImage imageNamed:@"my"] selectedImage:[UIImage imageNamed:@"my"] tag:3];
    [viewControllers addObject:userVc];
    
    SetterViewController *setterVC = [[SetterViewController alloc] init];
    setterVC.tabBarItem = [[TKTabBarItem alloc] initWithTitle:@"设置" unselectedImage:[UIImage imageNamed:@"more"] selectedImage:[UIImage imageNamed:@"more"] tag:4];
    [viewControllers addObject:setterVC];
    
    
    TKTabBarController *tabBarController = [[TKTabBarController alloc] init];
    tabBarController.tabBar.tkBackgroundImage = [UIImage imageNamed:@"tab_bar"];
    tabBarController.tabBar.tkSelectionIndicatorImage = [[UIImage imageNamed:@"tab_current"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    tabBarController.viewControllers = viewControllers;
    tabBarController.selectedIndex = 0;
        
    self.window.rootViewController = tabBarController;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
