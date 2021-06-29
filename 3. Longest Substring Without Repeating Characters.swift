class Solution {
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
