//
//  main.c
//  05-快速排序
//
//  Created by Enrica on 2018/4/21.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 快速排序是一个应用递归调用的绝佳例子。快速排序的思路大致如下：
 *  (1)、从需要排序的数据中，找到一个适当的的基准值pivot；
 *  (2)、将需要排序的数据按照小于pivot和大于pivot分成两部分；
 *  (3)、对分类之后的两部分数据各自重复上述步骤。
 */

#include <stdio.h>

// 交换a的值b
#define SWAP(a, b) {int tmp; tmp = a; a = b; b = tmp;}

/**
 * 按照选定的基点，对数组进行分割，并且对分割的部分进行排序
 * - 参数data: 指向数组的指针；
 * - 参数left: 数组的起始索引；
 * - 参数right: 数组的尾部索引；
 * - 返回值: 没有返回值
 */
void quick_sort_sub(int *data, int left, int right) {
    
    // 定义起始索引
    int left_index = left;
    
    // 定义尾部索引
    int right_index = right;
    
    // 确定参照基点
    int pivot = data[(left + right) / 2];
    
    // 当起始索引小于或者等于尾部索引时
    while (left_index <= right_index) {
        
        // 遍历数组，分割数组中下标小于pivot的部分
        for (; data[left_index] < pivot; left_index++);
        
        // 遍历数组，分割数组中下标大于pivot的部分
        for (; data[right_index] > pivot; right_index--);
        
        if (left_index <= right_index) {
            
            // 交换两个元素的顺序
            SWAP(data[left_index], data[right_index]);
            
            // 下标增加
            left_index++;
            
            // 下标递减
            right_index--;
        }
    }
    
    // 对下标小于pivot的部分递归调用quick_sort_sub()函数，继续分割和排序
    if (right_index > left) {
        
        quick_sort_sub(data, left, right_index);
    }
    
    // 对下标大于pivot的部分递归调用quick_sort_sub()函数，继续分割和排序
    if (left_index < right) {
        
        quick_sort_sub(data, left_index, right);
    }
}

/**
 * 对一个int类型的数组执行升序排序
 * - 参数data: 数组的指针
 * - 参数data_size: 数组的长度(数组中元素的个数)
 * - 返回值: 没有返回值
 */
void quick_sort(int *data, int data_size) {
    
    // 传入数组指针，数组的起始索引和尾部索引
    quick_sort_sub(data, 0, data_size - 1);
}

int main(int argc, const char * argv[]) {
    
    int i;
    
    // 定义一个int类型的数组
    int array[] = {88, 23, 91, 76, 34, 56, 17};
    
    printf("未排序之前，数组中元素的顺序: \n");
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
    
    // 调用quick_sort()函数，对数组array进行升序排序
    quick_sort(array, sizeof(array) / sizeof(array[0]));
    
    printf("\n");
    
    printf("排序之后，数组中元素的顺序: \n");
    for (i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        printf("array[%d] = %d\n", i, array[i]);
    }
    
    return 0;
}
