//
//  main.c
//  0203-多个转换说明
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取两个整数，然后显示它们的商和余数
 */

int main(void) {
    
    int x, y;
    
    puts("请依次输入两个整数。");
    
    // 其实，scanf函数也可以指定两个以上的转换说明符，比如说下面的代码其实可以
    // 用 scanf("%d, %d", &x, &y);表示，但是同时输入多个整数体验不是很好
    printf("第一个整数: ");  scanf("%d", &x);
    printf("第二个整数: ");  scanf("%d", &y);
    
    
    // 输出这两个整数的商和余数
    printf("%d / %d的商是%d, 余数是%d\n", x, y, x / y, x % y);
    
    return 0;
}
