//
//  main.m
//  block
//
//  Created by Enrica on 2018/8/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

/**
 block本质上就是带有局部变量的匿名函数，其格式为:
 ^ 返回值类型 (参数列表) { 表达式或者说函数体 };
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 定义一个block(有返回值，带有两个参数的block)
        int (^sumBlock)(int, int) = ^ int (int a, int b) {
            return a + b;
        };
        
        printf("sum = %d\n", sumBlock(2, 3));
        
        // 再定义一个block
        void (^printBlock)(NSString *) = ^void (NSString *str) {
            NSLog(@"str = %@", str);
        };
        
        printBlock(@"Hello, World!");
    }
    return 0;
}
