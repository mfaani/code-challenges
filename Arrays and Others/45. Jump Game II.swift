// https://leetcode.com/problems/jump-game-ii/
class Solution { 
    var count = 0
    func jump(_ nums: [Int]) -> Int {
        // while we have indexes to jumpt or last index isn't reached:
        // for each index, add its l,r right. 
        // from l to r, keep updating the r.
        // then update l as well. 
        // if r is beyong count then stop
        
        var indexes: Set<Int> = [0]   
        guard nums.count != 1 else { return 0}
        if nums[0] >= nums.count - 1 {
            return 1
        }
        while indexes.isEmpty == false { 
            count += 1            
            var curIndexes = indexes
            indexes = []
            for index in curIndexes {

                if nums[index] == 0 { continue }
                for jump in 1...nums[index] {
                    if index + jump >= nums.count - 1 {
                        return count
                    }
                    indexes.insert(index + jump)    
                }                
            }
        }
        return count
    }
}
// WRITE Down index values — while solely focusing on the line you're working on. Not the next line. 
// like perhaps even add space to make you not see the next line. Seeing the next line can be deceiving as your mind is expecting it to work...
// **MISTAKE** When you come up with ranges, be aware of not creating a range where the upper bounds becomes smaller than lower bounds
// **MISTAKE** When you you're dealing doing math operations on their indexes and value at index, be careful. Try small index big value with small array size e.g. [100, 3, 58]
// **MISTAKE** break vs continue. Make sure you don't break if you don't want to
// **PROTIP** Not all the edge cases are mentioned. You should ASK your interviewer or be considerate yourself.
// ALSO NOT EVERY edgecase you think is an edgecase in their way of solving :D 



class Solution2 {
    var res = Int.max
    func jump(_ nums: [Int]) -> Int {
        // brute force: 
        // jump starting the max down to 1. for each jump start from max again till you get to a numbe greater than the count. 
        // stop when you go passed your min        
        var count = 0
        func jumpWithMax(_ index: Int, _ steps: Int) {
            if index >= nums.count - 1 {
                res = min(res, steps)
                return
            }
            
            // print(index, nums.count, nums.count - 1 - index)
            guard nums[index] >= 1 else { return }
            for i in (1...nums[index]).reversed() {
                jumpWithMax(index + i, steps + 1)    
            }            
        }
        
        jumpWithMax(0, 0)
        return res
    }
}

/* QUESTION
Given an array of non-negative integers nums, you are initially positioned at the first index of the array.

Each element in the array represents your maximum jump length at that position.

Your goal is to reach the last index in the minimum number of jumps.

You can assume that you can always reach the last index.
*/
