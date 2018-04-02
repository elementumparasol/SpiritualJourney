//
//  main.c
//  0913-还是显示字符串数组
//
//  Created by Enrica on 2018/4/3.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 显示字符串数组
 */

#include <stdio.h>

/**
 * 显示字符串数组(逐个显示字符)
 */
void put_strary(const char s[][6], int n) {
    
    int i = 0;
    for (i = 0; i < n; i++) {
        int j = 0;
        printf("s[%d] = \"", i);
        
        while (s[i][j]) {
            putchar(s[i][j++]);
        }
        
        putchar('\n');
    }
}

int main(void) {
    
    char cs[][6] = {"Turbo", "NA", "DOHC"};
    
    put_strary(cs, 3);
    
    return 0;
}
