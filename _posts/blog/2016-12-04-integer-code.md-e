---
title: "Prove When Addition Equals Multiplication Using Code"
author: "chipoglesby"
date: '2016-12-04'
excerpt: The things that keep me busy when I'm bored
layout: post
published: yes
slug: math-with-coding
categories:

- R-Analysis

tags:

- Math
---

Sometimes when I'm bored and I'm driving around, I like to think about how I can
do things using code. Yesterday I was thinking to myself "Why are zero and two"
the only two numbers (integers) that are equal with multiplication and addition?

Aside from real numbers like `{1.5,3}` zero and two are the only two integers
that work for `x + y = x * y`. But what if you didn't know that or you wanted
to test that with code? How would you do that?

And that's where my mind normally goes. **How would you do that with code?**

Here's my short and sweet little solution using some simple `R` code.

````
for (i in 0:9){
  x = i + i
  y = i * i
  if (x == y){
  print(paste("True for", i, sep = " "))
  } else {
    print(paste("False for", i, sep = " "))
  }
}
````

Nothing earth-shattering, just a fun example for me to think about.
