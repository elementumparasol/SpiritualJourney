//
//  main.m
//  01-block的基本使用
//
//  Created by Enrica on 2018/4/18.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // block跟函数非常的像，都可以保存代码块，
        // 并且可以有参数和返回值。block的格式如
        // 下: 返回值类型 (^block名称) (参数列表) = ^ { ... };
        void (^myBlock)(void) = ^ {
            NSLog(@"这是一个没有参数和返回值的block");
        };
        
        // 调用block
        myBlock();
        
        // 定义一个接收两个int参数，并且返回int结果的block
        int (^sum)(int, int) = ^(int a, int b){
            return a + b;
        };
        
        // 调用block
        NSLog(@"sum = %i", sum(2, 3));
        
        NSString *(^name)(NSString *) = ^(NSString *str) {
            return str;
        };
        
        NSLog(@"name = %@", name(@"James"));
    }
    return 0;
}
