//
//  AppDelegate.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchViewDelegate.h"
#import "MainController.h"
#import "UdpController.h"
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, SwitchViewDelegate> {

    UIWindow *window;
    //IBOutlet MainController *mainController;

}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;

@end
