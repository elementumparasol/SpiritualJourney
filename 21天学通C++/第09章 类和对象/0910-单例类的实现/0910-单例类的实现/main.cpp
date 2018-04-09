//
//  main.cpp
//  0910-单例类的实现
//
//  Created by Enrica on 2018/4/9.
//  Copyright © 2018年 Enrica. All rights reserved.
//

/**
 * 单例类，它禁止复制、赋值，以及创建多个实例
 */

#include <iostream>
#include <string>
using namespace std;

class President {
    
private:
    
    // 默认的构造函数
    President() {};
    
    // 私有的复制构造函数
    President(const President &);
    
    // 私有的赋值运算符
    const President &operator=(const President &);
    
    // 姓名
    string name;
    
public:
    static President &GetInstance() {
        
        // static对象只会被创建一次
        static President onlyInstance;
        return onlyInstance;
    }
    
    // 获取姓名
    string GetName() {
        
        return name;
    }
    
    // 设置姓名
    void SetName(string inputName) {
        name = inputName;
    }
};

int main(void) {
    
    President &onlyPresident = President::GetInstance();
    onlyPresident.SetName("Donald Trump");
    
    cout << "美国的现任总统是: " << President::GetInstance().GetName() << endl;
    
    return 0;
}
