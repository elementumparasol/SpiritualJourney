//
//  main.c
//  0803-函数式宏和逗号运算符
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 响铃并进行显示
 */

#include <stdio.h>

#define puts_alert(str)  ( putchar('\a') , puts(str) )

int main(void) {

    int n;

    printf("请输入一个整数: ");    scanf("%d", &n);

    if (n) {
        puts_alert("这个数不是0。");
    } else {
        puts_alert("这个数是0。");
    }

    return 0;
}
