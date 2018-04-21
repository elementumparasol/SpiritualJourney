//
//  main.c
//  04-可变长参数
//
//  Created by Enrica on 2018/4/21.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>
#include <assert.h>

// 自定义输出函数
void tiny_printf(char *format, ...) {
    int i;
    va_list ap;  // va_list其实是一个指向char的指针
    
    va_start(ap, format);  // 指针ap指向参数format的下一个位置
    for (i = 0; format[i] != '\0'; i++) {
        switch (format[i]) {
            case 's':
                printf("%s", va_arg(ap, char *));  // 给宏va_arg()指定ap和参数类型
                break;
            case 'd':
                printf("%d", va_arg(ap, int));
                break;
            default:
                
                // assert()是定义在assert.h中的一个宏，其定义为: assert(条件表达式)
                // 如果条件表达式的结果为真，则什么也不会发生；如果为假，则会输出相关信息，
                // 然后强制终止程序
                assert(0);
        }
    }
    
    va_end(ap);  // va_end()是一个空定义
    putchar('\n');
}


int main(int argc, const char * argv[]) {
    
    tiny_printf("sdd", "enrica", 3, 4);
    
    return 0;
}
