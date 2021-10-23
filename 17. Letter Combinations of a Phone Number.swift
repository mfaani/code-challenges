

class Solution {
    var combinations: [String] = []
    let dict: [String.Element: [String.Element]] = ["2" : ["a","b", "c"], "3": ["d", "e", "f"], "4": ["g", "h", "i"], "5": ["j", "k","l"], "6": ["m", "n", "o"], "7": ["p", "q", "r", "s"], "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"]]
    
    func letterCombinations(_ digits: String) -> [String] {
        guard let _ = Int(digits) else { return [] }
        
        let digs = Array(digits)
        if digs.count == 0 { return combinations }
        backtrack(0, "",digs)
        return combinations
        
    }
    func backtrack(_ index: Int, _ str: String, _ digs: [String.Element]) {
        // base case
        if str.count == digs.count {
            combinations.append(str)
            return
        }
        
        for letter in dict[digs[index]]! {
            let s = "\(str)\(letter)"
            backtrack(index + 1, s, digs)
        }
    }
}

    

// LESSONS: don't be clever with CharacterSet. CharacterSet is great if you can use it super readily
// Otherwise just create your own. 
// PRO tip, create a string and then just convert it to an array — instead of adding double quotes 26 times 
// AGAIN read the question correctly. example 7, 9 have **4** letters!
// KEYWORD: 'Constraints'. With constrained examples: brute force or clever hacks are welcomed I suppose: 

// INTERESTING: I can either have 4 loops OR do a generic backtracking model 
    
// BRUTE Force
// for each number, start a loop and for each other number do another loop and keep attaching till you find an answer. O(digits * number of values)
                   
// Nicer solution: for ever two digits I combine them together and then combine once again: 

    




/* Question: 

Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

*/
