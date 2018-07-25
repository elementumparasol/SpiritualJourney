//
//  main.cpp
//  2-结构体的初始化
//
//  Created by Enrica on 2018/7/25.
//  Copyright © 2018 Enrica. All rights reserved.
//

#include <iostream>

// 结构体的初始化可以像普通变量一样逐步的初始化，但是，如果结构体内部变量比较多时，这种
// 方式非常的不方便。为此，我们可以考虑使用构造函数来对结构体内部的变量进行初始化。
//
// 所谓的构造函数，就是用来初始化结构体的一种函数，它直接定义在结构体内部。构造函数的一个
// 特点是，它不需要写返回类型，而且函数名与结构体名称相同。一般来说，一个普通的结构体，它
// 内部会默认生成一个不可见的构造函数(跟Swift中的结构体特点一样)


struct StudentInfo {
    
    // 学号
    int id;
    
    // 性别(F或者M)
    char gender;
    
    // 自定义构造函数
    StudentInfo(int _id, char _gender) {
        
        // 给结构体内部成员赋值
        id = _id;
        gender = _gender;
    }
};

struct Person {
    
    int age;
    double height;
    
    // 自定义构造函数(包含初始化列表的构造函数)
    Person(int _age, double _height): age(_age), height(_height) {}
};

int main(int argc, const char * argv[]) {
    
    // 创建结构实例并进行初始化
    StudentInfo stu = StudentInfo(20180704, 'M');
    
    // 使用结构体
    printf("stu.id = %d, stu.gender = %c\n", stu.id, stu.gender);
    
    Person p = Person(20, 1.72);
    printf("p.age = %d, p.height = %.2f\n", p.age, p.height);
    
    return 0;
}
