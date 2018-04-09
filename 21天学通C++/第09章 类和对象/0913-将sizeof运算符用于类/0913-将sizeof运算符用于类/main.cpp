//
//  main.cpp
//  0913-将sizeof运算符用于类
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将sizeof运算符用于类及其实例
 */

#include <iostream>
#include <string>
using namespace std;

class MyString {
private:
    
    // 创建一个char类型的指针变量buffer
    char *buffer;
    
public:
    
    // 默认的构造函数
    MyString(const char *initString) {
        
        // 初始化指针buffer
        buffer = NULL;
        
        if (initString != NULL) {
            
            // 计算字符串initString的长度，并且为它分配存储
            // 空间，最后再将这块内存地址赋值给指针变量buffer
            buffer = new char [strlen(initString) + 1];
            
            // 复制字符串initString的内容，然后再让指针变量
            // buffer指向这个字符串
            strcpy(buffer, initString);
        }
    }
    
    // 复制构造函数
    MyString(const MyString &copySource) {
        buffer = NULL;
        if (copySource.buffer != NULL) {
            
            buffer = new char [strlen(copySource.buffer) + 1];
            strcpy(buffer, copySource.buffer);
        }
    }
    
    // 析构函数
    ~MyString() {
        delete [] buffer;
    }
    
    // 获取字符串的长度
    int GetLength() {
        return strlen(buffer);
    }
    
    // 获取字符串的内容
    const char *GetString() {
        return buffer;
    }
};


class Human {
private:
    int age;
    bool gender;
    MyString name;
    
public:
    
    // 包含初始化列表的构造函数(冒号后面列出了成员变量及其初始值)
    Human(const MyString &inputName, int inputAge, bool gender) : name(inputName), age(inputAge), gender(gender) {}
    
    int GetAge() {
        return age;
    }
};

int main(void) {
    
    MyString mansName("James");
    MyString womansName("Eve");
    
    cout << "sizeof(MyString) = " << sizeof(MyString) << endl;
    cout << "sizeof(mansName) = " << sizeof(mansName) << endl;
    cout << "sizeof(wonamsName) = " << sizeof(womansName) << endl;
    
    cout << endl;
    
    Human firstMan (mansName, 25, true);
    Human firstWoman (womansName, 18, false);
    
    cout << endl;
    
    cout << "sizeof(Human) = " << sizeof(Human) << endl;
    cout << "sizeof(firstMan) = " << sizeof(firstMan) << endl;
    cout << "sizeof(firstWoman) = " << sizeof(firstWoman) << endl;
    
    return 0;
}
