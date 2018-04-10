//
//  main.cpp
//  1010-多继承
//
//  Created by Enrica on 2018/4/10.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 使用多继承模拟具备哺乳动物、鸟类和爬行动物特征的鸭嘴兽
 */

#include <iostream>
using namespace std;

// 哺乳动物
class Mammal {
    
public:
    void FeedBabyMilk() {
        cout << "哺乳动物会给幼崽喂奶。" << endl;
    }
};

// 爬行动物
class Reptile {
    
public:
    void SpitVenom() {
        cout << "爬行动物唾液中一般都含有毒液。" << endl;
    }
};

// 鸟类
class Bird {
    
public:
    void LayEggs() {
        cout << "鸟类都会通过产卵来繁育后代。" << endl;
    }
};

// 鸭嘴兽(鸭嘴兽已经不能再被继承了，因此可以用关键字final来限制其被继承的可能性)
class Platypus final: public Mammal, public Reptile, public Bird {
    
public:
    void Swim() {
        cout << "鸭嘴兽可以像鸭子一样在水里游泳。" << endl;
    }
};

int main(void) {
    
    Platypus realFreak;
    
    // 从父类中继承下来的各种行为
    realFreak.LayEggs();  // 产卵
    realFreak.FeedBabyMilk();  // 用母乳哺育后代
    realFreak.SpitVenom();  // 唾液中可以分密毒液
    realFreak.Swim();  // 像鸭子一样在水里游泳
    
    return 0;
}

