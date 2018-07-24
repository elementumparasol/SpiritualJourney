//
//  main.cpp
//  2.6.4-函数的嵌套调用
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

// 函数的嵌套调用，是指在一个函数中调用另外一个函数
int max_1(int a, int b) {
    
    if (a > b) return a;
    else return b;
}


int max_2(int a, int b, int c) {
    
    // 先比较a和b的大小
    int tmp = max_1(a, b);  // 这里就是函数的嵌套调用
    
    // 在来比较tmp和c的大小
    tmp = max_1(tmp, c);
    
    // 最后返回三个之间的最大值
    return tmp;
}

int main(int argc, const char * argv[]) {
    
    int a, b, c;
    
    printf("请随机输入3个整数: \n");
    
    scanf("%d %d %d", &a, &b, &c);
    
    // 输入3个数中最大的那一个
    printf("3个整数中最大的一位是: %d\n", max_2(a, b, c));  // 这里也是函数的嵌套调用
    
    return 0;
}
