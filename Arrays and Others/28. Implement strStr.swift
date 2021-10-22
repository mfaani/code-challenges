// https://leetcode.com/problems/implement-strstr/submissions/
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle != "" else { return 0 }
                
        let chars = Array(haystack)
        let needs = Array(needle)
        
        for i in chars.indices where chars.count - i >= needs.count {
            var didFind = false
            var matchingNumChar = 0
            var startI = i
            for j in needs.indices where i + matchingNumChar < chars.count { 
                if needs[j] == chars[i + matchingNumChar] { 
                    didFind = true
                    matchingNumChar += 1
                } else {
                    didFind = false
                    break
                }
            }
            if didFind == true { 
                return startI
            }
        }
        return -1
    }
}



// LESSONS: For Comparisons: Always make sure you you're on the SAME Length!!!!!!


/* QUESTION

Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.


*/
