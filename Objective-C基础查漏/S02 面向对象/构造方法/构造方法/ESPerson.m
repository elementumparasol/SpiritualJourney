//
//  ESPerson.m
//  构造方法
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESPerson.h"

@implementation ESPerson

// 重写init方法
- (instancetype)init {
    
    // 初始化父类的属性，并且将父类init
    // 方法返回的对象赋值给self
    self = [super init];
    
    // 如果父类初始化成功
    if (self) {
        
        // 初始化自己的属性
        _age = 20;
        _name = @"jim";
    }
    
    return self;
}

// 自定义构造方法
- (instancetype)initWithAge: (int)age andName: (NSString *)name {
    
    // 初始化父类的属性，并且经父类的init
    // 方法返回的对象赋值给self
    self = [super init];
    
    // 检查父类的初始化是否成功
    if (self) {
        _age = age;
        _name = [name copy];
    }
    
    return self;
}

@end
