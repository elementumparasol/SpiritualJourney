//
//  main.cpp
//  2.5.2-冒泡排序
//
//  Created by Enrica on 2018/7/22.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstdio>

int main(int argc, const char * argv[]) {
    
    // 一个未经排序的数组，要求按照从大到小进行排序
    int a[] = {25, 99, 73, 64, 55, 91, 103};
    
    // 进行n - 1趟
    for (int i = 1; i <= sizeof(a) / sizeof(int) - 1; i++) {
        
        // 第i趟时，从a[0]到a[n - i - 1]都与它们下一个数进行比较
        for (int j = 0; j < sizeof(a) / sizeof(int) - i; j++) {
            
            // 如果左边的数更小，则交换
            if (a[j] < a[j + 1]) {
                int tmp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = tmp;
            }
        }
    }
    
    // 输出重新排序之后的数组
    for (int i = 0; i <= sizeof(a) / sizeof(int); i++) {
        printf("%d ", a[i]);
    }
    
    printf("\n");
    
    return 0;
}
