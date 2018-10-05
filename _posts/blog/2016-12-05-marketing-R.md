---
title: "Automating Marketing With R"
author: "chipoglesby"
date: '2016-12-05'
excerpt: Trying to make complex marketing requests more simple
layout: post
published: yes
slug: complex-list-requests
categories:

- R-Analysis
- Automation

tags:

- SQL
- BigQuery
- R
---

This past year I led a team with analysts and developers as we migrated our
data warehouse from a costly external solution to a low-cost internal, no-ops
solution using Google BigQuery. Needless to say, we love it!

One of the many things we do is creating marketing lists for our teams.
Sometimes they are straightforward and sometimes they can be a bit more complex.

One request we received recently gave me a good chance to be very creative in
how I tried to solve this problem and I'd like to walk you through it.

The request was something like `"I'd like all customer ids within a 200 mile
radius of the 80535 zip code."` That on the surface is pretty straightforward
until you think about how you might pull something like that off.

First, the BigQuery documentation does have examples for using [bounding boxes](https://cloud.google.com/bigquery/docs/reference/legacy-sql#advanced-examples_10).

<script src="https://gist.github.com/chipoglesby/a2bd4f4d5d616de8d76690ec62264d80.js"></script>

But you'd have ask if that is the best solution? or if there are other options?

A less than ideal option might be to look the zip codes up by hand and write
some `sql` code for it like:

```
SELECT
  customerNumber
FROM
[table.dataSet]
WHERE
regexp_match(postalCode, "80535, 80536,......")
```

But after looking at a list of hundreds zip codes, who would want to do that?

Recently my coworker Jason and I were talking about finding patterns in data and
that got me thinking about how you might use something like that for this solution.

If you don't know a lot about zip codes, you can read this short piece by
[Smarty Streets](https://smartystreets.com/articles/zip-codes-101). Since
zip codes have a "pattern", we can really just use the first two digits to pair
down hundreds or thousands of zip codes into just an array of less than a dozen.
![zip codes](https://storage.googleapis.com/www.chipoglesby.com/wp-content/uploads/2016/12/zipCode1.png)
![zip code map](https://storage.googleapis.com/www.chipoglesby.com/wp-content/uploads/2016/12/zipCode2.png)

Next, I found a tool called [Zip Codes API](https://www.zipcodeapi.com/) that I
can use to programmatically pull in zip codes with a radius. We're almost there!

Finally, I'd like to create a piece of code that could be used without repeating
a lot of manual work. So my requirements for some `R`
code would be:

1. It should be programmatic and reproducible, ie a function
1. It should build the query for me and return the results in a data frame

Let's dive into the code!

<script src="http://gist-it.appspot.com/github/chipoglesby/rSnippets/blob/master/zipCodesAPI.R"></script>

Let's walk through what the code does:

First we've built a function that will accept the inputs for `zipCode`, `radius`
, `apiKey` and `columns`. The columns for your query can just be a `string` like
`one, two, three` and will will be used in both `SELECT` and `GROUP BY`.

We'll be using the libraries: `stringr`, `jsonlite`, `bigrquery` and `dplyr`.

1. `jsonlite` will call the API, get the response and store it in memory.
2. `stringr` will get the left two results of `zip_code`, where we will concat
the results into a string for the query.
3. `bigrquery` runs the query and returns results to a dataframe.

The function will build a query like this:

```
SELECT
  customerNumber,
FROM
  [table.dataSet]
WHERE
  REGEXP_MATCH(LEFT(postalCode, 2), "xx|xx|xx|xx|xx")
GROUP BY
  customerNumber
```

Now we've written our function and it's ready to run. Depending on our needs, we
can extend it further and save it as a CSV and mail it to someone if desired.
