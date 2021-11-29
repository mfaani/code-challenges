## Special situations 
- What's the hardest bug you've faced? (Pg. 15) 
- Leadership questions (Pg. 17): 
 - situation handling
 - prioritization. Making trade offs
 - communication
 - gettting the job done 
- Questions aren't meant to be about math and probability. (Pg. 23) They're meant to be about algorithms and problem solving `a^3 + b^3 = c^3 + d^3`
## Before the Interview
- For people without experience (Pg. 26): 
 - Big Projects in school 
 - Internship
 - Start something
- Don't forget: Stumbling and struggling is normal ❤️❤️❤️ (Pg. 31) 

## Behavioral Question

Make sure for each project you can talk about: 
 - Challenges
 - Mistakes/Failures
 - Enjoyed
 - Leadership (where you played a central role)
 - Conflicts
 - What'd you'd do differently 
 - Technical depth (my knowledge or access token and refresh token, app startup helped me in lots of discussions around needing access token and stuff). "I can go into more details if needed" 😅

If asked about your weakness, give a real example but also one that's a two sided sword 😅. e.g. "I forget details...which allows me to execute things quickly :D" 
My mistakes: 
 - I often think too much and don't pull in my leads. 
 - If someone isn't meeting with me, then I have to create the meeting invite, I can't just say they were suppose to create the meeting
 - I became SME in certain domains, yet I should have created proper architectural diagrams and linked them at the right place i.e. I should have becamet the document champion of that subject too, not just the SME. Being an SME will effect your timings
 - Ever since we had attrition I had to spend more time outside my immediate team helping other teams due to having knowledge on app startup up. I should have managed my time bettter and communicated better with my manager
 - Not being super attentive in meetings e.g. in Grooming 
 - If your tech lead isn't there technically then instead of fighting them, help them — pateintly. Don't lose patience or raise your voice. 
 -  Often times I have ideas and I should show how it works instead of just talking about
 -  I didn't have the courage to create engineering tickets and bring them into our sprint. I was always held back by product oriented tickets.

Questions to ask from interviewer: 
- How many devs/testers
- Why did you choose the company? 

- Using technology X, creates problem Y. How do you solve it. 
- How did you achieve such

### RxSwift
You should go on that you started the project with Rx, but then you ditched it. 
As as we didn't need that level of mapping stuff. Also it was difficult as our was getting converged. 
Later I started learning MVVM and got deep into writing unit-tests and stuff. Realized what's the difference between a class, it's VM, VM mock and VM Tests. 
And that it's best to not use mock clases, rather just inject a mock for its dependencies. 

### Give structured answers (Pg. 35) : 
- Situation 
- Action (try to have things in a bulleted list. I did 3 things x, y,z and explain each)
- Result 


### Intro (Pg. 36) : 
- Current role
- College 
- Post College
- Current Role
- Outside of work
- wrap up:  What you're looking for etc. 

Try to mention things that show that you're good a cultural fit...limited notes of success and stuff. 

## Big O (Pg. 43)
- time complexity
- space complexity: it's about how much space you need at a single time. i.e. if you create an array at every iteration then you need O(n). However if need N arrays before even looping then the space complexity is O(n) :💡💡💡

### Sequential loops vs. Nested loops

**Sequentia O(n)**
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

**What's the Big O notation of sorting each string of an array and then sorting them all? (Pg. 49)**

Assuming `i` is the average lenght of each item: 

sorting each item is: `i * log(i)`. And we have `n` items. so `n * i * log(i)`
sorting all items is: `n * log(n)`. And each comparison can be of length `i * n * log(n)`
total = n * i * log<sup> i + n </sup>

Pro-tip: How many times a thing gets called. For what length. 

** What is the Big O notation of fibnoacchi (Pg. 54)?**

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

## Technical Questions (Pg. 60)

Test your stuff with a simple:
- general case
- base case
- error case

