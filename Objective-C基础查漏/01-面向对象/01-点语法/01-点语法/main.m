//
//  main.m
//  01-点语法
//
//  Created by Enrica on 2018/4/12.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [Person new];
        
        // 注意，这里的p.age并不是表示Person对象p访问成员变量age，
        // 而是表示调用set方法: [p setAge: 10];，这个是编译器特性
        p.age = 20;
        
        // 注意，这里p.age还是调用方法，并不是访问属性。不过，这次
        // 调用的是get方法: [p age];，这个还是编译器特性。
        //
        NSLog(@"age = %d\n", p.age);
    }
    return 0;
}

/**
 * Xcode非常的智能，在使用点语法调用set方法或者get方法时，它会
 * 根据你在调用方法的过程中有没有赋值来判断究竟是调用set方法还是
 * get方法。如果有发生赋值操作，那么它就会自动将点语法转换为调用
 * set方法；如果没有发生赋值操作，那么它就会自动将点语法转换为调
 * 用get方法。无论是转换为get方法还是set方法，这些都是编译器特性
 */
