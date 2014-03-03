//
//  Appliance.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-26.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appliance : NSObject

@property (nonatomic, retain) NSString  *_id;
@property (nonatomic, retain) NSString  *name;
@property (nonatomic, readwrite) NSInteger switchStatus;

@end
