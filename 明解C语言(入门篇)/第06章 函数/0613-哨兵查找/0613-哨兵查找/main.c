//
//  main.c
//  0613-哨兵查找
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 在数组末尾追加的数据称为哨兵，使用哨兵进行查找的方法称之为哨兵查找法。
 * 使用哨兵可以简化对循环结束条件的判断。
 */

#include <stdio.h>

// 数组的长度
#define NUMBER 5

// 查找失败
#define FAILED -1

/**
 * 使用哨兵查找法来进行顺序查找
 * - 参数v: int数组类型，用来接收外部传递进来的数组；
 * - 参数key: 需要查找的元素值；
 * - 参数n: 数组长度；
 * - 返回值: 如果查找成功，则返回该元素对应的下标；如果查找失败，则返回FAILED(-1)
 */
int search(int v[], int key, int n) {
    
    int i = 0;
    
    // 添加哨兵(把需要查找的数值添加到数组的末尾作为哨兵)
    // 因为哨兵查找会在原有数组的基础上再添加一个元素，也就
    // 是会改变原始数组的长度，因此在进行函数定义时，数组v
    // 前面不能使用关键字const进行修饰
    v[n] = key;
    
    while (1) {
        
        // 当在数组v中找到需要查找的值key时，直接退出循环
        if (v[i] == key) {
            break;
        }
    
        i++;
    }
    
    // 因为数组v的下标是从0开始，到n - 1结束，所以当i < n时，
    // 则表示在0~n-1的范围内查找成功；当i = n是，则表示已经
    // 到数组的末尾了(也就是查找到哨兵了)，查找失败
    return (i < n) ? i : FAILED;
}

int main(void) {
    
    int array[NUMBER];
    int ky, idx;  // 其中ky表示需要查找的值，idx表示查找到元素对应的下标
    
    puts("请输入数组array对应各元素的值。");
    for (int i = 0; i < NUMBER; i++) {
        printf("array[%d]: ", i);
        scanf("%d", &array[i]);
    }
    
    puts("请输入你要查找的值: ");
    scanf("%d", &ky);
    
    // 调用函数search进行查找
    if ((idx = search(array, ky, NUMBER)) == FAILED) {
        puts("\a查找失败！");
    } else {
        printf("%d是数组array的第%d号元素。\n", ky, idx + 1);
    }
    
    return 0;
}
