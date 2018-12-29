//
//  main.m
//  实例变量的访问权限
//
//  Created by Enrica on 2018/12/30.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGB.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        RGB *u, *w;
        
        u = [[RGB alloc] initWithRed:255 green:127 blue:127];
        w = [[RGB alloc] initWithRed:0 green:127 blue:64];
        
        [u print];
        [w print];
        [[u blendColor:w] print];
    }
    return 0;
}
