# Technical
## Big O (Pg. 43)
- time complexity
- space complexity: it's about how much space you need at a single time. i.e. if you create an array at every iteration then you need O(n). However if need N arrays before even looping then the space complexity is O(n) :💡💡💡

### Sequential loops vs. Nested loops

**Sequential O(n)**
```swift
for a in arr {
}

for b in arr {
}
```

vs. 

**Nested O(n^2)**

```swift
for a in arr {
 for b in arr {
 }
}
```

💡💡💡 for most tree like stuff the complexity would be number of (branches)<sup>depth</sup>. Branches/choices/options/directions. 


Looping like this is still N^2: 

```swift
for i in 0 ... n {
   for j in i + 1 ... n {
      print(i,j)
   }
}
```

It's N^2 because the first step is going to happen N - 1 times, then N -2 times, and until ... 1 . So it's `N(N-1)/2` and that's just N^2


## Are recursive functions linear or exponential? 
Both. 

Traversing a balanced binary tree is `O(n)`. But also `2 ^ height`. `height` is _roughly_ `log(n)`. 

**What's the Big O notation of sorting each string of an array and then sorting them all? (Pg. 49)**

Assuming `i` is the average lenght of each item: 

sorting each item is: `i * log(i)`. And we have `n` items. so `n * i * log(i)`
sorting all items is: `n * log(n)`. And each comparison can be of length `i * n * log(n)`
total = n * i * log<sup> i + n </sup>

Pro-tip: How many times a thing gets called. For what length. 

**What is the Big O notation of fibnoacchi (Pg. 54)?**

It's `branches ^ depth` = 2 ^ N`

What if we cache the values? 

💡💡💡 It's key to write it down. It turns into this:


```
f0 = 1 & store
f1 = 1 & store
f2 = c0 + c1 & store 
f3 = c2 + c1 & store
...
fn = fn-1 + fn-2 & store
```

`c1` means cache value for `f(1)`
`c8` means cache value for `f(8)`

So you basically change from computation to lookup and that changes your Big O notation...

## Calculating something for each element, where the thing we calculate _shrinks by 1 for each new element_. Pg 46. 

Examples: 
1. For every element of the array sum the _remaining values_. If we have 10 items, for the first item, it's a sum of 10, then 9, then 8, ... then 1
2. For every node in the tree, calculate its height. For every new node, we reduce the nodes count by 1. 

## Calculating the height of a tree vs calculating the height of every element of the tree: 
https://leetcode.com/problems/balanced-binary-tree/description/
Just the height has an O(n) at worse — if it's a straight line. Or log(n) if it's balanced. 
But if you have to calculate the height of every element of the tree, then it's n + n-1 + n-2 + ... + 1, which is O(n^2). It's essentially the repeition that makes it n squared...

## Why is BST log(n)? 

https://stackoverflow.com/questions/8185079/how-to-calculate-binary-search-complexity

You need to cut down until you can't cut down anymore. Each time you cut down by half. You stop cutting down when you only have 1 item. 
```
1 = N / 2 * x (x times cutting down)
```
Then multiply by 2x:
```
2x = N
```
Then do log2:

```
log2(2x)    = log2 N
x * log2(2) = log2 N
x * 1         = log2 N
```

## Complexity of sorting an array of Strings?  Pg. 49

You have to factor in the length of every string (s) and the number of items (n).

Comparing two strings is just O(s)
Sorting is 


## Technical Questions (Pg. 60)

Test your stuff with a simple:
- general case
- base case
- error case

# Steps to solve a problem

