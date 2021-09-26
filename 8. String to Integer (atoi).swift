// https://leetcode.com/problems/string-to-integer-atoi/

class Solution {
    func myAtoi(_ s: String) -> Int {
        /* 
        1. Ignore white space --- each loop ---- DONE
        2. Decide sign (positive or negative) --- early --- DONE
        3. Ends: ignore anything after non-digit or end --- each + End
        4a. Omit early 0s.  --- early
        4b. If no integrs were read, then return 0 --- each + End
        5. Clamp positive and negative integers to their bound --- each 
        6. return Int
        
        Note: tab isn't white space        
        */        
        var res = 0        
        var chars: [Character] = []
        var didFindChar = false
        var sign = 1
        for c in s {
            if didFindChar == false && c != " " { 
                didFindChar = true
            }
            if didFindChar {
                chars.append(c)    
            }
        }
        if chars.first == "-" {
            sign = -1
        }
        
        // we have trimmed all the initial white spaces. 
        let max = (1...31).reduce(1) { initial, _ in initial * 2} - 1
        let min = (1...31).reduce(1) { initial, _ in initial * 2} * (-1)
        print(chars)
        for i in 0..<chars.count {
            if i == 0 {
                if let num = chars[i].wholeNumberValue {
                    res = num
                } else if chars[i] == "+" {
                    
                } else if chars[i] == "-" {
                    
                } else { 
                    return 0
                }
                // allow digit, +, -, else return 0        
            } else if let num = chars[i].wholeNumberValue {
                res = res * 10 + num
                if sign != -1 && res > max {
                   return max
                
                } else if sign == -1 && res * -1 < min {
                    return min
                }
                
                // if not digit:  wrap it up. 
                // if digit, then add if possible. 
            } else {
                break
            }
        }
        if sign == -1 {
            res = res * -1
        }   
        return res
    }
}

/* LESSONS LEARNED
  - positive vs. negative is tricky!
  - use `wholeNumberValue` for Char to Int conversion. 
  - write down what steps need to be considered and WHEN (beginning, upon giving result, during each loop)
*/
