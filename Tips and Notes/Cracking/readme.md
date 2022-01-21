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
## Mistakes: 
 - Not properly communicating to manager/PM but then later spending time on stuff I thought was severly necessary. Like I should have more trust in myself that my decisions are right. Because more than often I've ended up doing that work later when my memory wasn't fresh and it had become a priority and then things got rushed...
 - In every team you enter, try to find the **problem-solver** of the team. Don't discuss issues with the problem-creator. 
 - Trying to do a big ticket all in one go. Not breaking it down. 
 - Don't be **shy** to ask in a Public channel. It's often better because you'll hear mutliple views and get to a consensus sooner. Especially that you're working in parallel with Android. 
 - I often think too much and don't pull in my leads in a timely manner. 
 - When I'm frustraded due to incorrect managerial decisions e.g. rushing things, I actually become slower and feel like my slowness is justified. It shouldn't be. Their fault is their fault. I shouldn't let that slow me down. I should just work harder and fix things in the long run. Like outline a plan and talk with the right-minded people to get things done. 
 - If someone isn't meeting with me, then I have to **create the meeting invite**, I can't just say they were suppose to create the meeting
 - I became SME in certain domains, yet I should have **created proper architectural diagrams** and linked them at the right place i.e. I should have becamet the document champion of that subject too, not just the SME. Being an SME will effect your timings
 - Ever since we had attrition I had to spend more time outside my immediate team helping other teams due to having knowledge on app startup up. I should have **managed my time bettter** and communicated better with my manager
 - Not being super **attentive in meetings** e.g. in Grooming 
 - If your tech lead isn't there technically then **instead of fighting** them for their lack of knowledge, **help them out all the way** — pateintly and while you implicitly acknowledge their work experience. Don't lose patience or get frustrated. 
 -  Often times I have ideas and I should **show a sample code of how it works** instead of just talking about
 -  I didn't have the courage to **create engineering tickets** and bring them into our sprint. I was always held back by product oriented tickets.
 -  I was always fine with lastScreenSeen. This effected the delivery of the tickets. I should have communicated it better that it would effect the on-time delivery of things. 
 -  Didn't prioritize bugs (from recent work) over new tickets. Basically a bug from work in current sprint should be prioritized over new work. 
 -  Enforcing diagrams when I'm a new hire. 
 -  **Adapting to negative** change i.e. if you move from one squad to another and that squad has bad workflow, then don't be sad. Work hard and ignore it. 
 -  **Not every manager/lead is the same**. Some leads will come and check on you and help you out upon a tiny show of weakness, for others you need to be very articulate with their time. You just have to adapt on day one. Possibly even asking these questions from your manager/lead would save you a lot of headache.
 -  **Not sitting down enought with Product members**. Building relationship is a 2-way thing. And if they're not creating tickets in a way you need, then sit down with them and discuss things. e.g. rather than saying updaing a random flag, mentioning that's a config or firebase feature flag, helps. Basically ask them to be explicit.


### Questions to ask from interviewer: 

- How **many devs/testers**
- What do you like about your **team? Product? Company? **
- What's your **PR merge rule **like
- What's the onboarding like? Like if I know Swift, UIKit and MVVM can I jump straight in? 
- How's your **company's presence** in the iOS community? How many of you are active speakers? How do they get support from the company? 
- Why did you choose the company? 
- What new things have you tried? What makes you think you're a tech company? And not just focused on shipping a feature and making product happy?!

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

