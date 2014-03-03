//
//  UdpController.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"

@interface UdpController : UIViewController {
    
    AsyncUdpSocket *udpSocket;
    int localUdpPort;

}

@end
