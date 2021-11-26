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
