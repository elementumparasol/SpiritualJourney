//
//  Car.h
//  03-setter和getter的简便写法
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

// 从Xcode 4.4之后，只需要使用@property属性，
// 编译器就会自动帮我们生成属性的setter方法和
// getter方法，以及带下划线的成员变量
@property double speed;
@property int wheels;

@end
