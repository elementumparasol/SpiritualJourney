//
//  main.c
//  06-将数组作为函数的参数进行传递
//
//  Created by Enrica on 2018/4/20.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

/**
 * 读取字符串，其中:
 * - 参数buf: 表示传入的字符串数组
 * - 参数buf_size表示: 所传入字符串数组的长度
 * - 参数fp表示: 用于记录控制流所需要的信息
 * - 返回值: 返回字符串的长度
 */
int get_word(char *buf, int buf_size, FILE *fp) {
    
    int len;
    int ch;
    
    // 跳过读取到的空白字符
    // 函数getc()的作用是: 从流中读取字符
    // 函数isalnum()的作用是: 判断字符变量ch是否为字母或数字，若是则返回非零，否则返回零
    // 宏EOF是"End of File"的缩写，通常用在文本中表示数据资料的结束(没有文本可以读入了)
    while ((ch = getc(fp)) != EOF && !isalnum(ch));
    
    if (ch == EOF)
        return EOF;
    
    // 此时，ch中保存了单词的初始字符
    len = 0;
    do {
        buf[len] = ch;
        len++;
        if (len >= buf_size) {
            
            // 单词太长。
            // fprintf()函数根据指定的格式向输出流写入数据，其中stderr表示标准错误流
            fprintf(stderr, "word too long.\n");
            exit(1);
        }
    } while((ch = getc(fp)) != EOF && isalnum(ch));
    
    buf[len] = '\0';
    
    return len;
}

int main(int argc, const char * argv[]) {
    
    // 声明一个字符串数组buf
    char buf[256];
    
    printf("请输入一个字符串: ");
    
    // 传入字符串数组buf及其长度256，然后再传入标准输入流stdin
    while (get_word(buf, 256, stdin) != EOF) {
        printf("你输入的字符串为: %s\n", buf);
    }
    
    return 0;
}
