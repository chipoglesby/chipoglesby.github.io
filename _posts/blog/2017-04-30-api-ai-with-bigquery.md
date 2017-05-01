---
title: "Ideas on using API.AI to report information from BigQuery"
author: chipoglesby
comments: true
date: "2017-04-30"
layout: post
slug: api-ai-with-bigquery
excerpt: What if I could build a system to analyze information and allows me to do more important work?
published: true
categories:

- Coding

tags:

- BigQuery
- Automation

---

If you've been paying attention to what I've written about lately, you know that
[I love automation](http://www.chipoglesby.com/2016/05/i-love-automation/) and 
[I love data](http://www.chipoglesby.com/tags/#BigQuery)! 

I know that automation is a double edged sword, but I've always said that my goal
was to automate myself out of a job. 

If you're the one building the tech to do it, that's great. If you're
the one that gets phased out, that's not good for anyone. But this post isn't
about the machine uprising. This post is about something fun!!

When we first started using BigQuery at work, one of the ideas I tossed out was
the idea that in the future, we may sit in a meeting and be able to ask a device a
question and get an immediate response. I didn't think much about it afterwards
then I got a [Google Home](https://madeby.google.com/home/) for Christmas, SQUEE!!!

This little device was amazing. It just "knew" how to respond to so many
different versions of the same question. How did it know? After doing some
research online, I found that you can build your own conversation actions and
that got my creative juices flowing. ***For example, could you build a way to query
a database to get a result?***

I found a service called [API.AI](https://api.ai/) that lets you build tools
to do things exactly like this. So let's play this out. In an easy example, 
let's pretend that we've asked the question 
> "How much money did we make last year?"

Right off the bat, we know three things:

1. We need to sum something
2. What we need to sum is money
3. The time that is needed is last year

That's a pretty simple `SQL` that could be written in BigQuery. Let's take a look
at that:

```
SELECT
  SUM(revenue) revenueTotal
FROM
  [dataset.table]
WHERE
  year(orderDate) == YEAR(DATE_ADD(CURRENT_DATE, -1, "YEAR"))
```

In this toy example, we didn't infer if the person asking the question meant
Gross or Net Revenue. But with API.AI, we might set up some logic to
respond to the person and ask them if they meant gross or net revenue. Then, 
depending on their answer, we could query Google BigQuery with different
queries. You could also change the logic to update the `WHERE` clause to
whatever is applicable to the question.

There are so many other questions that you might want to ask your assistant. For
example:

1. What's our most popular selling product?
  * With a reply from the assistant: By units sold or revenue?
2. How did our Adwords marketing campaign do last week?
  * With a reply from the assistant: Would you like new customer count or revenue?

## Next Steps

On the surface this might seem pretty rudimentary so you may naturally try to
figure out what's next? Ideally you would want your application to not only report
but to also runs simulations, make a prediction or tell you to probabilities for
what your next campaign or product might be. This seems simple and straightforward
but you can probably guess that something like this might be much more complex.

Until then we just have to keep taking baby steps and innovating as much as
possible!


If you would like to learn more about conversation actions, watch this video:

<iframe width="560" height="315" src="https://www.youtube.com/embed/HNfE0uaKcfY" frameborder="0" allowfullscreen></iframe>
