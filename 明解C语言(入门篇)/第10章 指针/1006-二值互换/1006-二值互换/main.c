//
//  main.c
//  1006-二值互换
//
//  Created by Enrica on 2018/4/4.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 交换两个整数的值
 */

#include <stdio.h>

/**
 * 交换指针变量px和py所指向的值
 */
void swap(int *px, int *py) {
    
    int tmp = *px;
    *px = *py;
    *py = tmp;
}

int main(void) {
    
    int a, b;
    
    puts("请依次输入两个整数。");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    printf("a = %d, b = %d\n", a, b);
    
    // 交换这两个整数的值
    swap(&a, &b);
    
    puts("\n交换a、b的值之后: ");
    printf("a = %d, b = %d\n", a, b);
    
    return 0;
}
