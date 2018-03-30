//
//  main.c
//  0611-函数传递和const类型修饰符
//
//  Created by Enrica on 2018/3/30.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将数组的所有元素设置为0
 */

#include <stdio.h>

/**
 * 把0赋值给数组v中所有的元素
 *  - 参数v: 表示用来存储整数的数组v；
 *  - 参数n: 表示数组v的长度(或者说数组v的元素个数)
 */
void set_zero(int v[], int n) {  // 因为函数set_zero需要修改数组元素的值，因此这里不能用set_zero修饰数组v
    
    // 将数组v中所有的元素赋值为0
    for (int i = 0; i < n; i++) {
        v[i] = 0;
    }
}

/**
 * 显示有n个元素的数组v中所有的元素，并且换行
 */
void print_array(const int v[], int n) {  // 因为函数print_array只负责打印，不负责修改，因此可以使用const进行修饰
    
    // 打印左花括号
    printf("{ ");
    
    // 打印数组v中所有的元素
    for (int i = 0; i < n; i++) {
        printf("%d ", v[i]);
    }
    
    // 打印右花括号
    printf("}");
}

int main(void) {
    
    // 因为我们在定义数组array1的时候对其进行了初始化，
    // 因此可以省略数组的长度，此时系统会根据初始化情况
    // 自动推断数组array1的长度。
    int array1[] = {1, 2, 3, 4, 5};
    int array2[] = {3, 2, 1};
    
    // 打印array1
    printf("array1 = ");
    print_array(array1, 5);
    putchar('\n');
    
    // 打印array2
    printf("array2 = ");
    print_array(array2, 3);
    putchar('\n');
    
    // 把0值赋值给数组array1中所有的元素
    set_zero(array1, 5);
    
    // 把0值赋值给数组array2中所有的元素
    set_zero(array2, 3);
    
    // 打印设置0值之后数组array1和array2所有的元素
    printf("array1 = ");
    print_array(array1, 5);
    putchar('\n');
    
    printf("array2 = ");
    print_array(array2, 3);
    putchar('\n');
    
    return 0;
}
