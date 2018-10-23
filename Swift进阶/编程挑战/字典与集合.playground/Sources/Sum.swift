import Foundation

/**
 * 给出一个整数数组，以及一个目标整数，判断整数中
 * 是否存在两个整数，它们的和刚好等于目标整数的值
 */
public func twoSum(nums: [Int], _ target: Int) -> Bool {
    
    // 创建一个空的集合
    var set = Set<Int>()
    
    for num in nums {
        
        // 如果集合set中包含target与目标值
        // 之差，则说明给定的数组中存在两个整
        // 数之和等于目标值target - O(n)
        if set.contains(target - num) {
            return true
        }
        
        // 将符合要求的值保存到集合中
        set.insert(num)
    }
    
    return false
}

/**
 * 在给定的整数数组中，有且仅有两位整数之和等于目标值
 * 求这两个整数在数组中的序号
 */
public func twoSum1(nums: [Int], _ target: Int) -> [Int] {
    
    // 创建空的字典
    var dict = [Int: Int]()
    
    // 遍历数组中的元素及其在数组中对应的下标
    for (idx, num) in nums.enumerated() {
        
        if let theOtherIndex = dict[target - num] {
            return [theOtherIndex, idx]
        } else {
            dict[num] = idx
        }
    }
    
    fatalError("No valid output!")
}
