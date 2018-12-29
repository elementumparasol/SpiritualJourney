//
//  RGB.m
//  实例变量的访问权限
//
//  Created by Enrica on 2018/12/30.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "RGB.h"
#import <stdio.h>

static unsigned char roundUChar(int v) {
    if (v < 0)
        return 0;
    if (v > 255)
        return 255;
    return (unsigned char)v;
}

@implementation RGB

- (id)initWithRed:(int)r green:(int)g blue:(int)b {
    
    if ((self = [super init]) != nil) {
        red = roundUChar(r);
        green = roundUChar(g);
        blue = roundUChar(b);
    }
    
    return self;
}

- (id)blendColor:(RGB *)color {
    
    // 直接通过->来访问RGB类型的参数color内部的实例变量
    red = ((unsigned int)red + color -> red) / 2;
    green = ((unsigned int)green + color -> green) / 2;
    blue = ((unsigned int)blue + color -> blue) / 2;
    
    return self;
}

- (void)print {
    printf("%d, %d, %d\n", red, green, blue);
}

@end
