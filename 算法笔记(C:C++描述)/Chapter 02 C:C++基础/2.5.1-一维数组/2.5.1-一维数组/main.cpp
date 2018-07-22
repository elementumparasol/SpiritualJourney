//
//  main.cpp
//  2.5.1-一维数组
//
//  Created by Enrica on 2018/7/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstdio>

int main(int argc, const char * argv[]) {
    
    int a[10];
    printf("请输入整形数组中元素的值: ");
    scanf("%d", &a[0]);
    
    // 数组元素的个数: sizeof(数组名) / sizeof(数组元素类型)
    for (int i = 1; i < sizeof(a) / sizeof(int); i++) {
        
        // 数组中后一位元素的值可以有数组中前一位，或者前若干位元素的值
        // 计算得来，那么这种做法就称之为递推。递推又可以分为顺推和逆推
        a[i] = a[i - 1] * 2;
    }
    
    for (int i = 0; i < sizeof(a) / sizeof(int); i++) {
        printf("a[%d] = %d\n", i, a[i]);
    }
    
    return 0;
}
