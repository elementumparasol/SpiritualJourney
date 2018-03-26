//
//  main.c
//  0302-奇数的判定
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 判断输入的整数是否为奇数
 */

int main(void) {
    
    int no;
    
    printf("请输入一个整数: ");
    scanf("%d", &no);
    
    // 能被2整除的数就是奇数
    if (no % 2) {
        printf("%d是奇数。\n", no);
    }
    
    return 0;
}
