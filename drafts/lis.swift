// https://leetcode.com/problems/longest-increasing-subsequence/submissions/
class Solution {
    // [0,1,0,3,2,3]
    // 
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp: [Int] = Array(repeating: 1, count: nums.count)
        
        // SolutionA: https://www.youtube.com/watch?v=cjWnW0hdF1Y
        // Loop backwards, we need to compare with the 'next' item. 
        // and then update the `dp` value — only if next value is higher. 
        
        // for i in (0...nums.count - 1).reversed() {
        //     for j in i...nums.count - 1 {
        //         if nums[j] > nums[i] {
        //             dp[i] = max(dp[i], dp[j] + 1)
        //         }
        //     }
        // }
        
        
        // SolutionB: Loop forward. https://www.youtube.com/watch?v=CE2b_-XfVDk
        // compare every item to i-th item.
        // you only use the value from the `dp` array — if the i-th value is bigger.
        // [3,4,-1,0,6,2,3]
        // [1,2,1,2,3,3,4]
        for i in 0...nums.count - 1 {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return dp.max()!
    }
}

// [0,1,5, 2]
// The decision isn't about trying all 4 items. 
// It's more about starting from all 4 indexes. 

// if we start at index 0, the item would 0. We then have 3 
// if we start at index 1, the item would 1
// if we start at index 2, the item would 5
// if we start at index 3, the item would 2
