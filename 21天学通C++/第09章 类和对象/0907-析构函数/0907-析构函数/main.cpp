//
//  main.cpp
//  0907-析构函数
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 封装一个字符缓冲区，并且通过析构函数来释放它
 */

#include <iostream>
#include <string>
using namespace std;

class MyString {
    
private:
    char *buffer;
    
public:
    
    // 定义构造函数
    MyString(const char *initString) {
        
        // 判断输入的字符串是否为空
        if (initString != NULL) {
            
            // 使用strlen函数确定输入字符串的长度，然后再使用
            // new为这个字符串分配内存空间，并且对指针buffer
            // 进行初始化(没有进行初始化的指针，它是不能访问的)
            buffer = new char [strlen(initString - 1)];  // 1、初始化指针(确定指针自身的内存地址)
            
            // 使用函数strcpy将输入的字符串复制到指针buffer指向
            // 的内存中(也就是让指针buffer指向新输入的字符串)
            strcpy(buffer, initString);  // 2、将指针buffer指向某个特定的值
        } else {
            
            // 如果输入的字符串为空，则将指针初始化为NULL
            buffer = NULL;
        }
    }
    
    // 定义析构函数
    ~MyString() {
        cout << "MyString对象被释放掉了。" << endl;
        if (buffer != NULL) {
            
            // 释放掉手动分配的内存
            delete [] buffer;
        }
    }
    
    int GetLength() {
        return strlen(buffer);
    }
    
    const char *GetString() {
        return buffer;
    }
};

int main(void) {
    
    MyString sayHello("Hello from String Class");
    cout << "字符串sayHello的长度是: " << sayHello.GetLength() << endl;
    cout << "字符串sayHello的内容包含: " << sayHello.GetString() << endl;
    
    return 0;
}
