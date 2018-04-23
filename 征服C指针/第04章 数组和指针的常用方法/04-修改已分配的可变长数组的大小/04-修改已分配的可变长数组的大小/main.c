//
//  main.c
//  04-修改已分配的可变长数组的大小
//
//  Created by Enrica on 2018/4/23.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    
    int *variable_array = NULL;  // 将NULL赋值给指针，表示该指针不指向任何地方
    int size = 0;
    char buf[256];
    int i;
    
    while (fgets(buf, 256, stdin) != NULL) {
        size++;
        variable_array = realloc(variable_array, sizeof(int) * size);
        sscanf(buf, "%d", &variable_array[size - 1]);
    }
    
    for (i = 0; i < size; i++) {
        printf("variable_array[%d] = %d\n", i, variable_array[i]);
    }
    
    return 0;
}
