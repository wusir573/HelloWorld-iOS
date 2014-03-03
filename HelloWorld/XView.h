//
//  XView.h
//  HelloWorld
//
//  Created by pcbeta on 14-2-27.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#define PI 3.14159265358979323846
#define RADIUS 125.0 //半径、中心点
#define startAngle 144.0 //起始弧度
#define sweepAngle 14.0 //每块14度



@interface XView : UIView {

    float color[18][4];
    int iValue;

}

-(void) setValue:(int) value;

@end
