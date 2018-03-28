//
//  main.c
//  0410-逆向显示整数值
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 逆向显示整数
 */

int main(void) {
    
    int num;
    
    do {
        printf("请输入一个整数: ");
        scanf("%d", &num);
        
        if (num <= 0) {
            puts("\a请不要输入非正整数。");
        }
    } while (num <= 0);  // 如果所输入的整数小于或等于0，则继续执行do-while循环，重新输入
    
    // 将输入的整数进行逆向显示，eg 123 -> 321, 4 -> 4, 579 -> 975
    printf("该整数逆向显示的结果是 ");
    while (num > 0) {
        printf("%d", num % 10);
        num /= 10;
    }
    
    puts("。 ");
    
    return 0;
}
