//
//  Person.m
//  02-@property和@synthesize
//
//  Created by Enrica on 2018/4/13.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import "Person.h"

@implementation Person

// 成员变量_age的setter方法和getter方法的实现
// 后面接上= _age的意思是告诉它需要访问成员变量
// _age(实现属性age的setter方法和getter方法，
// 并且在实现方法中，访问成员变量_age)
@synthesize age = _age;  // 这一句代码相当于下面这两个setter方法和getter方法
//- (void)setAge:(int)age {
//    _age = age;
//}

//- (int)age {
//    return _age;
//}

@synthesize name = _name;
//- (void)setName:(NSString *)name {
//    _name = name;
//}

//- (NSString *)name {
//    return _name;
//}

@end

/**
 * @synthesize会自动生成setter方法和getter方法的实现
 */
