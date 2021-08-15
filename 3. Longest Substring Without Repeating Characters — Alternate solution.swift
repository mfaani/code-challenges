// Runtime: 44 ms, faster than 65.88% of Swift online submissions for Longest Substring Without Repeating Characters.
// Memory Usage: 14.8 MB, less than 28.45% of Swift online submissions for Longest Substring Without Repeating Characters.

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s != "" else { return 0 }
        // exceptions: "" should return 0        
        // brute force
        
        // var dict: [Character: Int] = [:]
        var strings: [Character] = []
        
        for char in s {
            strings.append(char) 
        }
        
        var res = 0
        var i = 0
        // The sliding window doesn't start from 0...length, it's from 0...0 and then it gets expanded...
        var dict: [Character: Int] = [:]
        
        // as we loop, I want to see if we've seen the value at the jth index before. 
        // if not we'll increase our length
        
        for j in 0..<strings.count { 
            if dict[strings[j]] == nil {
                res = max(j - i + 1, res)                
                dict[strings[j]] = j // add the value
            } else if let lastJ = dict[strings[j]] { 
                
                dict[strings[j]] = j // add the value
                i = max(lastJ + 1, i) // have to exclude the previous item that makes our current string repeating
                res = max(j - i + 1, res)                
            }
        }
        
        /*
        res = (1, 0)
        dict = [([p,0])]
        res = (2, 1)
        dict = [(p,0), (w,1)]
        dict = [(p,0), (w,2)]
        
        dvdf
        res = (1,0) // 1
        dict = [(d,0)]
        res = (2,1) // 2
        dict = [(d,0), (v,1)]
        
        dict = [(d,0), (v,2)]
        i = 2
        
        
        
        */
        
        return res
    }
}

/* the checking last index won't work, because we might have a longer substring that uses the character at that later index...

- don't go with a simple test case. Go with the most simplest test case ever. like only 1 or 2 characters. 
- don't think of of 4-5 as simple. That's complex :D


- LESSONS: 
// update counting index in dic
// move counting dic
// either you need to calc result in every block or at the end. Otherwise there'd be a case/block that the result doesn't get updated...

*/
