//
//  Person.m
//  04-重写init方法
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Person.h"

@implementation Person

// 重写- init方法
- (instancetype)init {
    
    // 调用super的init方法，初始化父类中声明的
    // 成员变量和其它属性
    self = [super init];
    
    // 如果self初始化成功
    if (self != nil) {  // if (self = [super init]) { ... }
        
        // 对内部成员变量做一些处理操作
        _age = 20;
        _name = @"James";
    }
    
    return self;
}

@end
