//
//  HttpViewController.m
//  HelloWorld
//
//  Created by pcbeta on 14-2-26.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import "HttpViewController.h"

@interface HttpViewController ()

@end

@implementation HttpViewController

@synthesize tvResponse;

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
    _data = [[NSMutableData alloc] init];
    elementToParse = [[NSArray alloc] initWithObjects:@"applianceId",@"aplcsName",@"switchStatus", nil];

    NSURL *url = [NSURL URLWithString:@"http://192.168.100.200:8080/smart/disp/home/listAppliances?floorNo=1&type=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 分批返回数据
- (void)connection:(NSURLConnection *) connection didReceiveData:(NSData *)data {
    [_data appendData:data];
    NSLog(@"%@", _data);
}

// 数据完全返回完毕
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *dataString =  [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", dataString);
    tvResponse.text = dataString;
    
    // 解析
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser *m_parser = [[NSXMLParser alloc] initWithData:data];
    //设置该类本身为代理类，即该类在声明时要实现NSXMLParserDelegate委托协议
    [m_parser setDelegate:self];  //设置代理为本地
    
    BOOL flag = [m_parser parse]; //开始解析
    if(flag) {
        NSLog(@"解析指定路径的xml文件成功%@", appliances);
    }
    else {
        NSLog(@"解析指定路径的xml文件失败");
    }
}
// delegate start
- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if([elementName isEqualToString:@"appliances"]) {
        //Initialize the array.
        appliances = [[NSMutableArray alloc] init];
    }
    else if([elementName isEqualToString:@"appliance"]) {
        appliance = [[Appliance alloc] init];
        
    }
    storingFlag = [elementToParse containsObject:elementName];  //判断是否存在要存储的对象
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"string = %@", string);
    currentElementValue = string;
}

// 这里才是真正完成整个解析并保存数据的最终结果的地方
- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"appliance"]) {
        [appliances addObject:appliance];
        appliance = nil;
    }
    
    if (storingFlag) {
        //去掉字符串的空格
        NSString *trimmedString = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        //将字符串置空
        currentElementValue = nil;
        
        if ([elementName isEqualToString:@"applianceId"]) {
            appliance._id = trimmedString;
        } else if ([elementName isEqualToString:@"aplcsName"]) {
            appliance.name = trimmedString;
        } else if  ([elementName isEqualToString:@"switchStatus"]) {
            appliance.switchStatus = [trimmedString integerValue];
        }
    }
    
}

// delegate end

@end
