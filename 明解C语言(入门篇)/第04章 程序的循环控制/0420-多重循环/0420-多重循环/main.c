//
//  main.c
//  0420-多重循环
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个整数，显示与该整数值等量的*
 */

int main(void) {
    
    int retry;
    
    do {
        int i, num;
        
        do {
            printf("请输入一个正整数: ");
            scanf("%d", &num);
            
            if (num <= 0) {
                puts("请不要输入非正整数。");
            }
        } while (num <= 0);
        
        for (i = 1; i <= num; i++) {
            putchar('*');
        }
        putchar('\n');
        
        printf("是否继续执行？按数字0表示继续，按其它数字表示结束: ");
        scanf("%d", &retry);
    } while (retry == 0);  // 当retry的取值与0相等时，继续执行最外层的do-while循环
    
    return 0;
}

