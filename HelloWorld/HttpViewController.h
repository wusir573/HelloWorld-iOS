//
//  HttpViewController.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-26.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Appliance.h"

@interface HttpViewController : UIViewController <NSXMLParserDelegate>{
    NSMutableData *_data;
    
    
    NSMutableArray *appliances;  //用于存储一组电器
    Appliance *appliance;  //
    
    NSString *currentElementValue;  //用于存储元素标签的值
    BOOL storingFlag; //查询标签所对应的元素是否存在
    NSArray *elementToParse;  //要存储的元素
}

@property (strong, nonatomic) IBOutlet UITextView *tvResponse;

@end
