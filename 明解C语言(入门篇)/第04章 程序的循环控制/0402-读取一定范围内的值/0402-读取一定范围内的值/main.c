//
//  main.c
//  0402-读取一定范围内的值
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 根据读取到的整数值来模拟猜拳(只接受0、1和2)
 */

int main(void) {
    
    int hand;
    
    do {
        
        printf("请选择出什么拳(其中0表示石头，1表示剪刀，2表示布): ");
        scanf("%d", &hand);
    } while (hand < 0 || hand > 2);  // 当输入小于0，或者大于2的整数时，还能保证程序有第二次选择
    
    printf("你选择了");
    switch (hand) {
        case 0:
            printf("出石头。\n");
            break;
        case 1:
            printf("出剪刀。\n");
            break;
        default:
            printf("出布。\n");
            break;
    }
    
    return 0;
}

/**
 * 德摩根定律：对个条件取反，然后再将逻辑或变成逻辑与，或者将逻辑与变成逻辑或，
 * 最后再将整个结果取反，所得到的结果就和原来一样。eg:
 *  (1)、x && y <=> !(!x || !y)
 *  (2)、x || y <=> !(!x && !y)
 */
