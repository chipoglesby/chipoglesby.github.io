---
title: "Programming for data analysts"
author: "chipoglesby"
date: '2016-12-26'
excerpt: Today I'm trying to answer the question "Why should I learn to program?"
layout: post
published: true
slug: programming-for-data-analysts
categories:

- Coding

tags:

- R

---

When you stop and think about it, the entire data science industry is kind
of like how our country is laid out. Bare with me here as I try to explain:

> You have some people who are in the know and they use deep learning, and
neural networks to solve problems. That's kind of like living in NY or SF,
right? That's where the best and most advanced work is going on.

> Then you have those people who are trapped in the "flyover states" and
wouldn't even know where to begin to build a neural net.

Most of the time there's not a lot of consideration given to those people in
the middle. There are plenty of sites that will explain the what and the how
of programmatic data analysis, but not always the 'why'.

## Why would I want to learn to program???

Established analysts who don't work for large companies or start-ups will
usually ask this question and I will attempt to answer it.

Let's start for example of what your "workflow" might look like:

1. You get a request from a coworker about an analysis that needs to be ran.
2. You run your query in a `SQL` interface or even through Access (shudder).
3. You download your data as a CSV file, which you open in Excel and do some
light analysis.
4. You draw your conclusions write up your analysis in a Word document and
send it off.

Let's say for example that this is a report that you have to pull and run
weekly. Maybe it's related to web traffic, or maybe it's related to something
like revenue or sales if you're in ecommerce.

Let's look at the physical steps again:

1. Write a sql query
2. Download the information
3. Open and analyze it in Excel
4. Write up a summary in Word and send it out.

If it's a simple request, it might take you between one and two hours to get
this done. At the most, that's 104 hours per year that you'll spend getting
this done.

Let's look again specifically at steps three and four to explain why you would
want to learn to program. Let's say that you are pulling revenue metrics.

````
weekOne == 200,000
weekTwo == 300,000
````

Classically you might go into excel and use a function like `=(B2/A2)-1` and
then write in Word, `Revenue increased over the previous week by 50%.` Now
that's all well and good if you **never** make a mistake, but we're all human
so someone is going to make a mistake eventually.

But what if there were a way to automate some of the descriptive statistics
work you do? What if you could write a small bit of code to help you with some
of the higher-level work you end up doing?

Let's take a look:

````
weekOne <- 200000
weekTwo <- 300000

difference <- (weekTwo/weekOne) - 1

result <- if (difference > 0){
paste("revenue increased by ", round(difference, 2) * 100, "%" " over the
previous period.", sep = "") else {
paste("revenue decreased by ", round(difference, 2)* 100, "%" " over the
previous period.", sep = "")
}
````

This small bit of code does two things. First it calculates the difference
between `weekTwo` and `weekOne`. Then it uses a simple `if` statement to create
part of a sentence for me.

Using a program called `R markdown` I can create dynamic documents that can be
shared. Those documents are dynamic because they can be updated each time I run
them when the data has changed.

For example using `r result` in a sentence would produce: `Over this past week,
revenue increased by 50%.` Now each week I rerun my document, a new number and
part of a new sentence is produced and I don't have to worry about copying or
pasting the wrong metric.

## Okay, so??

So when you learn to program what you're doing, you'll find that analysis
actually becomes easy/fun again. Instead of four different stages, you can use
code that connects to a SQL database, pulls the information, performs your
analysis and writes the results, all in one neat package making it reproducible.

This is a very basic high-level overview of what is possible once you've decided
that you want to do things differently. The hardest part is deciding you want
to make this change.

You can take this type of work as far as you want, but it's up to you to get
there.
