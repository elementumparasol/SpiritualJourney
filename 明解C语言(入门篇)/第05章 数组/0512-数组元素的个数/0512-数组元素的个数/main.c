//
//  main.c
//  0512-数组元素的个数
//
//  Created by Enrica on 2018/3/29.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>

/**
 * 输入学生的分属，并且显示出分布情况
 */

// 用来表示数组的长度
#define NUMBER 80

int main(void) {
    
    int i, j;
    int num;  // 学生实际人数
    int array[NUMBER];  // 数组最大的存储能力(最大长度)
    int bunpu[11] = {0};  // 定义一个长度为11的数组，并且将它里面所有元素都初始化为0值
    
    printf("请输入学生人数: ");
    
    // 过滤掉非法数值(保证至少有1人，但是不能超出数组最大长度NUMBER)
    do {
        
        // 输入学生的实际人数
        scanf("%d", &num);
        
        // 处理数组越界(确保至少有1人，或者实际人数不能超出数组最大的存储能力)
        if (num < 1 || num > NUMBER) {
            printf("数组越界，请重新输入1~%d之间的整数: ", NUMBER);
        }
    } while (num < 1 || num > NUMBER);  // 如果数组长度为0，或者出现其它越界情况，则重新输入
    
    printf("请依次输入这%d人的分数。\n", num);
    for (i = 0; i < num; i++) {
        printf("请输入第%d位学生的分数: ", i + 1);
        
        // 过滤掉非法的分数(确保分属在0~100分之间)
        do {
            
            // 将学生的得分存储到数组中
            scanf("%d", &array[i]);
            
            // 学生得分不能是负分，或者大于100分
            if (array[i] < 0 || array[i] > 100) {
                printf("分数输入有误，请输入0~100之间的分属: ");
            }
        } while (array[i] < 0 || array[i] > 100);  // 如果出现了非法的分数，则重新输入
        
        // 将学生的分数除以10，用来计算出各阶段得分的分布情况
        bunpu[array[i] / 10]++;
    }
    
    puts("----得分情况分布图----");
    printf("100的分布情况: ");  // 满分的分布情况
    
    // 打印满分分布图
    for (j = 0; j < bunpu[10]; j++) {
        putchar('#');
    }
    putchar('\n');
    
    // 打印0~9、10~19、20~29、30~39、40~49、50~59、60~69、70~79、80~89，以及90~99的分布图
    for (i = 9; i >= 0; i--) {
        printf("%3d - %3d之间的分布情况: ", i * 10, i * 10 + 9);
        
        // 打印该阶段得分的分布情况
        for (j = 0; j < bunpu[i]; j++) {
            putchar('*');
        }
        putchar('\n');
    }
    
    return 0;
}
