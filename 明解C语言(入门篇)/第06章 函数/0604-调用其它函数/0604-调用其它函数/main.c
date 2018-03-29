//
//  main.c
//  0604-调用其它函数
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 返回两个数中较大的值
 */
int maxOfTwo(int a, int b) {
    return (a > b) ? a : b;
}

/**
 * 返回四个数中最大的值
 */
int maxOfFour(int a, int b, int c, int d) {
    
    // 先比较a和b的值，确定它们之间最大的值x，
    // 再比较c和d的值，确定它们之间最大的值y,
    // 最后再比较x和y之间最大的值，结果就是
    // a、b、c、d最大的一个(函数中再调用函数)
    return maxOfTwo(maxOfTwo(a, b), maxOfTwo(c, d));
}

int main(void) {
    
    int a, b, c, d;
    
    puts("请以此输入4个整数。");
    printf("第一个整数为: ");  scanf("%d", &a);
    printf("第二个整数为: ");  scanf("%d", &b);
    printf("第三个整数为: ");  scanf("%d", &c);
    printf("第四个整数为: ");  scanf("%d", &d);
    
    // 调用函数maxOfFour，计算四个整数中最大的一个
    printf("上面4个整数中最大的值是: %d\n", maxOfFour(a, b, c, c));
    
    return 0;
}
