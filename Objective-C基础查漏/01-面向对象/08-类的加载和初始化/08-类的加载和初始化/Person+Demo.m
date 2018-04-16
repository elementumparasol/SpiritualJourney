//
//  Person+Demo.m
//  08-类的加载和初始化
//
//  Created by Enrica on 2018/4/16.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Person+Demo.h"

@implementation Person (Demo)

// 分类中也可以调用+ load方法
+ (void)load {
    
    NSLog(@"Person (Demo) --- load");
}

+ (void)initialize {
    
    NSLog(@"Person (Demo) --- initialize");
}

@end
