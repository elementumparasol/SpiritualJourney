//
//  main.cpp
//  2.5.5.2.2-getchar和putchar
//
//  Created by Enrica on 2018/7/24.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    
    char str[5][5];
    
    printf("请输入字符串: \n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            str[i][j] = getchar();
        }
        
        // 接收每一行末尾的换行符。输入三个字符之后有一个换行，
        // 使用getchar()将这个换行吸收掉，以便其在输出的时候
        // 不影响结果。如果不用getchar()将换行符吸收，我们在
        // 后面输出的时候，换行符也会被当做一个字符被输出(空白)
        getchar();
    }
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            putchar(str[i][j]);
        }
        
        putchar('\n');
    }
    
    return 0;
}
