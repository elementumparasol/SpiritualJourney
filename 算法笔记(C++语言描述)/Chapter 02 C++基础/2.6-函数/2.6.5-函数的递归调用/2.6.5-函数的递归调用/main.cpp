//
//  main.cpp
//  2.6.5-函数的递归调用
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int fabnacci(int n) {
    
    if (n == 0) return 1;
    
    else return fabnacci(n - 1) * n;
}

int main(int argc, const char * argv[]) {
    
    int n;
    
    printf("请输入一个正整数: \n");
    
    scanf("%d", &n);
    
    printf("整数%d的斐波那契数为: %d\n", n, fabnacci(n));
    
    return 0;
}
