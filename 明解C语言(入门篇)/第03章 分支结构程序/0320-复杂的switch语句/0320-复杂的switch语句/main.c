//
//  main.c
//  0320-复杂的switch语句
//
//  Created by Enrica on 2018/3/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 在switch语句中使用穿透和default
 */

int main(void) {
    
    int num;
    
    printf("请输入一个整数: ");
    scanf("%d", &num);
    
    // 在使用switch语句时，还有一点需要特别注意，就是switch语句
    // 是按顺序执行的，改变case标签的顺序，所得到的结果会不一样，
    // 因此，应该按照正确的顺序书写case标签，否则会产生意想不到的结果
    switch (num) {
        case 1:
            puts("A");
            puts("B");
            break;
        case 2:
            puts("C");
            // 没有使用break语句，会产生穿透效果，因此会将case 5标签下面的代码输出
        case 5:
            puts("D");
            break;
        case 6:
            // 没有任何语句，还是会产生穿透，并且执行标签case 7下面的代码
        case 7:
            puts("E");
            break;
        default:  // 所有在上面找不到的标签都会来到default语句
            puts("E");
    }
    
    return 0;
}
