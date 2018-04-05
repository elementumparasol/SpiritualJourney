//
//  main.cpp
//  0309-使用枚举常量来显示基本方位
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用枚举常量来显示基本的方位
 */

#include <iostream>
using namespace std;

/**
 * 定义一个枚举常量，用来显示方位
 */
enum CardinalDirections {
    North = 25,
    South,
    East,
    West
};

int main(void) {
    
    cout << "显示基本的方位，以及这些方位所代表的实际值:" << endl;
    cout << "North: " << North << endl;
    cout << "South: " << South << endl;
    cout << "East: " << East << endl;
    cout << "West: " << West << endl;
    
    return 0;
}

/**
 * 在很多情况下，变量只能取某些特定的值，比如说，在星期里面不能出现"星期八"，
 * 在表示方位的指南针中不能出现"左"或者"右"。为此，我们需要定义一些这样的变
 * 量，即它所包含的可能值应该是由我们自己指定的。为此，我们可以使用关键字enum
 * 来声明一个枚举。枚举通常都是由一组成为枚举量的常量组成。
 *
 * 一旦使用枚举来指定变量的类型时，那么这个变量就只能取指定的值。通常情况下，
 * 编译器会将枚举量转换为整数，并且每个枚举量都会比前一个大1。你还可以指定枚举
 * 量的起始值，如果没有指定，编译器会默认枚举量的起始值为0。当然，如果你乐意，
 * 还可以显式的给枚举量一个起始值。比如说像上面这样，我们给这个枚举量设置的起始
 * 值为25，然后起始值后面的枚举量在此基础上加1。
 */
