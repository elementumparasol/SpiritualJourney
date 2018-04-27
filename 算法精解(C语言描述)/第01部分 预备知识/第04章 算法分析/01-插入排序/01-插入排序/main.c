//
//  main.c
//  01-插入排序
//
//  Created by Enrica on 2018/4/28.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int issort(void *data, int size, int esize, int (*compare)(const void *key1, const void *key2)) {
    
    char *a = data;
    void *key;
    int i, j;
    
    if ((key = (char *)malloc(esize)) == NULL) {
        return -1;
    }
    
    for (j = 1; j < size; j++) {
        memcpy(key, &a[j * esize], esize);
        i = j - 1;
        
        while (i >= 0 && compare(&a[i * esize], key) > 0) {
            memcpy(&a[(i + 1) * esize], &a[i * esize], esize);
            i--;
        }
        
        memcpy(&a[(i + 1) * esize], key, esize);
    }
    
    free(key);
    
    return 0;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
    return 0;
}
