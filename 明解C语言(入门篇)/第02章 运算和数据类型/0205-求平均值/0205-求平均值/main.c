//
//  main.c
//  0205-求平均值
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 读取两个整数，求出它们的平均值
 */

int main(void) {
    
    int a, b;
    
    puts("请依次输入两个整数.");
    printf("第一个整数: ");  scanf("%d", &a);
    printf("第二个整数: ");  scanf("%d", &b);
    
    // 从计算结果上看，平均值小数部分被舍去了，这当然不是数学意义上面的
    // 平均值。然而，这就是计算机中int类相关数据的惯常做法，为了真正达到
    // 数学意义上面的平均值，我们需要引入其它类型
    printf("%d和%d的平均值是: %d\n", a, b, (a + b) / 2);
    
    return 0;
}
