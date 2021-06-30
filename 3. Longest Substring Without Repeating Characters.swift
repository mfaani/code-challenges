// 844 ms, faster than 13.13% of Swift online submissions for Longest Substring Without Repeating Characters.
// Memory Usage: 14.9 MB, less than 36.72% 

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s != "" else { return 0 }
        // exceptions: "" should return 0        
        // brute force
        
        var dict: [Character: Int] = [:]
        var strings: [Character] = []
        
        for char in s {
            strings.append(char) 
        }
        
        var res = 0
        for i in 0..<strings.count {
            // 1. for every iteration, create a set and check that set upon every increment...
            var s = Set<Character>()
            var current = strings[i]
            var max = 0
            for j in i..<strings.count {
                defer {
                    s.insert(strings[j])
                }
                if s.contains(strings[j]) == false {                    
                    max += 1
                    if max > res {
                        res = max
                    }
                } else {
                    break   
                }                
            }
        }
        return res
    }
}

// the checking last index won't work, because we might have a longer substring that uses the character at that later index...

// don't go with a simple test case. Go with the most simplest test case ever. like only 1 or 2 characters. 
// don't think of of 4-5 as simple. That's complex :D

// ------------------------
class SolutionNotWorking {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // exceptions: "" should return 0        
        // brute force
        
        // loop through for each character that we find store in dic with an index of its last found character. i.e. keep updating it. 
        
        // then loop again, as long as the value isn't found in the current, then we add and so on
        
        var dict: [Character: Int] = [:]
        var strings: [Character] = []
        
        for char in s {
            strings.append(char) 
        }
        // set last index
        for i in 0..<strings.count {
            dict[strings[i]] = i
        }
        var res = 0
        for i in 0..<strings.count {
            var current = strings[i]
            var max = 1
            for j in i..<strings.count {
                if dict[strings[j]] == j {                    
                    max += 1
                    if max > res {
                        res = max
                    }
                }
                break
            }
        }
    }
}

// the checking last index won't work, because we might have a longer substring that uses the character at that later index...

// so I suppose the expansion along with a currentSet is the way to go for it...
