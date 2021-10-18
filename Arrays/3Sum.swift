https://leetcode.com/problems/3sum/
/*
Algo: 
for each number, get it's appropriate target value. 
for each target, get an array of acceptable values 
each time you find that array, increment, decrement the edges
ALSO increment the lower bound as long as it's identical to avoid duplicates. 
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var nums = nums.sorted()
        for i in nums.indices {
            guard nums[i] <= 0  else { return res}
            if i != 0 && nums[i] == nums[i - 1] { continue }
            let _res = twoSumSorted(nums, 0 - nums[i], i)
            for twoSum in _res {
                res.append([nums[i], twoSum[0], twoSum[1]])
            }
        }
        return res
    }
    
    func twoSumSorted(_ numbers: [Int], _ target: Int, _ startingIndex: Int) -> [[Int]] {
        var i = startingIndex + 1
        var j = numbers.endIndex - 1
        var res: [[Int]] = []
        while i < j {
            let sum = numbers[i] + numbers[j]
            if sum == target {
                let newFind = [numbers[i],numbers[j]]
                res.append(newFind)
                i += 1
                j -= 1   
                /// why `i -1`? Because we've already incremented it now, 
                while i < j && numbers[i] == numbers[ i - 1] { 
                    i += 1
                }
                // This is a bonus...
                while i < j && numbers[j] == numbers[ j + 1] { 
                    j -= 1
                }                
            } else if sum > target {
                j -= 1
            } else {
                i += 1
            }
        }
        return res
    }
}

/* LESSSONS:

If there are multiple possible answers / combinations, then you have to continue looping!
If you have multiple answers and are using a low / high bound approach then upon finding an answer, you need to update both indexes. 
 sorting 'can' help get rid of duplicates
 special cases are the edges (start, end, min, max, 0, 1, middle, rounding points)
Are you looking for all Possible values or non-duplicate values?
If non-duplicates then upon every index update, you have to adjust the index until the value is different. e.g. if you have [0,0,0,1,2,3,3,3] then you need to adjust from 0,3 straight to 1,2 and ignore the 0s,3s that are repeating...
[-5, -5, -5, -4, 0,1,2,3,4,5,10]
- 5, nums[i] -5, nums[j] 10 found. So we have to move i, j. There isn't any other possible answer. And we have to move as many as the answer changes. like -4 won't match with 10 (I mean we have to move from 10 as well). -5 and 10 both have to get incremented/decremented. 

*/

class Solutio2n {
// This solution isn't ideal because we'll find identical answers of [[0,1,-1],[1,0,-1],[-1,1,0],[1,-1,0],[-1,1,0],[-1,0,1],[0,-1,1],[-1,0,1]]
// actual some are even dups, I thought therey were rotating, but that's not true...
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else {
            return []
        }
        
        var res: [[Int]] = []
        for i in nums.indices { 
            // res.append(contentsOf:twoSum(nums, 0 - nums[i], i))
        }
                
        return res
        
    }
    
     func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var i = numbers.startIndex
        var j = numbers.endIndex - 1
        
        while i < j {
            print(i,j)
            let res = numbers[i] + numbers[j]
            if res == target {
                return [i + 1,j + 1]
            } else if res > target {
                j -= 1
            } else { 
                i += 1
            }
        }
        return []
    }
}

/* QUESTION: 
iven an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.

 

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Example 2:

Input: nums = []
Output: []
Example 3:

Input: nums = [0]
Output: []
*/
