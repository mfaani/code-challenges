// https://leetcode.com/problems/climbing-stairs/

// Time Limit Exceeded
class Solution {
    var res = 0
    func climbStairs(_ n: Int) -> Int {
        helper(rem: n, jump: 1)
        helper(rem: n, jump: 2)
        return res
    }
    func helper(rem: Int, jump: Int) {
        let newRem = rem - jump 
        if newRem == 0 {
            res += 1
            return
        }
        if newRem < 0 {
            return
        } else {
            helper(rem: newRem, jump: 1)
            helper(rem: newRem, jump: 2)
        }
    }
}

struct Tuple: Hashable {
    let rem: Int
    let jump: Int
}

// LESSONS:
// MISTAKES: 
// - I initially made a mistake. i.e. with a rem == 0 I did both jumps and then increased the count. This results in double counting. 
// - I need to return otherwise I won't be able to memoize. 

// - PRO-TIP: For memoization you need to return. Can't have void functions 

// QUESTION: 
// You are climbing a staircase. It takes n steps to reach the top.

// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
