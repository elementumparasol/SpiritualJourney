//
//  main.cpp
//  0506-逻辑非和逻辑或
//
//  Created by Enrica on 2018/4/5.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用逻辑或和逻辑非运算符来判断是否能购买梦寐以求的跑车
 */

#include <iostream>
using namespace std;

int main(void) {
    
    cout << "使用整数1或者0来回答下面的问题。" << endl;
    cout << "你喜欢的跑车今天有打折吗？: ";
    bool onDiscount = false;
    cin >> onDiscount;
    
    cout << "你获得了丰厚的奖金了吗？: ";
    bool fantasticBonus = false;
    cin >> fantasticBonus;
    
    if (onDiscount || fantasticBonus)
        cout << "恭喜，你有足够的钱买下那辆跑车！" << endl;
    else
        cout << "抱歉，你可能要等到打折，或者是拿到丰厚的奖金之后才可以买下那辆跑车。" << endl;
    
    if (!onDiscount)
        cout << "那款跑车不在打折促销之列。" << endl;
    
    return 0;
}
