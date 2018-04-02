//
//  main.c
//  0905-格式化显示字符串
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 格式化显示字符串"12345"
 */

#include <stdio.h>

int main(void) {
    
    char str[] = "12345";
    
    printf("%s\n", str);
    printf("%3s\n", str);  // 至少显示3位
    printf("%.3s\n", str);  // 最多显示3位
    printf("%8s\n", str);  // 右对齐
    printf("%-8s\n", str);  // 左对齐
    
    return 0;
}
