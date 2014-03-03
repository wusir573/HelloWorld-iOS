//
//  RootViewController.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UdpController.h"
#import "HttpViewController.h"
#import "ICViewPagerController.h"
#import "XViewController.h"

@interface RootViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tableViewList;
    NSMutableArray *dataItems; 
}

-(IBAction) toUdpView:(id)sender;
-(IBAction) toHttpView:(id)sender;
-(IBAction) toICViewPage:(id)sender;
-(IBAction) toXView:(id)sender;

@end
