//
//  main.c
//  0303-if分支语句(2)
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 判断一个整数是否能被5整除，如果不能，则打印相关的信息
 */

int main(void) {
    
    int no;
    
    printf("请输入一个整数: ");
    scanf("%d", &no);
    
    if (no % 5) {
        printf("整数%d不能被5整数。\n", no);
    } else {
        printf("整数%d可以被5整数。\n", no);
    }
    
    return 0;
}
