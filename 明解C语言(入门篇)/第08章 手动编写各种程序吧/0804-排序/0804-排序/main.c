//
//  main.c
//  0804-排序
//
//  Created by Enrica on 2018/4/1.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 读取学生的身高并排序
 */

#include <stdio.h>

#define NUMBER 5

/**
 * 冒泡儿排序
 * - 参数a: 表示数组
 * - 参数n: 表示数组的长度
 */
void bubble_sort(int a[], int n) {
    
    // 总共有n - 1趟
    for (int i = 0; i < n - 1; i++) {
        
        // 从末尾向开头遍历
        for (int j = n - 1; j > i; j--) {
            
            // 如果左侧的元素比较大，则交换两个值
            if (a[j - 1] > a[j]) {
                int tmp = a[j];
                a[j] = a[j - 1];
                a[j - 1] = tmp;
            }
        }
    }
}

int main(void) {
    
    // 用于存放学生的身高
    int height[NUMBER];
    
    // 依次录入学生的身高
    printf("请依次输入%d位学生的身高。\n", NUMBER);
    for (int i = 0; i < NUMBER; i++) {
        printf("第%d位学生的身高是: ", i + 1);
        scanf("%d", &height[i]);
    }
    
    // 对学生的身高进行排序
    bubble_sort(height, NUMBER);
    
    // 按照升序输出学生的身高
    puts("学生的身高按升序进行排列: ");
    for (int i = 0; i < NUMBER; i++) {
        printf("%2d号学生的身高为: %d\n", i + 1, height[i]);
    }
    
    return 0;
}
