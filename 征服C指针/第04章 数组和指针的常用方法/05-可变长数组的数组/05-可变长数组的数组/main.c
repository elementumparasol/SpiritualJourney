//
//  main.c
//  05-可变长数组的数组
//
//  Created by Enrica on 2018/4/24.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void read_slogan(FILE *fp, char **slogan) {
    
    char buf[1024];
    int i;
    
    for (i = 0; i < 7; i++) {
        fgets(buf, 1024, stdin);
        
        // 删除换行字符
        buf[strlen(buf) - 1] = '\0';
        
        // 分配一个内存空间，用来保存标语
        slogan[i] = malloc(sizeof(char) * (strlen(buf) + 1));
        
        // 赋值标语的内容
        strcpy(slogan[i], buf);
    }
}

int main(int argc, const char * argv[]) {
    
    char *slogan[7];
    int i;
    printf("请连续输入7个标语: \n");
    read_slogan(stdin, slogan);
    
    // 输出读取的标语
    for (i = 0; i < 7; i++) {
        printf("%s\n", slogan[i]);
    }
    
    return 0;
}
