//
//  main.cpp
//  0604-if-else-if结构
//
//  Created by Enrica on 2018/4/6.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用多组if-else-if结构
 */

#include <iostream>
using namespace std;

int main(void) {
    
    enum DaysOfWeek {
        Sunday = 0,
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday
    };
    
    cout << "查看一周中每一天是以什么命名的。" << endl;
    cout << "输入一个整数来代表一周中的某一天(Sunday = 0): ";
    
    int dayInput = Sunday;
    cin >> dayInput;
    
    if (dayInput == Sunday) {
        cout << "星期日是以太阳(Sun)命名的." << endl;
    }
    
    else if (dayInput == Monday) {
        cout << "星期一是以月亮(Moon)命名的." << endl;
    }
    
    else if (dayInput == Tuesday) {
        cout << "星期二是以火星(Mars)命名的." << endl;
    }
    
    else if (dayInput == Wednesday) {
        cout << "星期三是以水星(Mercury)命名的." << endl;
    }
    
    else if (dayInput == Thursday) {
        cout << "星期三是以木星(Jupiter)命名的." << endl;
    }
    
    else if (dayInput == Friday) {
        cout << "星期五是以金星(Venus)命名的." << endl;
    }
    
    else if (dayInput == Saturday) {
        cout << "星期六是以土星(Saturn)命名的." << endl;
    }
    
    else {
        cout << "输入错误，请重新输入0~6的整数!" << endl;
    }
    
    return 0;
}
