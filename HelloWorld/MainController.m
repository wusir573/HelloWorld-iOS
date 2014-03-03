//
//  MainController.m
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import "MainController.h"


//@interface MainController ()
//
//@end



@implementation MainController


@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toUdpView:(id)sender {
    NSLog(@"get detail …, window.views: %@",self.view.window.subviews);
    UdpController *detailController=[[UdpController alloc] initWithNibName:@"UdpController" bundle:nil];
    self.view.window.rootViewController=detailController;
    NSLog(@"window.views: %@",detailController.view.window.subviews);

    //[delegate toUdpView];
}


@end
