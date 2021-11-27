// https://leetcode.com/problems/trapping-rain-water/
class Solution {
    // brute force
    func trap1(_ height: [Int]) -> Int {
        var res = 0
        for (i,h) in height.enumerated() where i < height.count - 1 { 
            // max left height
            var mlh = height[0..<i].max() ?? 0
            var mrh = height[i + 1 ..< height.count].max() ?? 0
            
            var water = max(min(mlh, mrh) - h, 0)
            res += water
        }
        return res 
    }
    
    // loop once from left and get max element before an element
    // loop once from right and get max element after an element
    // loop again with diff of `min` and height
    func trap2(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var lMax: [Int] = []
        var rMax: [Int] = []
        var res = 0        
        for i in 0 ..< height.count {
            lMax.append(max(lMax.last ?? 0, height[i]))
        }
        for i in (0..<height.count).reversed() {
            rMax.append(max(rMax.last ?? 0, height[i]))
        }        
        rMax.reverse()
        for i in 1..<height.count - 1 {
            res += max(min(lMax[i - 1], rMax[i + 1]) - height[i], 0)
        }
        
        return res
    }
}

/* 
Trap1:
Pro-tip: Try to solve the problem for a small one first. Admittingly after learning of the trick the answer is simple...
With these height kinda of problems, **usually the min/max height are important. Often min/max to your left vs. to your right.**

Trap2: 
MISTAKE: 
- didn't get rid of error cases i.e. where there is less than 3 elements 
- Needing to loop in reverse is different from having your data structure actually in reverse. Here we didn't need to create the rMax in reverse. 
- So I ended up reversing the end result. Which kind of makes me thinkt that perhaps reversing it wasn't the best solution
- `reverse` is _mutating_. `reversed` in _returning_!
- The more arrays you create the more there's a chance that their counts may not match. Be careful 


Question
Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.

Tags:

DP
Height
Water
min/max

*/
