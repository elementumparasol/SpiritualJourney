//
//  main.c
//  0301-if分支语句(1)
//
//  Created by Enrica on 2018/3/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入的整数能被5整除吗？
 */

int main(void) {
    
    int no;
    
    printf("请输入一个整数: ");
    scanf("%d", &no);
    
    if (no % 5) {  // 等价于(no % 5 != 0)，因为C语言中非0即为真，因此这里可以简写
        printf("整数%d不能被5整数。", no);
    }
    
    return 0;
}
