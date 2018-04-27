//
//  main.c
//  02-尾递归
//
//  Created by Enrica on 2018/4/27.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

// 尾递归的简单示例
int facttail(int n, int a) {
    
    if (n < 0)
        return 0;
    else if (n == 0)
        return 1;
    else if (n == 1)
        return a;
    else
        return facttail(n - 1, n * a);
}

int main(int argc, const char * argv[]) {
    
    int n = 0;
    printf("请输入一个正整数: ");
    scanf("%d", &n);
    
    // 为递归的调用，第二个参数a的初始值为1(其实一直是1)
    printf("%d的阶乘为: %d\n", n, facttail(n, 1));
    
    return 0;
}
