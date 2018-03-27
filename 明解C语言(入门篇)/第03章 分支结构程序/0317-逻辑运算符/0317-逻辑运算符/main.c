//
//  main.c
//  0317-逻辑运算符
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 显示所输入的月份所处的季节
 */

int main(void) {
    
    int month;
    
    printf("请输入月份，以便判断它属于哪个季节: ");
    scanf("%d", &month);
    
    // 判断所输入的月份属于哪个季节
    if (month >= 3 && month <= 5) {
        printf("%d属于春季。\n", month);
    } else if (month >= 6 && month <= 8) {
        printf("%d属于夏季。\n", month);
    } else if (month >= 9 && month <= 11) {
        printf("%d属于秋季。\n", month);
    } else if (month == 1 || month == 2 || month == 12) {  // 这里有坑，不要写成: month >=12 && month <= 2
        printf("%d属于冬季。\n", month);
    } else {
        printf("你所输入的月份%d不存在！\n", month);
    }
    
    return 0;
}

