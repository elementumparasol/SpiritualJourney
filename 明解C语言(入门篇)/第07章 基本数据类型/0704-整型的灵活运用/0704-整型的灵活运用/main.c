//
//  main.c
//  0704-整型的灵活运用
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示数据类型和变量的长度
 */

#include <stdio.h>

int main(void) {
    
    int na, nb;
    double dx, dy;
    
    printf("sizeof(int): %u\n", (unsigned)sizeof(int));
    printf("sizeof(double): %u\n", (unsigned)sizeof(double));
    
    printf("sizeof(na): %u\n", (unsigned)sizeof(na));
    printf("sizeof(dx): %u\n", (unsigned)sizeof(dx));
    
    printf("sizeof(na + nb): %u\n", (unsigned)sizeof(na + nb));
    printf("sizeof(na + dy): %u\n", (unsigned)sizeof(na + dy));
    printf("sizeof(dx + dy): %u\n", (unsigned)sizeof(dx + dy));
    
    return 0;
}
