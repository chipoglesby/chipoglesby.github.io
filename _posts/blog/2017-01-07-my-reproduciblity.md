---
title: "Why I'm Fascinated With Reproducible Code"
author: "chipoglesby"
date: '2017-01-07'
excerpt: I'm not the only one who hates typing the same thing repeatedly, right?
layout: post
published: true
slug:
categories:

- Coding

tags:

- R

---

In my [last post](2017/01/reproducible-template/) I shared a template that I use
for all of my work. I realized there was a section that I didn't go into that
that could be very important for someone in the future.

Take my job for example. I use to create reports for people on a weekly basis.
It could be about company performance or web metrics, advertising reports, etc.
A lot of it could be viewed as 'grunt work' because just about anyone can do it.

In essence you're looking at a table of data and reporting that numbers either
increased or decreased. Granted there's a lot more to it than that and we would
spend the majority of our time answering the "Why did this happen?" question.

I only wrote reports for a while before I began thinking about how I could
automate something like this.

For example, you might see a sentence like "Revenue for the week of 2017-01-01
was 500,000. It increased by 25% from the previous year."

There are parts of that sentence that can easily be written to change
automatically, let's take a look: "Revenue for the week of **w**
was **x**. It **y** by **z**% from the previous year." We could easily write the
code to replace the values "w, x, y, z."


````
dataPercent <- round(
  (sum(data$revenue) - sum(dataPrior$revenue))
  /sum(dataPrior$revenue) * 100, 2)

  dataResult <- if (dataPercent > 0){
    paste(
      "increased by ", round(dataPercent),
      "% from the previous year.", sep="")
  } else {
    paste(
      "decreased by ", -round(dataPercent),
      "% from the previous year.", sep="")
  }  

print(paste("Revenue for the week of ", min(data$date),
" was $", sum(data$revenue), "It ", dataResult, ", sep = ""))
````
Can you see how easy that is??
We're not even really doing something complicated yet! So far:

1. We're calculating the percent change from one time period to the next
2. We've created an `if` statement for the revenue change. If it increases,
print this, `else` print something different.
3. We've also calculated the minimum date using the `min()` function.
4. We've also calculated revenue using the `sum` feature.

Now, whenever we run this report, we will get a familiar result with all of the
proper data without having to rewrite half of our analysis. There is
**so much more** that you can do, so I encourage you to go out and explore and
share what you come up with.

I should mention that this isn't a new idea. Web developers have been doing this
with code for a long time, but in the world of analysis, this is kind of a new
way of thinking for some.
