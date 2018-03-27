//
//  main.c
//  0319-switch和break
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 使用switch和break语句改写代码0319
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 判断该整数除以3之后的余数。注意，C语言中的switch语句一定
    // 要手动添加break，否则可能会产生意想不到的穿透效果。而在
    // Swift和Go语言中，系统默认不穿透，因此不用手动添加break，
    // 除非确实需要穿透效果，我们才会手动添加fallthrough
    switch (num % 3) {
        case 0:
            printf("整数%d刚好可以被3整数.\n", num);
            break;
        case 1:
            printf("整数%d除以3的余数是1.\n", num);
            break;
        case 2:
            printf("整数%d除以3的余数是2.\n", num);
            break;
    }
    
    return 0;
}

/**
 * C语言中的switch语句除了需要手动添加break之外，还有另外两个注意点：
 *  (1)、case标签的值只能是常量(而且还是整数常量)，不可以为变量；
 *  (2)、不允许多个标签使用同一个值。
 */
