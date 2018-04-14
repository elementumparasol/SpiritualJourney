//
//  Person.m
//  05-自定义构造方法
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name andAge:(int)age {
    
    // 初始化父类的成员变量，并且
    // 判断初始化是否成功
    if (self = [super init]) {
        
        // 初始化自己的成员变量
        _name = name;
        _age = age;
    }
    
    return self;
}

@end
