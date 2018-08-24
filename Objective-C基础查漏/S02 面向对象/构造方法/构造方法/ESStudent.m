//
//  ESStudent.m
//  构造方法
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#import "ESStudent.h"

@implementation ESStudent

// 自定义构造方法
- (instancetype)initWithStudentID:(int)studentID {
    
    // 初始化父类的属性，并且判断是否初始化成功
    if (self = [super init]) {
        
        // 初始化自己的属性
        _studentID = studentID;
    }
    
    return self;
}

@end
