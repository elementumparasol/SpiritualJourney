//
//  main.c
//  0509-使用数组进行成绩处理
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入5位球员的得分，并且显示他们的总得分和平均得分
 */

int main(void) {
    
    int score[5];
    int sum = 0;
    
    printf("请依次输入5位球员的得分。\n");
    for (int i = 0; i < 5; i++) {
        printf("%d号球员的得分是: ", i + 1);
        
        // 输入球员的得分，并且将其存储到数组中
        scanf("%d", &score[i]);
        
        // 计算5位球员的总得分
        sum += score[i];
    }
    
    // 分别显示5位球员的总得分和平均得分
    printf("5位球员的总得分是: %d\n", sum);
    printf("5位球员的平均得分是: %.2f\n", (double)sum / 5);
    
    return 0;
}

/**
 * 上面的代码相对而言比较简洁了，但是还不够灵活，因为该数组只能存储
 * 5位球员的得分，假设现在需要存储10位球员的得分，那么修改起来就比
 * 较麻烦了，需要把所有数值为5的地方替换为其它数值。关于这个问题，
 * 我们将会在0510中解决。
 */

