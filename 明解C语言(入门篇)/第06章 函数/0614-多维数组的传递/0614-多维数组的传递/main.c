//
//  main.c
//  0614-多维数组的传递
//
//  Created by Enrica on 2018/3/31.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 求4名学生在两次考试中3门功课成绩的总分
 */

#include <stdio.h>

/**
 * 将4行3列矩阵a与b的和存储在c中:
 * - 参数a: 参与运算的数组a；
 * - 参数b: 参与运算的数组b
 * - 参数c: 用来存储数组a和b所有元素之和；
 * - 返回值: 这里不需要返回值，因为为空
 */
void mat_add(const int a[4][3], const int b[4][3], int c[4][3]) {
    
    // 遍历数组的行
    for (int i = 0; i < 4; i++) {
        
        // 遍历数组的列
        for (int j = 0; j < 3; j++) {
            
            // 将数组a和b的元素之和存储到数组c中
            c[i][j] = a[i][j] + b[i][j];
        }
    }
}

/**
 * 显示4行3列矩阵:
 * - 参数m: 需要打印元素的数组
 * - 返回值: 因为不需要返回值，因此为空
 */
void mat_print(const int m[4][3]) {
    
    // 遍历数组的行
    for (int i = 0; i < 4; i++) {
        
        // 遍历数组的列
        for (int j = 0; j < 3; j++) {
            
            // 打印数组的元素
            printf("%4d", m[i][j]);
        }
        
        // 打印换行符
        putchar('\n');
    }
}

int main(void) {
    
    // 4名学生3门课程第一次考试的成绩
    int first[4][3] = {{91, 63, 78}, {67, 72, 46}, {89, 34, 53}, {32, 54, 34}};
    
    // 4名学生3门课程第二次考试的成绩()
    int second[4][3] = {{97, 67, 82}, {73, 43, 46}, {97, 56, 21}, {85, 46, 35}};
    
    // 4名学生3门课程的总成绩
    int sum[4][3];
    
    // 调用mat_add函数，将第一次考试的成绩和第二次考试的成绩相加
    mat_add(first, second, sum);
    
    // 打印考试分数
    puts("第一次考试的分数: ");
    mat_print(first);
    
    puts("第二次考试的分数: ");
    mat_print(second);
    
    puts("两次考试的总分数: ");
    mat_print(sum);
    
    return 0;
}
