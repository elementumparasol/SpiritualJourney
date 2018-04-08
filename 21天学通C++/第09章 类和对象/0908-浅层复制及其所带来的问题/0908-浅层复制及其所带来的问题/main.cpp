//
//  main.cpp
//  0908-浅层复制及其所带来的问题
//
//  Created by Enrica on 2018/4/8.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 按值传递类的对象所带来的问题
 */

#include <iostream>
#include <string>
using namespace std;

class MyString {
    
private:
    
    // 声明一个char类型的指针
    char *buffer;
    
public:
    
    // 构造函数
    MyString(const char *initString) {
        
        // 对指针buffer进行初始化
        buffer = NULL;
        
        if (initString != NULL) {
            
            // 确定输入的字符串initString的长度，然后再使用
            // new为其分配存储空间，最后再将这段内存空间赋值
            // 给指针变量buffer(指针变量buffer已经初始化过了)
            buffer = new char [strlen(initString) + 1];
            
            // 复制initString的内容，然后再让指针buffer指向
            // 复制的内容
            strcpy(buffer, initString);
        }
    }
    
    // 析构函数
    ~MyString() {
        
        cout << "MyString对象所占用的内存空间已经被释放掉了。" << endl;
        // 释放手动分配的内存
        delete [] buffer;
    }
    
    // 获取指针变量buffer的长度
    int GetLength() {
        return strlen(buffer);
    }
    
    // 获取指针buffer所指向的字符串内容
    const char *GetString() {
        
        return buffer;
    }
};

/**
 * 返回指针变量buffer所指向内容的相关信息
 * - 参数str: MyString对象
 */
void UseMyString(MyString str) {
    
    // 因为参数str是MyString对象sayHello的复制。而在复制MyString类对象时，复制的是
    // 其指针成员，并不是复制指针指向的缓冲区，也就是最后导致两个指针对象指向同一块内存
    // 空间。当我们通过delete [] buffer销毁手动分配的内存空间时，会导致另外一个对象存
    // 储的指针拷贝无效，从而引发程序崩溃。这种复制被称之为浅层复制。
    cout << "指针变量buffer指向字符串的长度是: " << str.GetLength() << endl;
    cout << "指针变量buffer所指向字符串的内容是: " << str.GetString() << endl;
    
    return;
}

int main(void) {
    
    // 创建MyString对象，并且将字符串参数传递给构造函数中的形参
    MyString sayHello ("Hello, Cpp Programming Language.");
    
    // 调用UseMyString函数，将字符串对象sayHello作为参数传递进去，以便显示相关的信息
    UseMyString(sayHello);  // 问题出在了这里，此时MyString对象sayHello是通过值传递的形式传给UserMyString函数的
    
    return 0;
}

/**
 * 程序运行之后会导致崩溃，这主要是因为在调用UseMyString函数时，实参sayHello是通过
 * 值传递的形式传递个它的
 */
