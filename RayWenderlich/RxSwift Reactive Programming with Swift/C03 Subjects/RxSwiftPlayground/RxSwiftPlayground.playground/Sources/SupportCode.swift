import Foundation


/// 调用函数example(of: , action: )，在函数内部执行一些示例代码
///
/// - Parameters:
///   - description: 对代码片段的功能进行描述进行描述的信息
///   - action: 用于封装一段代码
public func example(of description: String, action: () -> Void) {
    
    // 输出一些描述信息
    print("\n--- Example of:", description, "---")
    
    // 闭包回调
    action()
}
