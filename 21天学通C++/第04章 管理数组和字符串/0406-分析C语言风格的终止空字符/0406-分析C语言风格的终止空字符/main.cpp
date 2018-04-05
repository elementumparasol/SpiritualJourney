//
//  main.cpp
//  0406-分析C语言风格的终止空字符
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 分析C语言风格的终止空字符
 */

#include <iostream>
#include <string>
using namespace std;

int main(void) {
    
    cout << "请输入一个不超过20个字符的英文单词(或句子): ";
    char userInput[21] = {'\0'};
    cin >> userInput;
    
    cout << "你输入单词(或句子)的长度是: " << strlen(userInput) << endl;
    
    return 0;
}
