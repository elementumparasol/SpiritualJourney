//
//  main.cpp
//  1-Callatz猜想
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

// 对任何一个自然数n，如果它是偶数，那么把它砍掉一半；如果它是奇数，那么把(3n+1)砍掉一半。
// 这样一直反复砍下去，最后一定在某一步得到n = 1。对给定的任一不超过1000的正整数n，简单
// 地数一下，需要多少步（砍几下）才能得到n = 1？

#include <iostream>
#include <cstdio>

int main(int argc, const char * argv[]) {
    
    int n, tmp, step = 0;
    
    printf("请输入n的值: ");
    scanf("%d", &n);
    
    // 输入的整数n必须小于或者等于1000
    while (n > 1000) {
        printf("请重新输入小于1000的整数: ");
        scanf("%d", &n);
    }
    
    tmp = n;  // 将最初输入的数值保存起来
    
    // 只要是没有被砍到1，接着砍
    while (n != 1) {
        
        // 如果n是偶数
        if (n % 2 == 0) {
            n = n / 2;
        }
        
        // 如果n是奇数
        else {
            n = (3 * n + 1) / 2;
        }
        
        // 计数，看看到底要用几步
        step++;
    }
    
    // 输出最终的步数
    printf("给定的整数%d需要%d步才能砍到n = 1.\n", tmp, step);
    
    return 0;
}
