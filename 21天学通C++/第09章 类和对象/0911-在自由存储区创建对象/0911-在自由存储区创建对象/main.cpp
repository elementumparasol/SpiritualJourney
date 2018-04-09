//
//  main.cpp
//  0911-在自由存储区创建对象
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

#include <iostream>
using namespace std;

class MonsterDB {
    
private:
    
    // 将析构函数设置为私有的，以阻止在栈上面创建实例
    ~MonsterDB() {};
    
public:
    
    // 因为析构函数被设置为私有的，因此按照常规的方式，无法通过delete
    // 来释放内存空间。但是，如果不释放内存空间，又将会导致内存泄漏。为
    // 此，必须提供一个可以调用析构函数的静态公有函数，以便能够销毁实例
    static void DestroyInstance(MonsterDB *pInstance) {
        
        // 销毁MonsterDB实例对象
        delete pInstance;
    }
    
    void DoSomething() {
        
        cout << "MonsterDB实例对象。" << endl;
    };
};

int main(void) {
    
    // 在堆上面创建实例
    MonsterDB *myDB = new MonsterDB();
    myDB -> DoSomething();
    
    // 释放内存空间(将实例对象作为参数传递进去，以便销毁)
    MonsterDB::DestroyInstance(myDB);  // 因为析构函数是私有的，因此此时无法通过: delete myDB来释放内存
    
    return 0;
}
