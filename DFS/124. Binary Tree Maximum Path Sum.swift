// https://leetcode.com/problems/binary-tree-maximum-path-sum/solution/

class Solution {
    var res = Int.min 
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxGain(root)
        return res
    }
    
    func maxGain(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        var left = max(maxGain(node.left), 0)
        var right = max(maxGain(node.right), 0)
        // var left = maxGain(node.left) // this in incorrect as their's never value in adding a portion where it's value is negative. Just take 0 for it instead!
        // var right = maxGain(node.right)
        var currentSum = left + right + node.val
        res = max(res, currentSum)
        return node.val + max(left, right) // let's return it so others can use this to add to their own nodes. Note that we can't return a path that goes both left and right. We can only do that for a solution on the node where we compare. 
    }
}


/* LESSON: 
If you need to do a sum of things, then usually you need to just return upon even each traversal in your tree
If you need to do a min/max thing, then you usually need to have a global variable where you update it upon each iteration.
However if you needed to do a min/max on the sum, then likely you’ll need to do both.

Pro-tip: 

Use 0 for paths with no value. 

Explanation: 
Why this works for negative an all negative nodes as well? 
It works because if you have a negative node or negative subAnswer, then it really has no value to be added. 
All that matters then is just the value of the node itself i.e. if you have [-5, -6, -8] 
then you first have an answer of -6. Set that as your max
then you have -8, but that doesn't force a change with your max. 
finally you get to -5, at this point you cancel the -6 & -8 with `max(maxGain(node.left), 0)` & ` max(maxGain(node.right), 0)` because they both return 0. 
and just then do a max between -5,-6 and then you'll answer is -5

*/
