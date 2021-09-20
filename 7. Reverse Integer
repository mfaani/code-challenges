// https://leetcode.com/problems/reverse-integer/

// https://leetcode.com/problems/reverse-integer/

// NON WORKING Solution
class Solution {
    func reverse(_ x: Int) -> Int {
        /*
        - reverse it using the count 
        - if the count equals to Int.max or Int.min
        - checks: upon every operation 
            - multiplication
            - addition
        make sure the number doesn't exceed. If it does then return 0 
        */
        
        var res = 0
        let max = (1...31).reduce(1) { initial, _ in initial * 2} - 1
        let lastMaxDigit = max % 10
        let min = (1...31).reduce(1) { initial, _ in initial * 2} * (-1)
        let lastMinDigit = min % 10
        
        var x = x
        while x != 0 {
            
            let last = x % 10
            x = x / 10        
            
            if res > max / 10 || (res == max / 10 && last > lastMaxDigit) { 
                return 0
            } else if res < min / 10 || (res == min / 10 && last < lastMinDigit) { 
                return 0
            } else { 
                res = res * 10 + last
            }
        }
        return res        
    }
}

// LESSONS LEARNED:
// BE AWARE OF SIDE AFFECTS OF YOUR OWN ALTERATIONS!
// sometimes it's easier to exit early for the bad cases then to just keep going in for the easy cases. 
// ALWAYS TRY TO get to a clean working state, then continue!
// Always test your negating stuff. Positive vs. negative
// DonMultiplying by 10 and then comparing to min max, is different from seeing if you can even multiply by 10 or not. 
// Basically when you have a **min max**, **every single operation** that happens is to be governed by that min/max...
// Predict vs. do: If you know there's a possibility of overflowing, then you can do a pre-check
// e.g. if I'm already bigger than Int.max / 10 then the next multiplication will cause an overflow
// sometimes because you must break operations. Sometimes you must group them. e.g. here, we should combine the place where we do add and multiply!


// NON WORKING Solution
class NonWorkingSolution {
    func reverse(_ x: Int) -> Int {
        /*
        - reverse it using the count 
        - if the count equals to Int.max or Int.min then upon each entry, make sure the number doesn't exceed. If it does then return 0 
        var isPositive = x < 0 ? false : true
        */
        var res = 0
        let max = (1...31).reduce(1) { initial, _ in initial * 2} - 1
        let min = (1...31).reduce(1) { initial, _ in initial * 2} - 1
        
        var x = x
        while x != 0 {
            defer { print(res)}
            let new = x % 10  // 3 2 1
            x = x / 10 // 12 1 0 
            
            res = res * 10 // 0 30 320
            // positive
            if x >= 0 {  // BE AWARE OF SIDE AFFECTS OF YOUR OWN ALTERATIONS!
                // Always test your negating stuff. Positive vs. negative
                if x <=  max - res {
                    // print("A")
                    res += new    // 3 32 321
                } else {
                    // print("B")
                    res = 0
                }
                
            } else {    
                if x <= min - res {
                    // print("C")
                    res += new
                } else {
                    // print(res, "D")
                    res = 0
                }
            }
        }
        // print(res)
        return res        
    }
}

// LESSONS LEARNED
// BE AWARE OF SIDE AFFECTS OF YOUR OWN ALTERATIONS!
// Always test your negating stuff. Positive vs. negative
// DonMultiplying by 10 and then comparing to min max, is different from seeing if you can even multiply by 10 or not. 
// Basically when you have a **min max**, **every single operation** that happens is to be governed by that min/max...
// Predict vs. do: If you know there's a possibility of overflowing, then you can do a pre-check
// e.g. if I'm already bigger than Int.max / 10 then the next multiplication will cause an overflow
