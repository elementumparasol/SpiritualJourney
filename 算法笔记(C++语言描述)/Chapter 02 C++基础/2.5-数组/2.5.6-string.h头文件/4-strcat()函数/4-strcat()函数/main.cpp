//
//  main.cpp
//  4-strcat()函数
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstring>

int main(int argc, const char * argv[]) {
    
    // strcat()函数可以把一个字符串拼接到另一个字符串后面
    char str1[50], str2[50];
    
    printf("请输入两个字符串，分别存放在str1和str2中: \n");
    gets(str1);
    gets(str2);
    
    puts(str1);
    puts(str2);
    
    // 将str2拼接到str1后面
    strcat(str1, str2);
    
    puts(str1);
    
    return 0;
}
