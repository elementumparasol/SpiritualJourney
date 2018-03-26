//
//  main.c
//  0304-奇偶数判定
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入一个整数，判断它是奇数还是偶数
 */

int main(void) {
    
    int no;
    
    printf("请输入一个整数: ");
    scanf("%d", &no);
    
    if (no % 2) {
        printf("整数%d是奇数。\n", no);
    } else {
        printf("整数%d是偶数。\n", no);
    }
    
    return 0;
}

// 如果当条件成立时，才需要进行某种处理，则直接使用if语句(不带else)；
// 当需要根据条件是否成立来执行不同的操作时，就应该使用if-else语句。
