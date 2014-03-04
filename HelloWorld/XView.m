//
//  XView.m
//  HelloWorld
//
//  Created by pcbeta on 14-2-27.
//  Copyright (c) 2014年 seed. All rights reserved.
//

#import "XView.h"

@implementation XView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) awakeFromNib {
    NSLog(@"awakeFromNib");
}
- (void) willMoveToSuperview:(UIView *)newSuperview {
    NSLog(@"willMoveToSuperview");
    iValue = 0;
    color[0][0]=255;
    color[0][1]=1;
    color[0][2]=150;
    color[0][3]=58;
    color[1][0]=255;
    color[1][1]=55;
    color[1][2]=169;
    color[1][3]=53;
    color[2][0]=255;
    color[2][1]=131;
    color[2][2]=192;
    color[2][3]=37;
    color[3][0]=255;
    color[3][1]=200;
    color[3][2]=222;
    color[3][3]=0;
    color[4][0]=255;
    color[4][1]=250;
    color[4][2]=217;
    color[4][3]=0;
    color[5][0]=255;
    color[5][1]=236;
    color[5][2]=164;
    color[5][3]=4;
    color[6][0]=255;
    color[6][1]=228;
    color[6][2]=118;
    color[6][3]=21;
    color[7][0]=255;
    color[7][1]=221;
    color[7][2]=74;
    color[7][3]=22;
    color[8][0]=255;
    color[8][1]=166;
    color[8][2]=14;
    color[8][3]=16;
    color[9][0]=255;
    color[9][1]=177;
    color[9][2]=1;
    color[9][3]=8;
    color[10][0]=255;
    color[10][1]=114;
    color[10][2]=0;
    color[10][3]=1;
    color[11][0]=255;
    color[11][1]=67;
    color[11][2]=1;
    color[11][3]=1;
    color[12][0]=255;
    color[12][1]=42;
    color[12][2]=0;
    color[12][3]=0;
    color[13][0]=255;
    color[13][1]=21;
    color[13][2]=0;
    color[13][3]=7;
    color[14][0]=255;
    color[14][1]=5;
    color[14][2]=0;
    color[14][3]=7;
    color[15][0]=255;
    color[15][1]=1;
    color[15][2]=0;
    color[15][3]=5;
    color[16][0]=255;
    color[16][1]=0;
    color[16][2]=0;
    color[16][3]=7;
    color[17][0]=255;
    color[17][1]=0;
    color[17][2]=1;
    color[17][3]=17;
}
- (void) willMoveToWindow:(UIWindow *)newWindow {
    NSLog(@"willMoveToWindow");
}
- (void) didMoveToSuperview {
    NSLog(@"didMoveToSuperview");
}
- (void) didMoveToWindow {
    NSLog(@"didMoveToWindow");
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前view的图形上下文(context)
       
//    // 调试用 中间横竖线
//    CGContextSetLineWidth(context, 1.0);//线的宽度
//    CGContextSetRGBStrokeColor(context, (color[0][1]/255), (color[0][2]/255), (color[0][3]/255), 1);
//    
//    CGContextSaveGState(context);
//    CGContextSetRGBStrokeColor(context, (color[0][1]/255), (color[0][2]/255), (color[0][3]/255), 1);
////  CGContextSetLineWidth(context, 40.0);
//    CGContextMoveToPoint(context, 0, RADIUS);
//    CGContextAddLineToPoint(context, RADIUS*2, RADIUS);
//    CGContextClosePath(context);
//    CGContextStrokePath(context);
//    CGContextRestoreGState(context);
//    
//    CGContextSaveGState(context);
//    CGContextSetRGBStrokeColor(context, (color[0][1]/255), (color[0][2]/255), (color[0][3]/255), 1);
////            CGContextSetLineWidth(context, 40.0);
//    CGContextMoveToPoint(context, RADIUS, 0);
//    CGContextAddLineToPoint(context, RADIUS, RADIUS*2);
//    CGContextClosePath(context);
//    CGContextStrokePath(context);
//    CGContextRestoreGState(context);
//    
//    CGContextSaveGState(context);
////    CGContextSetRGBStrokeColor(context, (color[0][1]/255), (color[0][2]/255), (color[0][3]/255), 1);
////    CGContextSetLineWidth(context, 40.0);
//    CGContextMoveToPoint(context, 0, 223);
//    CGContextAddLineToPoint(context, 300, 223);
//    CGContextClosePath(context);
//    CGContextStrokePath(context);
//    CGContextRestoreGState(context);
//    
//    // 调试用 //画圆
//    [self drawArc:context radius:RADIUS a1:0 a2:2*PI color:color[0] lineWidth:1];
    

    
    
    int k = iValue/25;
    float k2 = iValue%25;
    float k3 = k2 / 25 ;
    
    float a1 = startAngle*PI/180;
    //        1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    float bgColor[] = {255, 204, 204, 204};
    for (int i = 0; i < 18; i++) {
        // 绘制背景块
        a1 = (startAngle + i*sweepAngle)*PI/180;
        float a2 = (startAngle + (i+1)*sweepAngle)*PI/180;
        [self drawArc:context radius:RADIUS-20 a1:a1 a2:a2 color:bgColor lineWidth:40.0];
        //绘制刻度
        [self drawGraduation:context i:i];
        
        //绘制色块
        if (i < k) {
            [self drawArc:context radius:RADIUS-20 a1:a1 a2:a2 color:color[i] lineWidth:40];
        } else if (i == k) {
            a2 = (startAngle + (i+k3)*sweepAngle)*PI/180;
            [self drawArc:context radius:RADIUS-20 a1:a1 a2:a2 color:color[i] lineWidth:40];
            
            [self drawText:context textColor:color[i]];
        }
    }
    
    
}

