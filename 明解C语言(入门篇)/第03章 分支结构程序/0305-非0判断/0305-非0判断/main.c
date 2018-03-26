//
//  main.c
//  0305-非0判断
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 判断输入的整数是否为0
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 在C语言中，一切非0数都表示为true，这个在Swift中是不允许的
    if (num) {
        printf("整数%d是非0整数。\n", num);
    } else {
        printf("整数%d刚好就是0。\n", num);
    }
    
    return 0;
}
