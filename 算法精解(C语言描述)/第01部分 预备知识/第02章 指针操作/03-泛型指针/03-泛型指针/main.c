//
//  main.c
//  03-泛型指针
//
//  Created by Enrica on 2018/4/25.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// void指针在用来实现数据结构时，是非常有用的，因为可以通过
// void指针存储和检索任何类型的数据。因此，void指针也被称之为泛型指针
int swap(void *x, void *y, int size) {
    
    void *tmp;
    
    if ((tmp = malloc(size)) == NULL)
        return -1;
    
    memcpy(tmp, x, size);
    memcpy(x, y, size);
    memcpy(y, tmp, size);
    
    free(tmp);
    
    return 0;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
