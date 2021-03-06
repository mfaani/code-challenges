// https://leetcode.com/problems/climbing-stairs/

class Solution {
    var res = 0
    func climbStairs(_ n: Int) -> Int {
        traverseBiggerAndBigger(n, 0)
    }
    var cache: [Int: Int] = [:]
    func traverseBiggerAndBigger(_ n: Int, _ currentStep: Int) -> Int {
        if currentStep > n {
            return 0
        }
        if currentStep == n {
            return 1
        }
        // if you can compute without recursion then just go for it. No need to look into the memo table
        if let cached = cache[currentStep] {
            return cached
        }
        let res = traverseBiggerAndBigger(n, currentStep + 1) + traverseBiggerAndBigger(n, currentStep + 2) 
        cache[currentStep] = res
        
        return res
    }
}



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

/* LESSONS:
MISTAKES: 
- I initially made a mistake. i.e. with a rem == 0 I did both jumps and then increased the count. This results in double counting. 
- I need to return otherwise I won't be able to memoize. 
- You must almost never want to just return a `Bool` for if a path exists. 9/10 a path does exist. 
- It's more about the number of paths that exist or the length of that path. So ditch the boolean approach
- I needed hashable. But then I needed it to be against the tuple. However `n` was constant. 
- So I should have moved that out of consideration. i.e. no need to make a `struct`

                                    - GOD-TIP: **Think of every node as a combination of steps!**

- RESOURCE: https://youtu.be/Y0lT9Fck7qI?t=818

- BOTTOM-UP Approach: assume n = 5
- Start from last step n = 5. You have 1 way to reach destination. That 1 way is not moving. It's not 0, because you're at the destination and that counts.
- It's only 0 if you're beyond n = 5
- Then come back one step at n = 4. You have 1 way to reach n = 5
- n = 3. From there on you can jump 1 step or 2 steps hence the answer is dp[4] + dp[5]. 
- Basically when you're doing bottom-up, you first find out the answer of last index.
- ultimate answer: dp[i] = dp[i - 1] + dp[i - 2]


- PRO-TIP: For memoization you need to return. Can't have void functions 
- PRO-TIP: How to read from your memoization table: Don't try reading. Try seeing if you can just return or exit or something. 
Towards the very end you should look into the cache. And at the end inject into your cache. 
- SMART: find all answers. Treat each find as a +1 and every other moment where you go beyont as `0`. No need for `-1` or anything....

QUESTION: 
You are climbing a staircase. It takes n steps to reach the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
