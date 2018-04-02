//
//  main.c
//  0904-字符串的读取
//
//  Created by Enrica on 2018/4/2.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 询问名字并显示问候语
 */

#include <stdio.h>

int main(void) {
    
    char name[48];
    
    printf("请输入你的名字: ");
    scanf("%s", name);  // 注意，和之前的写法不同，这里字符串数组前面不需要加上取地址符&
    
    printf("你好，%s先生/女士!\n", name);
    
    return 0;
}
