// https://leetcode.com/problems/container-with-most-water/
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        
        // brute force solution: 
        // for each element, do loop through, multiply the diff of index by min height of the 2 indexes. 
        // keep adjust the max...
        
        
        // FLOW
        // start from beginning and end
        // move the the index with lower value in the hope of gaining more area
        // UPDATE Max on every loop 
        
        // do this until i & j are same. 
        
        var i = 0
        var j = height.count - 1
        var res = 0
        
        while i != j && i < j  {
            res = max(res, min(height[i], height[j]) * (j - i))
            
            if height[i] <= height[j] {
                i += 1
            } else { 
                j -= 1
            }
        }
        
        return res
    }
}

// LESSSONS LEARNED: 

// for min/max on an array, you can move the **limiting factor**
// for mathematic operations just use parenthesis to avoid mistakes. Math causes mistakes. 
