//
//  main.c
//  0416-二重循环
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 显示九九乘法表
 */

int main(void) {
    
    int i, j;
    
    for (i = 1; i <= 9; i++) {
        
        for(j = 1; j <= 9; j++) {
            printf("%3d",i * j);
        }
        printf("\n");
    }
    
    return 0;
}
