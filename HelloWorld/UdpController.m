//
//  UdpController.m
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import "UdpController.h"

@interface UdpController ()

@end

@implementation UdpController

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
    
    udpSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
	
	NSError *error = nil;
	
	if (![udpSocket bindToPort:0 error:&error])
	{
		NSLog(@"Error binding: %@", error);
		return;
	}
	localUdpPort = [udpSocket localPort];
    NSLog(@"localUdpPort %@", [udpSocket localHost]);
    NSLog(@"localUdpPort %d", localUdpPort);
    
    //启动接收线程
	[udpSocket receiveWithTimeout:-1 tag:0];
    [udpSocket enableBroadcast:YES error:&error];
    
	NSLog(@"Ready");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onUdpSocket:(AsyncUdpSocket *)sock didSendDataWithTag:(long)tag
{
	// You could add checks here
    NSLog(@"didSendDataWithTag --> tag = %ld", tag);
}

- (void)onUdpSocket:(AsyncUdpSocket *)sock didNotSendDataWithTag:(long)tag dueToError:(NSError *)error
{
	// You could add checks here
    NSLog(@"didNotSendDataWithTag --> error = %@", error);
}

- (BOOL)onUdpSocket:(AsyncUdpSocket *)sock
     didReceiveData:(NSData *)data
            withTag:(long)tag
           fromHost:(NSString *)host
               port:(UInt16)port
{
    NSLog(@"RECV: Unknown message from: %@:%hu", host, port);
    NSString *msg = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Recv: %@", msg);
    
    
    [udpSocket close];
	
	return YES;
}

- (IBAction)send:(id)sender {
    NSLog(@"udp send");
    int tag = 1;
    NSString *host = @"255.255.255.255";
	int port = 13254;
    
    
	NSData *data = [@"hello world" dataUsingEncoding:NSUTF8StringEncoding];

    [udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:tag];
	
	tag++;
}

@end
