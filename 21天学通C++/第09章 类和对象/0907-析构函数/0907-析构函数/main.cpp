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
        
        if (initString != NULL) {
            buffer = new char [strlen(initString - 1)];
            strcpy(buffer, initString);
        } else {
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
