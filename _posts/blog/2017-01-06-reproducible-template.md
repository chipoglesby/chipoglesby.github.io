---
title: "A Reproducible Research Template for R"
author: "chipoglesby"
date: '2017-01-06'
excerpt: A quick and easy template for reproducible research in R.
layout: post
published: true
slug:
categories:

- Coding

tags:

- R

---

Reproducible research is vitally important for scientific studies, but what
about for businesses?

A LOT of analysts still do things the manual way. That might involve using a
combination of Microsoft Access, Excel and Word to produce their analysis.

Toolsets aside, it's hard to easily update your analysis if you've found an error
in your sql queries or made a calculation error in Excel. If you find a problem
it usually means repeating multiple steps to correct your mistakes.

My preference for the past two to three years has been to use R to make my
reports as accessible and repoducible as possible.

To that extent I'm sharing a template for how I set up all of my analyses. There
is probably hundreds of ways that this could be improved, but it works the
majority of time for me. In the future, I'd like to learn more about `make`,
I think it could really improve this process. The way things currently are,
each time the shell script is invoked, the analysis is rebuilt from scratch.

Let's take a look at the setup. Each analysis includes the following items:

1. code: a folder to store code for processing data
2. images: a folder to store images produced for reporting
3. README.Rmd: This is a a R file used to produce the `README.md` file.
4. README.md This is a tl:dr of the analysis pdf file.
5. main.R: This is the main R file. It lists the steps for the analysis
6. run.sh: This is the bash file that will automatically run 'main.R' when invoked.

The `main.R` is the primary file that is used to run the analysis. I've included
some example code that you can check out. It will call all of the other files in
the `code` folder and run them. Lastly, it will knit all of the files together
as a `README.md` file and a `pdf` file.

The run.sh is a `bash` file that will run the `main.R` file when invoked.

Within the code folder, the first file `load.R` should be used to load all of
your raw data. If you're working with `CSV` files, I recommend adding a folder
called `data` and `cleanData`. Depending on your preference, you may want to use
`load.R` to clean your data as well.

The next file, `functions.R` is normally used for exploratory data analysis and
manipulation of data.

The last file, `plots.R` is normally used to create any plots for the analysis.

Since R stores all of the data in memory, you can break your analysis up into as
many files as you want. If you do that, I recommend keeping track of which files
are doing what. I normally do this with the `README.md` files within folders.

Feel free to fork this project on github and make changes for yourself. You could
even use this in a private repo and then change the upstream to a new repo when you
clone this from github.

If you want to checkout out the project, you can find it here on Github:
[Reproducible Research Template for R by Chip Oglesby](https://github.com/chipoglesby/reproducibleResearchTemplate)
