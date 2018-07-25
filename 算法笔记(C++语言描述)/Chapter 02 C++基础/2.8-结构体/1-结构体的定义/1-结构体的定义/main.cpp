//
//  main.cpp
//  1-结构体的定义
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

// 结构体的应用比较广泛，它可以将很多不同数据类型的变量或者数组封装在一起组合使用。
// 结构体里面除了不能定义自己本身之外，可以定义任何数据类型(如果在结构体内部定义自
// 己本身，那么就会引起循环定义)。不过，虽然不能在里面定义自己本身，但是可以定义自
// 身类型的指针(比如说链表的结点)

struct studentInfo {
    
    // 学号
    int id;
    
    // 性别
    char gender;  // 'F'或者'M'
    
    // 姓名
    char name[20];
    
    // 主修科目
    char major[20];
} Alice, Bob, stu[200];

struct node {
    
    // 结点的数据域
    int data;  // 这里不能使用 node data; 因为结构体内部不能定义自身，只能定义自身类型的指针
    
    // 结点的指针域
    node * next;
};

int main(int argc, const char * argv[]) {
    // insert code here...
    std::cout << "Hello, World!\n";
    return 0;
}
