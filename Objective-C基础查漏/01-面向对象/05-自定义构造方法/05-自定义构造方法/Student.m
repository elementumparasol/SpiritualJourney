//
//  Student.m
//  05-自定义构造方法
//
//  Created by Enrica on 2018/4/14.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithName:(NSString *)name andAge:(int)age number:(int)no {
    
    // 首先调用父类的初始化方法，初始化父类的成员属性
    // 然后再判断初始化是否成功
    if (self = [super initWithName:name andAge:age]) {
        
        // 初始化自己的成员属性
        _number = no;
    }
    
    return self;
}

@end
