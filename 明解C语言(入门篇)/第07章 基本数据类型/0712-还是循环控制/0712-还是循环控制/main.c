//
//  main.c
//  0712-还是循环控制
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 以0.01为单位，从0.0递增至1.0的循环(用整数控制)
 */

#include <stdio.h>

int main(void) {
    
    int i;
    float x;
    
    for (i = 0; i <= 100; i++) {
        x = i / 100.0;
        printf("x = %f\n", x);
    }
    
    return 0;
}
