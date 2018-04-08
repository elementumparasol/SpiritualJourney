//
//  main.cpp
//  0909-深层复制
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 定义一个复制构造函数，确保对动态分配的缓冲区进行深层复制
 */

#include <iostream>
#include <string>
using namespace std;

class MyString {
    
private:
    
    // 定义一个char类型的指针变量
    char *buffer;
    
public:
    
    // 构造函数
    MyString(const char *initString) {
        
        // 初始化指针变量buffer
        buffer = NULL;
        
        // 如果initString不为空
        if (initString != NULL) {
            
            // 计算initString的长度，并且重新为指针变量buffer分配内存地址
            buffer = new char [strlen(initString) + 1];
            
            // 复制initString的内容，并且让指针变量buffer指向这个复制的内容
            strcpy(buffer, initString);
            
            cout << "buffer points to: " << hex << (unsigned int *)buffer << endl;
        }
    }
    
    // 复制构造函数
    MyString(const MyString &copySource) {
        buffer = NULL;
        
        cout << "复制构造函数: 复制MyString的对象" << endl;
        
        if (copySource.buffer != NULL) {
            
            // 为自己的buffer分配内存地址
            buffer = new char [strlen(copySource.buffer) + 1];
            
            //
            strcpy(buffer, copySource.buffer);
            
            cout << "buffer points to: " << hex << (unsigned int *)buffer << endl;
        }
    }
    
    // 析构函数
    ~MyString() {
        
        cout << "MyString对象被销毁。" << endl;
        
        // 释放手动分配的内存空间
        delete [] buffer;
    }
    
    // 获取字符串对象的长度
    int GetLength() {
        return strlen(buffer);
    }
    
    // 获取字符串对象的内容
    const char * GetString() {
        return buffer;
    }
};

/**
 * 返回字符串对象的相关信息
 * - 参数str: MyString字符串对象
 */
void UseMyString(MyString str) {
    
    cout << "字符串的长度为: " << str.GetLength() << endl;
    cout << "字符串的内容为: " << str.GetString() << endl;
    
    return;
}

int main(void) {
    
    // 创建MyString对象，并且将字符串内容传递给MyString的构造函数的形参
    MyString sayHello("Hello, Cpp Programming Language.");
    
    // 调用UseMyString函数
    UseMyString(sayHello);
    
    return 0;
}
