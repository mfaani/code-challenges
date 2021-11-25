// https://leetcode.com/problems/trapping-rain-water/
class Solution {
    // brute force
    func trap(_ height: [Int]) -> Int {
        var res = 0
        for (i,h) in height.enumerated() where i < height.count - 1 { 
            // max left height
            var mlh = height[0..<i].max() ?? 0
            var mrh = height[i + 1 ..< height.count].max() ?? 0
            
            var water = max(min(mlh, mrh) - h, 0)
            res += water
        }
        return res 
    }
}

/* 
Pro-tip: Try to solve the problem for a small one first. Admittingly after learning of the trick the answer is simple...
With these height kinda of problems, **usually the min/max height are important. Often min/max to your left vs. to your right.**

Question
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

Tags:

DP
Height
Water

*/
