//
//  main.c
//  1001-函数的参数
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 计算两个整数的和与差(错误示例演示)
 */

#include <stdio.h>

/**
 * 将n1和n2的和、差分别保存至sum、diff(错误示例的演示)
 */
void sum_diff(int n1, int n2, int a, int b) {
    
    a = n1 + n2;
    b = (n1 > n2) ? n1 - n2 : n2 - n1;
}

int main(void) {
    
    int na, nb;
    int sum = 0, diff = 0;
    
    printf("请依次输入两个整数。\n");
    printf("整数A: ");  scanf("%d", &na);
    printf("整数B: ");  scanf("%d", &nb);
    
    // 调用函数sum_diff, 分别计算这两个整数的和与差
    sum_diff(na, nb, sum, diff);
    
    printf("这两个整数的和为: %d, 这两个数的差为: %d\n", sum, diff);
    
    return 0;
}

// 最后输出的结果一定是: sum = 0, diff = 0。因为我们在初始化的时候，设置
// sum = 0， diff = 0，而调用函数sum_diff(na, nb, sum, diff)并不会
// 对结果产生任何影响，因此最后的结果仍然是: sum = 0, diff = 0.
//
// 下面，我们来分析一下为什么调用函数sum_diff(na, nb, sum, diff)之后不
// 会对sum和diff的结果产生任何影响:
//  当main函数调用函数sum_diff(na, nb, sum, diff)函数时，将实参na, nb,
//  sum和diff传递给形参n1, n2, a和b，这一过程是一个单向复制的过程，也就是将
//  实参na, nb, sum和diff各拷贝一份，分别赋值给形参n1, n2, a和b，也就是我
//  常说的值传递，值传递的特点是，当我们在函数sum_diff中对形参的值进行改变时，
//  并不会影响到原始实参的值。因为原始实参和形参并不是同一个东西，形参的值只是
//  从原始值哪里拷贝过来的，除了值相等以外，它们是两个不同的东西。所以，尽管我们
//  调用函数sum_diff(na, nb, sum, diff)，在它里面对形参的值进行改变，最终
//  main函数里面的sum和diff依旧还是初始化时的值。如果想要改变它，就必须使用指针
