// https://leetcode.com/problems/two-sum/
class Solution {
    // [2,7]
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
       
        // [7: 0, 2: 1]
        for i in 0..<nums.count {
            dict[target - nums[i]] = i  
        }
        
        // 
        for i in 0..<nums.count {
            if let tup = dict[nums[i]] {
                if tup == i {
                    continue
                } 
                return [i,tup]
            }
        }
        fatalError()
    }
}


/* TIPS:
- write down exceptions to check later immediately off the question: example same index exception for this question
- create smallest tesing example to get this right...e.g. [2,7]

*/
