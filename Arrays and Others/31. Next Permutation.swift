// https://leetcode.com/problems/next-permutation/submissions/
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        // start from last
        // find any number that is smaller than it's predecessor
        // then try to find the smallest number that's bigger than that pivot number...
        // I looped from that number to Int.max to find the smallestBigger
        // sort all the number to its right...
        var breakingIndex: Int? 
        if nums.count < 2 {        
            
        } else { 
            var shouldBreak = false
            for i in (1..<nums.count).reversed() {
                if shouldBreak {
                    break
                }
                if nums[i - 1] < nums[i] {
                    if shouldBreak {
                        break
                    }

                    let lowestBiggerNumber = nums[i - 1] + 1
                    for k in lowestBiggerNumber...Int.max {
                        if shouldBreak {
                            break
                        }
                        for j in (i - 1)..<nums.count { 
                            if k == nums[j] {
                                nums.swapAt(j, i - 1)
                                breakingIndex = i - 1
                                shouldBreak = true
                                break
                            }   
                        }    
                    }                    
                }
            }
            // need to find highest number to the right side of [i - 1] and swap with that. 
            
            if let j = breakingIndex, j + 2 <= nums.count { 
                nums[(j + 1)..<nums.count].sort()
            } else {
                nums.reverse()
            }
        } 
    }
}

/*
When reading the question, also look at the function signature. 
Example here I thought I needed to return something, but that wasn't needed. 

### Technical: 
- `reveresed()` will return while `reverse` will mutate. Choose the correct one. It's more difficult if you expect it to mutate and it doesn't...
- you can sort a range from within the array. 
- add a bool to break from outer loops if needed. 

**PROTIP** You have to use the logic of checking if an array is sorted. — you do that by comparing each two neighboring numbers... You don't need to compare non-neighboring ones...
**MISTAKE** I made: You have to find an element that degrades that breaks the order, but then you shouldn't necessarily swap it with its neighbors. Instead swap it the ~lowest~ that you skimmed through...ACTUALLY swap it with any lowest number that's also greater than nums[j]
TIP: Examples can be misleading...

QUESTION:
Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).
The replacement must be in place and use only constant extra memory.

*/
