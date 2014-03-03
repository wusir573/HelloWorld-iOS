//
//  RootViewController.m
//  HelloWorld
//
//  Created by pcbeta on 14-2-25.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selectLeftAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(selectRightAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    dataItems=[[NSMutableArray alloc]initWithObjects:@"Go to UdpView",@"Go to HttpView",@"Go to ICViewPage",@"Go to XView",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectLeftAction:(id)sender
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了导航栏左按钮" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
}

-(void)selectRightAction:(id)sender
{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:@"你点击了导航栏右按钮" delegate:self  cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
}

- (IBAction)toUdpView:(id)sender {
    NSLog(@"toUdpView …, window.views: %@",self.view.window.subviews);
    
    UdpController *udpView = [[UdpController alloc] init];
    [self.navigationController pushViewController:udpView animated:YES];
    udpView.title = @"Udp View";
    
}

- (IBAction)toHttpView:(id)sender {
    NSLog(@"toHttpView …, window.views: %@",self.view.window.subviews);
    
    HttpViewController *view = [[HttpViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    view.title = @"Http View";
    
}

- (IBAction)toICViewPage:(id)sender {
    NSLog(@"toICViewPage …, window.views: %@",self.view.window.subviews);
    
    ICViewPagerController *view = [[ICViewPagerController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    view.title = @"ICViewPage";
    
}

- (IBAction)toXView:(id)sender {
    NSLog(@"toXView …, window.views: %@",self.view.window.subviews);
    
    XViewController *view = [[XViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
    view.title = @"XView";
    
}
// －－－－－－－－－ table view delegate start －－－－－－－－－－
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [dataItems count];
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
	NSUInteger row=[indexPath row];
	cell.textLabel.text=[dataItems objectAtIndex:row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //该方法响应列表中行的点击事件
    switch (indexPath.row) {
        case 0://
            [self toUdpView:nil];
            break;
            
        case 1://
            [self toHttpView:nil];
            break;
            
        case 2://
            [self toICViewPage:nil];
            break;
            
        case 3://
            [self toXView:nil];
            break;
            
        default:
            break;
    }
}
// －－－－－－－－－ table view delegate end －－－－－－－－－

@end