-(void) drawArc:(CGContextRef) context radius:(float)raidus a1:(float)a1 a2:(float)a2 color:(float[])rgb lineWidth:(float)lineWidth {
//kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetRGBStrokeColor(context, (rgb[1]/255.0), (rgb[2]/255.0), (rgb[3]/255.0), 1.0);
    CGContextAddArc(context, RADIUS, RADIUS, raidus, a1, a2, 0);
//    CGContextClosePath(context);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

-(void) drawGraduation:(CGContextRef)context i:(int) i {
    if (i != 0) {
        float c = (startAngle + sweepAngle*i)*PI/180;
        float startX = (float) (cos(c)+1) * RADIUS;
        float startY = (float) (sin(c)+1) * RADIUS;
        float stopX;
        float stopY;
        if (i%2 == 1) {
            stopX = (float) (cos(c) * (RADIUS-40)) + RADIUS;
            stopY = (float) (sin(c) * (RADIUS-40)) + RADIUS;
        } else {
            stopX = (float) (cos(c) * (RADIUS-45)) + RADIUS;
            stopY = (float) (sin(c) * (RADIUS-45)) + RADIUS;
            
            CGRect rect = CGRectMake(stopX, stopY, 20, 20);
            switch (i) {
				case 2:
                    rect = CGRectMake(stopX, stopY-5, 20, 20);
					break;
                    
				case 4:
					rect = CGRectMake(stopX, stopY-5, 20, 20);
					break;
                    
				case 6:
					rect = CGRectMake(stopX-5, stopY, 20, 20);
					break;
                    
				case 8:
					rect = CGRectMake(stopX-10, stopY, 20, 20);
					break;
                    
				case 10:
					rect = CGRectMake(stopX-10, stopY, 20, 20);
					break;
                    
				case 12:
					rect = CGRectMake(stopX-15, stopY, 20, 20);
					break;
                    
				case 14:
					rect = CGRectMake(stopX-20, stopY-5, 20, 20);
					break;
                    
				case 16:
					rect = CGRectMake(stopX-20, stopY-5, 20, 20);
					break;
                    
            }
            
            NSString *str = [NSString stringWithFormat:@"%d", 25*i];
            UIFont *font = [UIFont boldSystemFontOfSize:10.0];
            NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle
                                                   defaultParagraphStyle] mutableCopy];
            textStyle.lineBreakMode = NSLineBreakByWordWrapping;
            textStyle.alignment = NSTextAlignmentCenter;
            
            UIColor *textColor = [UIColor colorWithWhite:1 alpha:1.0];
            NSDictionary *attributes = @{NSFontAttributeName:font,
                                         NSParagraphStyleAttributeName:textStyle,
                                         NSForegroundColorAttributeName:textColor};
            [str drawInRect:rect withAttributes:attributes];
           
        }
        CGContextSaveGState(context);
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
        CGContextSetLineWidth(context, 0.5);
        CGContextMoveToPoint(context, startX, startY);
        CGContextAddLineToPoint(context, stopX, stopY);
        CGContextClosePath(context);
        CGContextStrokePath(context);
        CGContextRestoreGState(context);
    }
}

-(void) drawText:(CGContextRef) context textColor:(float[]) rgb {
    NSString *text = @"";
    if (iValue < 50) {
        text = @"优";
    } else if (iValue < 100 && iValue >= 50) {
        text = @"良";
    } else if (iValue < 150 && iValue >= 100) {
        text = @"轻度污染";
    } else if (iValue < 200 && iValue >= 150) {
        text = @"中度污染";
    } else if (iValue < 300 && iValue >= 200) {
        text = @"重度污染";
    } else if (iValue >= 300) {
        text = @"严重污染";
    }
    UIFont *font = [UIFont boldSystemFontOfSize:23];
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle
                                           defaultParagraphStyle] mutableCopy];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;
    textStyle.alignment = NSTextAlignmentCenter;

    
    UIColor *textColor = [UIColor colorWithWhite:1 alpha:1.0];
    NSDictionary *attributes = @{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:textStyle,
                                 NSForegroundColorAttributeName:textColor};
    [text drawInRect:CGRectMake(RADIUS/2+15, 1.5*RADIUS, 100, 100) withAttributes:attributes];
    
    
    font = [UIFont boldSystemFontOfSize:40];
    textColor = [UIColor colorWithRed:rgb[1]/255 green:rgb[2]/255 blue:rgb[3]/255 alpha:1.0];
    attributes = @{NSFontAttributeName:font,
                   NSParagraphStyleAttributeName:textStyle,
                   NSForegroundColorAttributeName:textColor};
    [[NSString stringWithFormat:@"%d", iValue] drawInRect:CGRectMake(RADIUS/2+15, RADIUS-30, 100, 100) withAttributes:attributes];
    
}

-(void) setValue:(int) value {
    NSLog(@"setValue");
    iValue = value;
    //调用该函数后，才会重绘
    [self sizeToFit];
    [self setNeedsDisplay];
}



@end
