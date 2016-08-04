---
author: chipoglesby
comments: true
date: 2016-07-25 00:34:15+00:00
excerpt: You have a deadline driven task that needs to be done in one hour, but the
  task takes 3-4 hours. What do you do?
layout: post
slug: the-500-folder-problem-a-real-world-automation-example
title: 'The 500 folder problem: A Real World Automation Example'
wordpress_id: 28341
categories:
- Coding
tags:
- automation
- bash
---

Here's the scenario:

<blockquote>At the end of your work week on Friday at 3:00 pm your boss realizes that something has gone wrong and important version of all of work files are gone from a directory. Luckily there is a backup directory but you have to go through 500 directories, each with four sub-directories and two sub-directories, open each file, then copy and paste into a master file. Your boss needs this by 5:00 P.M. and you know it will take at least 3-4 hours to do. What do you do?
</blockquote>

Most people will start clicking with a fever pitch, trying to copy and paste each file by hand. But not you, you're smarter than that. You know from experience half of the files have to be processed one way, the other half have to be processed a different way. You know that each of the 500 directories all have the same four sub-directories (directory1, directory2, directory3, directory4). You think that each of the sub-directories will also have two directories (modified, original).

Then you stop and think through all of the steps involved:
  1. Open your first directory containing all of your other 500 directories
  2. Open your first of 500 directories
  3. Open your first of four directories: directory1
  4. Look for a directory called modified or original. Which one is there?
  5. There's only a directory here called modified, so open that.
  6. Open the first file in the modified directory, copy the contents of that file into a new file
  7. Close the file
  8. Close the modified directory
  9. Close directory1
  10. Repeat steps 1-9

You can now begin to build your bash shell script. You know that the majority of what you want to do will be in the form of for loops and if statements. For you, that means a line like:

`for directory in *; do` - This accomplishes step 2.
`if [ =~ \.txt$ ]; then` - This accomplishes part of step 6

You finish writing your script, send your boss a link to the files. Their so happy that they let you have an early start to the weekend!

This is a mis mash of experiences that has happened to me in different workplaces.  I was the person who just started doing a task so that I could get it done as quickly as possible. Then I remembered the story of "[shutting up and building those damn boxes](2016/05/i-love-automation)". Now I like to plan and think through things before I ever start working. In a case like this, I'm looking for similarities. Do the directories and their sub directories all contain the same files? Are all of the files the same, even if they're wrong and need to be fixed?

I've included an example of what the finished version of the script looks like. It's not perfect. For example, what if there are unintended line breaks? The script doesn't clean up line breaks using dos2unix, so there is even more planning and coding that would need to be included.

Hopefully I can help someone. Before you run off to do a last minute task, ask yourself these two questions: "Can I save myself more time by writing a script to automate this?" "Could I have to do this task again in the future at any point?" IF you answered yes to either of those questions, then you should automate it!

Here's a full example of this situation:
<script src="https://gist.github.com/chipoglesby/e80416d9a0ca7f6a6a5d78855148e478.js"></script>

If you're interested in learning bash or shell scripting, I recommend reading these two books:

1. [bash Cookbook: Solutions and Examples for bash Users](https://www.amazon.com/bash-Cookbook-Solutions-Examples-Cookbooks/dp/0596526784) 
2. [Classic Shell Scripting](https://www.amazon.com/Classic-Shell-Scripting-Arnold-Robbins/dp/0596005954/ref=pd_bxgy_14_img_3?ie=UTF8&psc=1&refRID=3Y1ZZ6NDAKH3XDA9G1C9)
