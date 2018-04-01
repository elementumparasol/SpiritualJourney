//
//  main.c
//  0711-循环控制
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 以0.01为单位，从0.0递增至1.0的循环
 */

#include <stdio.h>

int main(void) {
    
    float x;
    
    for (x = 0.0; x <= 1.0; x += 0.01) {
        printf("x = %f\n", x);
    }
    
    return 0;
}
