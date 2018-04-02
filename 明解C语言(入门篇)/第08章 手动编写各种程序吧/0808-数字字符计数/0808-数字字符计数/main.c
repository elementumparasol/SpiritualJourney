//
//  main.c
//  0808-数字字符计数
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算标准输入流中出现数字字符数
 */

#include <stdio.h>

int main(void) {

    int i, ch;
    int c[10] = { 0 };  // 数组c中的10个元素统统都被初始化为0

    printf("请输入一串数字: ");  // 数字输入结束之后回车，然后再按住Ctrl + D表示EOF

    while ((ch = getchar()) != EOF) {
        switch (ch) {
            case '0' : c[0]++; break;
            case '1' : c[1]++; break;
            case '2' : c[2]++; break;
            case '3' : c[3]++; break;
            case '4' : c[4]++; break;
            case '5' : c[5]++; break;
            case '6' : c[6]++; break;
            case '7' : c[7]++; break;
            case '8' : c[8]++; break;
            case '9' : c[9]++; break;
        }
    }

    puts("数字字符出现的次数: ");
    for (i = 0; i < 10; i++) {
        printf("'%d': %d\n", i, c[i]);
    }

    return 0;
}

