//
//  main.c
//  0414-偶数的枚举
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个正整数，然后输出所有不大于该整数的所有偶数
 */

int main(void) {
    
    int num;
    
    printf("请输入一个正整数: ");
    scanf("%d", &num);
    
    // 将i的初始值设为2，然后每次增加2，这样就
    // 可以输出所有小于或等于num的偶数了
    for (int i = 2; i <= num; i += 2) {
        printf("%d ", i);
    }
    printf("\n");
    
    return 0;
}
