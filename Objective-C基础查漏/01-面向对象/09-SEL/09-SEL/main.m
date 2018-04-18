//
//  main.m
//  09-SEL
//
//  Created by Enrica on 2018/4/17.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        
        // 通过performSelector来调用方法
        [p performSelector:@selector(print)];
        
        // withObject:后面传递的参数就是传递给printName:的参数
        [p performSelector:@selector(printName:) withObject:@"James"];
    }
    return 0;
}

/**
 * 方法调用：
 *  (1)、把方法包装成SEL类型的数据；
 *  (2)、根据SEL数据找到对应方法的地址；
 *  (3)、根据方法地址调用对应的方法
 */
