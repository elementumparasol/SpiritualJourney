/**
 功能函数
 */

import Foundation


/// 执行指定的代码块
///
/// - Parameters:
///   - description: 给代码块添加描述信息
///   - action: 需要执行的代码块
public func example(of description: String, action: () -> Void) {
    
    print("\n--- Example of:", description, "---")
    action()
}
