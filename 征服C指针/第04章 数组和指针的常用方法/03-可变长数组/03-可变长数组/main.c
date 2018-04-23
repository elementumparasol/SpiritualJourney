//
//  main.c
//  03-可变长数组
//
//  Created by Enrica on 2018/4/23.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    
    char buf[256];
    int size;
    int *variable_array;
    int i;
    
    printf("输入数组的大小: ");
    fgets(buf, 256, stdin);
    sscanf(buf, "%d", &size);
    
    // 动态的为数组variable_array分配内存空间
    variable_array = malloc(sizeof(int) * size);
    
    // 给数组variable_array中的元素赋值
    for (i = 0; i < size; i++) {
        variable_array[i] = i;
    }
    
    // 打印数组variable_array中所有的元素
    for (i = 0; i < size; i++) {
        printf("variable_array[%d] = %d\n", i, variable_array[i]);
    }
    
    return 0;
}
