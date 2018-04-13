//
//  Person.h
//  01-点语法
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    
    // 年龄
    int _age;  // 成员属性最好是以下划线作为开头
}

// set方法
- (void)setAge: (int)age;

// get方法
- (int)age;

@end
