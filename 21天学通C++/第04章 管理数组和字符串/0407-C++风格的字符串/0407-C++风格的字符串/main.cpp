//
//  main.cpp
//  0407-C++风格的字符串
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用std::string初始化字符串、存储用户输入、复制和拼接字符串，以及确定字符串的长度
 */

#include <iostream>
#include <string>
using namespace std;

int main(void) {
    
    // 在C++中，初始化字符串的方式除了常见的C语言风格的
    // string text = "text"; 这是C语言风格的拷贝初始化
    // string text1("text2"); 这是C++风格的直接初始化
    // string text3(10. 'H'); 这也是直接初始化，text3的内容是"HHHHHHHHHH"(即，10个H)
    string greetString("Hello c++ style string!");
    cout << greetString << endl;
    
    cout << "请输入一行文本: " << endl;
    string firstLine;  // 声明一个string类型的变量firstLine
    getline(cin, firstLine);  // string函数，后面会有涉及
    
    cout << "请再输入一行文本: " << endl;
    string secondLine;
    getline(cin, secondLine);
    
    cout << "拼接这两行字符串: " << endl;
    string concatString = firstLine + " " + secondLine;
    cout << concatString << endl;
    
    cout << "复制刚才拼接的字符串: " << endl;
    string aCopy;
    aCopy = concatString;
    cout << aCopy << endl;
    
    cout << "拼接字符串的长度: " << concatString.length() << endl;
    
    return 0;
}
