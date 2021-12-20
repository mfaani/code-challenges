<img width="369" alt="Screen Shot 2021-09-30 at 10 29 10 AM" src="https://user-images.githubusercontent.com/12160198/135474930-500239ef-2519-4971-90bb-a361f9d78fdc.png">

Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]

> Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value 

**I would alo say: add a null between the children of two parents...**

[1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]

What I understand is: 

1, then next level hence null
2,3,4,5 are at the next level. Then next level, hence null after 5.  
Then null for the end of 2's children. 
Then 6,7 for 3's children. null is for the end of 3's children. 
Then 8. Then null for the end of 4's children and so ...
