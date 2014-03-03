//
//  MainController.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchViewDelegate.h"
#import "UdpController.h"

@interface MainController : UIViewController {
    id<SwitchViewDelegate> delegate;
}

@property(nonatomic,retain) id<SwitchViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIButton *btnUdpView;

-(IBAction) toUdpView:(id)sender;

@end
