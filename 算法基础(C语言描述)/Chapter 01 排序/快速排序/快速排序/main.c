//
//  main.c
//  快速排序
//
//  Created by Enrica on 2018/7/23.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <stdio.h>

// 全局变量会自动初始化为0
int a[50], n;

void quickSort(int left, int right) {
    
    int i, j, t, tmp;
    
    if (left > right) return;
    
    // 将基准数存入t中
    t = a[left];
    i = left;
    j = right;
    while (i != j) {
        
        // 先从右边往左边查找
        while (a[j] >= t && i < j) {
            j--;
        }
        
        // 再从左边往右边查找
        while (a[i] <= t && i < j) {
            i++;
        }
        
        // 交换两个数在数组中的位置
        if (i < j) {
            
            // 如果哨兵i和j没有相遇时
            tmp = a[i];
            a[i] = a[j];
            a[j] = tmp;
        }
    }
    
    // 基准数最终归位
    a[left] = a[i];
    a[i] = t;
    
    // 继续处理基准数左边的数
    quickSort(left, i - 1);
    
    // 继续处理基准数右边的数
    quickSort(i + 1, right);
}

int main(int argc, const char * argv[]) {
    
    printf("请读入需要处理的数据个数: ");
    scanf("%d", &n);
    
    printf("请依次输入需要处理的数据: ");
    for (int i = 1; i <= n; i++) {
        scanf("%d", &a[i]);
    }
    
    // 调用函数，进行排序
    quickSort(1, n);
    
    for (int i = 1; i <= n; i++) {
        printf("%d ", a[i]);
    }
    
    return 0;
}
