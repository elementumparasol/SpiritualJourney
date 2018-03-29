//
//  main.c
//  0608-没有形参的函数
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 逆向显示输入的正整数
 */

#include <stdio.h>

/**
 * 返回输入的正整数，并且过滤掉小于或者等于0的整数
 */
int scanInput(void) {
    
    int tmp;
    
    do {
        printf("请输入一个正整数: ");
        scanf("%d", &tmp);
        
        // 对小于或者等于0的数值进行过滤
        if (tmp <= 0) {
            puts("非法数值，请输入正整数!");
        }
    } while (tmp <= 0);
    
    return tmp;
}

/**
 * 返回正整数逆转之后的值
 */
int reverseValue(int num) {
    
    int tmp = 0;
    
    // 对传进来的数值进一步过滤，确保它是正数
    if (num > 0) {
        
        // 逆转传递进来的正整数
        do {
            tmp = tmp * 10 + num % 10;
            num /= 10;
        } while (num > 0);
    }
    
    return tmp;
}

int main(void) {
    
    // 声明变量nx，并且使用函数scanInput
    // 的返回值对其进行初始化，主要是为了过
    // 滤不符合条件的输入数值
    int nx = scanInput();
    
    // 显示对输入的正整数nx进行逆转之后的结果
    printf("改正整数逆转之后的值为: %d\n", reverseValue(nx));
    
    return 0;
}
