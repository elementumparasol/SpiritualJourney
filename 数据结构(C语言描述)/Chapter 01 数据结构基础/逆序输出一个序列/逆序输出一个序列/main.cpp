//
//  main.cpp
//  逆序输出一个序列
//
//  Created by Enrica on 2018/7/18.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <stdio.h>

// 交换两个数
void swap(int &x, int &y) {
    
    int tmp = x;
    x = y;
    y = tmp;
}

// 逆转序列中的两个元素
void Reverse(int a[], int low, int high) {
    
    if (low >= high) {
        return;
    } else {
        
        swap(a[low], a[high]);
        Reverse(a, low + 1, high - 1);
    }
}

int main(int argc, const char * argv[]) {
    
    int a[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    
    int n = 10;
    Reverse(a, 0, n - 1);
    
    for (int i = 0; i < n; i++) {
        printf("%d  ", a[i]);
    }
    printf("\n");
    
    return 0;
}
