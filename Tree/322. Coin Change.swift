// https://leetcode.com/problems/coin-change/
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        func helper( _ remainder: Int) -> Int {
            if remainder < 0 { return -1 } // stops going down
            if remainder == 0 { return 0 } // stops going down
            
            var minCount = Int.max
            for coin in coins {
                let sub = helper(remainder - coin)
                if sub == -1 { continue }
                minCount = min(minCount, sub + 1) // updates value for that level
            }
            return minCount == Int.max ? -1 : minCount // backtracks
        }
        
        return helper(amount)
    }
}

// for 3 fives, the 3rd time, it doesn't need to recurse any more.
// only for the first return sub is 0
// after that sub is 1, and then 2 and so on...until the remainder is the remainder is 0.
// the trick is the answer that we return for each next level of the calls is simply adjusted by 1

// There are two paths that you go. Down and then up.
// when going down you try to find something that reaches a remainder of 0 or -1 (to exit)
// you obviously do a min across ALL loops that returned a value that's not `-1`. So basically after going down to zero and coming back up, you
// when backtracking, you just increment by 1 until all the recursion calls are finished.
// my base case just stops the recurstion.

/* Question: 
You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

You may assume that you have an infinite number of each kind of coin.

 */
