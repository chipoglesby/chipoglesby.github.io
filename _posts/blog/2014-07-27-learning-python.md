---
author: chipoglesby
comments: true
date: 2014-07-27 17:00:37+00:00
layout: post
slug: learning-python
title: I hate snakes, but I'm learning to like Python
wordpress_id: 27995
categories:
- Journalism
- Sidenote
tags:
- programming
- python
---



Indiana Jones and I don't have a lot in common other than our mutual disdain for snakes. "Snakes, why'd it have to be SNAKES?" Indy, you are my hero!

Obviously Python has nothing to do with snakes, it's just a name of a programming language. Just like my last post about Git, my first interaction with Django, a framework written in Python happened in 2007 at The State Newspaper.

There were some very interesting people doing very cool things back then _at other newspapers_. [Adrian Holovaty](http://en.wikipedia.org/wiki/Adrian_Holovaty) had just launched Everyblock. While he was at the Lawrence World Journal, he and some coworkers had created Django and [Ellington](http://www.ellingtoncms.com/), a far superior framework/CMS than anything I had ever seen at the time.

At The State, we had just started working with an ace programmer [Justin Abrahms](http://justinlilly.com/python/django_at_30000ft.html), who introduced us to Django. The tagline for Django is "The web framework for perfectionists with deadlines."

In October 2010 after mastering WordPress, I decided to conquer Django and Python. I purchased "[_Practical Django Projects_](http://www.amazon.com/gp/product/1430219386/ref=oh_details_o01_s00_i00?ie=UTF8&psc=1)". I made it 1/2 way through the book before I gave up. Ultimately at SCPC I wanted to future proof The Nerve, so we relaunched their site in Django. That was my last time using it.

Fast forward four years and I am once again dipping my toes in the water of learning Python, this time I want to learn it the right way. I needed it recently to finish a homework assignment for Cousera and after hacking my way through it, I realized it's time to learn it properly.

I started the Google Python Exercise class, but I really need something more beginner than that. The i stumbled upon Code Academy. Their [Python class](http://www.codecademy.com/en/tracks/python?jump_to=4fd50d26d7fc680003030bd9) has been one of my favorite online classes that I've taken so far. This class just gets you to the beginner level and I am by no means an expert at anything.

There are multiple ways of approaching coding. There isn't a "right" way to do anything, only more optimal routes. For example, take this code:

You don't have to understand what they're saying, but their both doing the same thing: counting the number of doughnuts and returning two values, if it's less than 10, return the exact number and if it's more than ten, say 'many'. Pretty cool right?

One of the work projects that I have is building an automated reporting system for clients. The system that I've created is rudimentary and limited, but it's a step in the right directions and lightyears beyond how I use to do things. With the help of an awesome intern, we built a script that pulls numbers and puts them into a spreadsheet. That spreadsheet uses a mail merge function to pull numbers into a prebuilt template that we can export to a client. This takes about 10 minutes instead of the old four hours.

The next step of course is a web based system where someone can log in and this could happen automatically. We skip the spreadsheet and word document and it's printed out in a web interface. Automation for the win!

When I began looking for a system that could do this, I was immediately reminded of the python class that I was taking. It handles reusing apps easily and supports all of the functions that I need. For a visual example of this, check out the LA Times data desk app: [Mapping L.A.](http://maps.latimes.com/neighborhoods/region/central-la/) The charts on that page use the Google Charts API and are created automatically on the fly each time. For me, that means no more charts in excel or R. The population metrics are part of a template that are generated automatically as well. In the backend, I image their system looks like this: %s population in %d, according to the U.S. Census. Again, this part is automatically generated when the data is updated.

Example of a chart created with the Google Charts API: ![](http://chart.apis.google.com/chart?chs=350x275&cht=bvg&chbh=45,20,20&chm=N%2A0s%2A,000000,0,0,13,0,e::5|N%2A0s%2A,000000,0,1,13,0,e::5|N%2A0s%2A,000000,0,2,13,0,e::5|N%2A0s%2A,000000,0,3,13,0,e::5|N%2A0s%2A,000000,0,4,13,0,e::5&chds=0,146794.8&chco=adc9d6|adc9d6|adc9d6|adc9d6|adc9d6&chd=t:122329.0,90059.0,47566.0,51960.0,21255.0&chxt=x,y&chxl=0:|20+or+less|20-40|40-60|60-125|125+and+up&chxs=1,ffffff,10,0,t,ffffff)

By editing the url, we can also edit the chart. Example, change one of the bar numbers: ![](http://chart.apis.google.com/chart?chs=350x275&cht=bvg&chbh=45,20,20&chm=N%2A0s%2A,000000,0,0,13,0,e::5|N%2A0s%2A,000000,0,1,13,0,e::5|N%2A0s%2A,000000,0,2,13,0,e::5|N%2A0s%2A,000000,0,3,13,0,e::5|N%2A0s%2A,000000,0,4,13,0,e::5&chds=0,146794.8&chco=adc9d6|adc9d6|adc9d6|adc9d6|adc9d6&chd=t:122329.0,90059.0,47566.0,51960.0,500000.0&chxt=x,y&chxl=0:|20+or+less|20-40|40-60|60-125|125+and+up&chxs=1,ffffff,10,0,t,ffffff)
Prior to doing all of this, the old me would have thought these charts and numbers had to be created manually and inserted by hand. Imagine doing that 20 times per week. Who wouldn't go crazy doing that?

Not only am I learning how to code, I'm also learning to think programmatically and learning how to solve problems in this manner. Coding helps you learn how to think.
