//
//  main.cpp
//  0403-访问多维数组中的元素
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 定义一个多维数组，然后访问它里面的元素
 */

#include <iostream>
using namespace std;

int main(void) {
    
    // 声明并初始化一个二维数组。这是一个int[3]型的数组，并且
    // 由于所有的元素都被初始化了，所以前面中括号中的数字可以省
    // 略。不过，最后面一个中括号中的数字却不可以省略。
    int threeRowsThreeColumns[][3] = {
        {-501, 205, 2016},
        {989, 101, 206},
        {303, 456, 596}
    };
    
    // 输出第0行的所有元素
    cout << "第0行: " << threeRowsThreeColumns[0][0] << " "
    << threeRowsThreeColumns[0][1] << " "
    << threeRowsThreeColumns[0][2] << endl;
    
    // 输出第1行的所有元素
    cout << "第1行: " << threeRowsThreeColumns[1][0] << " "
    << threeRowsThreeColumns[1][1] << " " \
    << threeRowsThreeColumns[1][2] << endl;
    
    // 输出第2行的所有元素
    cout << "第2行: " << threeRowsThreeColumns[2][0] << " "
    << threeRowsThreeColumns[2][1] << " "
    << threeRowsThreeColumns[2][2] << endl;
    
    return 0;
}
