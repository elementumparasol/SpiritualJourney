//
//  main.c
//  0612-顺序查找
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 顺序查找(线性查找): 从数组的开头出发顺次搜索，找出与目标相同的元素的一系列操作，我们称之为顺序查找，或者现行查找
 */

#include <stdio.h>

// 数组元素个数
#define NUMBER 5

// 查找失败
#define FAILED - 1

/**
 * 查找元素为n的数组v中与key一致的元素
 */
int search(const int v[], int key, int n) {
    
    int i = 0;
    
    while (1) {  // 因为while的条件是1，也就是永远循环。不过查找失败，或者查找成功时，会执行return语句，跳出循环
        
        // 因为数组v最后一个元素的下标是n- 1, 如果i == n的话
        // 就说明从下标0~n - 1这个区间的元素都查找失败了。因为
        // 下面一旦查找成功，就直接return i，也就是退出函数search
        // 了，从而也就不可能出现 i == n。也就是说，能出现i == n
        // 只能说明要查找的元素不在数组v中
        if (i == n) {
            return FAILED;  // 查找失败
        }
        
        // 一旦发现数组v中存在元素v[i] == key，就说明查找
        // 成功，因此就可以直接返回该元素在数组v中所对应的下标
        if (v[i] == key) {
            return i;  // 查找成功，返回该元素的下标值
        }
        
        // i的初值为0，每循环一次就加1，直到循环完毕
        i++;
    }
}

int main(void) {
    
    int ky, idx;
    
    // 用来存储输入的数值
    int vx[NUMBER];
    
    puts("请输入数组中元素的值。");
    
    // 遍历数组vx，给数组的元素赋初值
    for (int i = 0; i < NUMBER; i++) {
        
        // 给数组vx的第i个元素赋值
        printf("vx[%d]: ", i);
        
        // 将输入的数值保存起来
        scanf("%d", &vx[i]);
    }
    
    // 输入想要查找的值
    printf("请输入你要查找的值: ");
    scanf("%d", &ky);
    
    // 调用函数search()，查找元素ky是否存在于数组vx中
    idx = search(vx, ky, NUMBER);
    
    // 显示查找结果
    if (idx == FAILED) {
        puts("\a查找失败！");
    } else {
        printf("%d是数组的第%d号元素。\n", ky, idx + 1);
    }
    
    return 0;
}
