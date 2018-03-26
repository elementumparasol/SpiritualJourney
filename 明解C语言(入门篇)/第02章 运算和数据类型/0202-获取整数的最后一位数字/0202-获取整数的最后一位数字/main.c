//
//  main.c
//  0202-获取整数的最后一位数字
//
//  Created by Enrica on 2018/3/26.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

int main(void) {
    
    int no;
    
    printf("请输入一个整数：");
    scanf("%d", &no);
    
    // 输出整数no的最后一位数字(因为是十进制整数，因此通过模上10，就可以获取整数的最后一位数字)
    printf("整数%d的最后一位数字是：%d\n", no, no % 10);
    
    return 0;
}
