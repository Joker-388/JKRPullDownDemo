//
//  AppDelegate.m
//  JKRNavigationDemo1
//
//  Created by tronsis_ios on 17/3/29.
//  Copyright © 2017年 tronsis_ios. All rights reserved.
//

#import "AppDelegate.h"
#import "JKRNavigationController.h"
#import "JKRFirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[JKRNavigationController alloc] initWithRootViewController:[JKRFirstViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
