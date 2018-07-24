//
//  main.cpp
//  1-strlen()函数
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>
#include <cstring>

int main(int argc, const char * argv[]) {
    
    // strlen()函数可以得到字符数组中第一个'\0'前面所有的字符个数
    char str[10];
    printf("请输入一个字符串: \n");  // 注意，输入的字符个数必须在9个以内，因为至少要留一个位置存储空字符\0，否则就会数组越界
    gets(str);
    
    size_t len = strlen(str);
    printf("字符数组str的长度是: %ld\n", len);
    
    return 0;
}
