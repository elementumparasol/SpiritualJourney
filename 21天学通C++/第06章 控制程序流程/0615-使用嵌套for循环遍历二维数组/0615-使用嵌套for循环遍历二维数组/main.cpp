//
//  main.cpp
//  0615-使用嵌套for循环遍历二维数组
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用嵌套for循环遍历二维数组中的元素
 */

#include <iostream>
using namespace std;

int main(void) {
    
    const int NUM_ROWS = 3;
    const int NUM_COLUMNS = 4;
    
    // 声明并初始化一个3行4列的二维数组
    int myArray[NUM_ROWS][NUM_COLUMNS] = {
        {34, -1, 879, 22},
        {24, 365, -101, -1},
        {-20, 40, 90, 97}
    };
    
    // 先遍历每一行
    for (int row = 0; row < NUM_ROWS; row++) {
        
        // 再来遍历每一列
        for (int column = 0; column < NUM_COLUMNS; column++) {
            
            // 最后再输出二维数组中的所有元素
            cout << "myArray[" << row << "][" << column << "] = ";
            cout << myArray[row][column] << endl;
        }
    }
    
    return 0;
}
