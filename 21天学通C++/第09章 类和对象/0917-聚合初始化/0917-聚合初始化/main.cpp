//
//  main.cpp
//  0917-聚合初始化
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 将聚合初始化用于类
 */

#include <iostream>
#include <string>
using namespace std;

class Aggregate1 {
public:
    int num;
    double pi;
};

struct Aggregate2 {
    char hello[6];
    int impYears[3];
    string world;
};

int main(void) {
    
    int myNumbers[] = {9, 5, -1};
    Aggregate1 a1 {2018, 3.1415};
    cout << "pi is approximagely: " << a1.pi << endl;
    
    cout << endl;
    
    Aggregate2 a2 {{'H', 'e', 'l', 'l', 'o'}, {2014, 2016, 2018}, "World!"};
    Aggregate2 a2_2 {{'H', 'e', 'l', 'l', 'o', '\0'}, {2014, 2016, 2018}, "World!"};
    
    cout << a2.hello << ' ' << a2.world << endl;
    cout << "C++ standard update scheduled in: " << a2.impYears[2] << endl;
    
    return 0;
}