- Listen carefully 
- Draw an Example
- State brute force. Don't think that brute force is bad. A lot of candidates can't think of the brute force solution. So even talking aout that is great! (Pg. 64)
- Optimize (fresh example
  - Precompute values
  - Use hash table
  - Think of best conceivable. Often that leads you to the solution...
- **Walk your interview through the high level steps**
- Then implement
- Test
  - Hot spots: base case in recursive code
  - Special cases:
   - Empty values
   - Negative values
   - Zero
   - overflow values
   - trees that aren't balanced. 
   - start and end of an iteration
   - division by zero 
   - null nodes in trees
 - Optimize
   - Look for BUD
    - Bottlenecks: identify which step is the bottleneck
    - Unnecessary work. Example: 
      Print all positive integers that match a^3 + be ^3 = c^ + d^3 (1 < a,b,c,d < 1000)
      Unncecessary to calculate all and compare
      We can just find all values that are integers for (a^3 + b^3 + c^3) ^(1/3)
    - Duplicated work: In the above example: 
      Store all results of c^3 + d^3 in a dictionary. (No need to calculate it every time). Then every time we calculate a^3 + b^3 look up to see if we have that value in our dictionary, if so pull out c & d. **Dictionaries are usually the most common way to avoid duplicate work.**
   - DIY (Do it yourself). Without any coding do, just use your brain and do it. Then try to infer the algorithm you used. Where you skipped something or actually entered a flow and what algorithm/function you used in your head. (Pg. 70)
   - Simplify and generalize ????
   - Base case and build. Try to solve things for n = 1, then try to build up. 
     Q: How to print all permutations of a string. For simplicity assume all characters are unique. 
     A: case "a" -> "a"
        case "ab" -> "ab", "ba"
        case "abc" -> ?
        
        1. Insert "c" into all Permutations of "ab"
        2. Insert "c" into all strings of "ab" & "ba"
        3. Merge ("cab", "acb", "abc") & ("cba", "bca", "bac")
        4. ("cab", "acb", "abc", "cba", "bca", "bac")
     Base case and build often leads to recursive algorithms
     
  - Flexible and Robust:
    If tic-tac-toe is 3 x 3, well you can still build your board to be N x N (Pg.80)
  - Don't give up. Show excitements for solving hard problems

## Negotiations Pg. 82
- Have a specific ask
- Keep relationships open after people lave. 
- Keep interviewing at least 3-4 times a year

### Permutations vs combinations

A permutation is an act of arranging the objects or numbers in order. Combinations are the way of selecting the objects or numbers from a group of objects or collection, in such a way that the order of the objects does not matter. From [here](https://byjus.com/maths/permutation-and-combination/)

https://www.youtube.com/watch?v=m7chPc7zIF4&list=LL&index=66
Permutations: How many ways from A to B? 
- A total of 10 directions -> 10!
- 4 _rights_ exist as identical elements. -> / 4!
- 6 _down_ exist as identical -> / 6!
- answer = 10! / (4! * 6!) ... Total answer / total overcounts

**Mistake: Can't think of it as 10 decisions each with 2 choices. It's becaues a selection of 10 rights or 10 downs is incorrect.**

Why can't I think of it as 10 times each with 2 options hence `2^10` ? and then start correcting from there on? Why is total answers considered to be `10!`

Permutations: How many ways from A to B, that goes through C? 
Answer: ( A -> C ) * (C -> B)

<img width="397" alt="Screen Shot 2022-01-21 at 8 09 52 PM" src="https://user-images.githubusercontent.com/12160198/150618614-11d62512-0c8b-414c-8ce3-9fb53ae106b8.png">

https://www.youtube.com/watch?v=p8vIcmr_Pqo&list=LL&index=72

Permutation formula: 

(Total possibilities) / (Total overcounts) e.g. 

From A, B, C, D, E, F create 2 letter words: 6! total, but then we actually don't 6 slots. So we have to reduce our counts by dividing it by (6 - 4)!

Combination formula: Is same as permutation formula it just then reduces by the _order overcount_ as well

<img width="1435" alt="Screen Shot 2022-01-21 at 8 55 47 PM" src="https://user-images.githubusercontent.com/12160198/150620346-b3efc49c-b392-4fda-a53e-8790f0f1da5f.png">


# Tree

- [different kind of trees with illustrations](https://towardsdatascience.com/5-types-of-binary-tree-with-cool-illustrations-9b335c430254)

## Ways of thinking

### Aggregation or single traversal
- Just travers down once and aggregate things. Like a tree sum.

### Validation (might lead to multi-traversal)
- Check for a condition at the node itself. **Then check for each of its leafs. Do this repeatedly.**

