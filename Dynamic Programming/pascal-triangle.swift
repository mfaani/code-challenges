// https://leetcode.com/problems/pascals-triangle

class Solution {
    var cache: [Int: [[Int]]] = [:]
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 {
            return [[1]]
        }
        if numRows == 1 {
            return [[1], [1,1]]
        }
        if let cached = cache[numRows] {
            return cached
        }
                
        var newRow: [Int] = []
        newRow.append(1)
        let previous = generate(numRows - 1).last!
        let count = previous.count
        for i in 0...count - 1 {
            // just loop while the right is within the bounds
            let r = i + 1
            if r < count {
                newRow.append(previous[i] + previous[r])
            }
        }     
        newRow.append(1)
        
        let res = generate(numRows - 1) + [newRow]
        cache[numRows] = res
        
        return res
    }
}

// Only note was to not make mistakes with appending arrays. 
