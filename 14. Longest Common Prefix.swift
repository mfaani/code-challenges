// https://leetcode.com/problems/longest-common-prefix/

class Solution {
    func longestCommonPrefix2(_ strs: [String]) -> String {
        // MY WAY BRUTE FORCE. But this is
        // just use the first string.
        // for each character , try other strings
        // if its length goes beyond then stop
        // O(n) * string length which is 
      

        // HORIZONTAL SCANNING
        // set the prefix to the 1st item.
        // Compare prefix with the next string and adjust the prefix. 
        // stop if prefix isn't common or end of loop is reached. 
        
        var res = strs.first!
        // Loop all strings. Ajust the prefix as you loop. Exit if no identical prefix. 
        for i in 1..<strs.count {
            print(res)
            guard res != "" else {
                return ""
            }
            var temp = ""
            for j in 0..<res.count where j < strs[i].count {
                let currentCharFromPrefix = res[res.index(res.startIndex, offsetBy: j)]
                if currentCharFromPrefix == strs[i][strs[i].index(strs[i].startIndex, offsetBy: j)] {
                    temp.append(currentCharFromPrefix)
                } else { 
                    res = temp
                    break
                }
            }
            if temp == "" {
                print("oops")
                return ""
            } else {
                res = temp
            }
        }
        return res
    }
    
    // VERTICAL 
    func longestCommonPrefix(_ strs: [String]) -> String {
        /* 
        Loop over first string. 
        For each just go through first character, and then 2nd and so on. 
            
        
        */
        ["a", "b"]
        let base = strs.first!
        for i in 0..<base.count { 
            let c = base.at(i)
            for j in 1..<strs.count { 
                if c != strs[j].safeAt(i) {
                    let endIndex = base.index(base.startIndex, offsetBy: i)
                    return String(base[base.startIndex..<endIndex])
                }
            }              
        }
        return base
    }
}

extension String { 
    func at(_ i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    func safeAt(_ i: Int) -> Character? {
        guard i < count  else { return nil }
        return at(i)
    }
}


    
    
/* LESSONS LEARNED: 
    
- Don't miss i,j indexes...
- Whiles are tricky. You make mistakes with them...Make sure your loops exit!
- TEST your code with the most SIMPLEST OF tests + maybe a super dumb edge case of 0 or negative or repeating or bad characters... TEST!!!!

- Can easily subscript strings using: str[str.index(str.startInde, offsetBy: 3)]
- Also can do: 

let emojiText = "?launcher"
let endIndex = emojiText.index(emojiText.startIndex, offsetBy: 2)
let range: Range<String.Index> = emojiText.startIndex..<endIndex
emojiText[range]

*/


