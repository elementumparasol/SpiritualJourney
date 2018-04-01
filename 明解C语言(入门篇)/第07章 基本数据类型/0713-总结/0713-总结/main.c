//
//  main.c
//  0713-总结
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(void) {
    
    int i, num;
    float value;
    float sum = 0.0f;
    
    puts("对浮点数进行多次加法运算。");
    printf("值: ");  scanf("%f", &value);
    printf("次数: ");  scanf("%d", &num);
    
    for (i = 0; i < num; i++) {
        sum += value;
    }
    
    printf("加法运算的结果是: %f\n", sum);
    
    return 0;
}
