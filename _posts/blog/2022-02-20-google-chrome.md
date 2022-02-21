---
title: "Initial thoughts on switching from a Mac to a Pixelbook Go."
author: chipoglesby
comments: true
date: "2022-02-20"
layout: post
slug: google-pixelbook-go-first-thoughts
excerpt: After almost twenty years, I've decided to switch from Apple Computers a Google Pixelbook Go. Is it going to work for all of my needs?
published: true
categories:
- sidenote
---

```
TL;DR (Too Long Don't Read):
A Google Pixelbook Go or Chromebook might be right for you if:
 
1. You exclusively use Google for Gmail, Drive, Calendar, Photos and other apps.
2. You own an Android phone.
3. You don't currently have a tablet and you're looking for something lightweight to travel with.
4. You mainly browse the web and don't need a heavy duty computer/laptop for a specific purpose.
5. You're a developer who can do most of their work with cloud based tools.
```
 
11 years ago my friend Rick purchased the original
[Google Chromebook](https://en.wikipedia.org/wiki/Chromebook). On the surface,
it didn't look like much. It was plastic and bulky, not sleek and sexy like my
Powerbook G4 (lol, man how our tastes change). But I could feel like there
was something about what this computer was trying to do. I remember this feeling
the first time I saw the original iPhone. The iPhone would go on to be a
game-changer, Chromebooks? I guess the jury is still out on that one.
 
It took me 11 years to finally decide to purchase a Chromebook, I chose the base
model Pixelbook Go. I've owned three Apple computers in my life, a Powerbook G4,
an iMac and a Macbook Air. I had the iMac and the Macbook Air at the same time, one
for heavy duty lifting and one for meeting with clients and traveling. The hardest
part was making sure they stayed in sync with each other. Fortunately I had Google Drive
to help me with that.
 
A few weeks after buying my Powerbook G4, Apple announced that they were moving away
from PowerPC based chips to Intel based chips. That meant that eventually my computer
would stop being supported by Apple. Well, a few days after purchasing my Pixelbook Go,
Google has announced the new [Google Chrome OS Flex](https://chromeenterprise.google/os/chromeosflex/)
which runs on older Windows and Apple computers essentially making them Chromebooks.
I guess this was not the time to buy the Pixelbook Go? Oh well, no worries.
 
After using a Mac computer for 20 years, I felt like maybe it was time to try
something new. The context switching going from a Mac to a PC was too difficult
so I knew I didn't want to do that. I had to use a PC a few years ago and
using keyboard shortcuts was a nightmare!
 
## Very first thoughts
 
Fortunately, on Chromebooks, you can remap the keys to change the CTRL and ALT
keys which are helpful, but you cannot currently change the shortcut keys in
Chrome. This makes things like switching between tabs, switching between programs
and closing programs hard because I've memorized so many Apple keyboard shortcuts.
 
I'm also really impressed with the cold boot time of the Pixelbook Go, it's much
faster than my old Macbook Air.
 
If you've used Google Chrome in the past, everything is pretty much where you expect, no change there.
 
I do like the hardware on the computer. I find the keys very quiet to type on
and I like that the body is magnesium instead of plastic, it has a much
sturdier feel to it.
 
The screen is also nice, I don't expect to have a 4K screen, but so far it's
easy to read and also works as a touchscreen, but honestly, who wants fingerprints
on their screen???? BLECH.
 
The biggest rebuff of using a Chromebook that I've heard over the years is
"What if you don't have Internet access?" Honestly, I don't think that matters
anymore. There's hardly anywhere that I go where I have zero internet access.
Even our cell phones sometimes have better Internet than some WIFI. If I'm
somewhere that doesn't have Internet, I either didn't plan properly or probably
didn't need to be on the Internet anyway. The last time that I needed Internet
I was in Red Feather Lakes Colorado and I had to drive to their library and use
their WIFI.
 
## Dev Priorities
 
I do like that the Pixelbook Go supports running Linux now. My experience with
Linux has always been Apple based, so I'm figuring out how to run `apt` instead
of `brew` for a lot of my missing packages, but that's okay.
 
With the addition of Linux, I can run Terminal. This always me to run `ssh`
and `git` so that I can update this blog
(which I can also do on github.com, so why run it locally?). I'm also running
VS Code on Linux for my IDE, which I have come to love using more than Atom.
 
The biggest question that I've had so far is if I can use the the Pixelbook Go
as my main machine? The answer is Yes and No. Let me explain.
 
## When I can use the Pixelbook Go as my main machine:
 
1. When I'm working with marketing analytics. I have VS Code for any
Javascript that I need to write. Google Tag Manager does a decent job of
formatting it for you, so there's that. I also have Developer Tools for testing
any Javascript in the browser.
2. I need to do any documentation based work. With VS Code and git, I'm set.
3. If I need to do any Data Science or Analysis work, I have Google Cloud
Platform for all of my needs there. I can run Rstudio on Compute Engine and
with their flexible billing, I can spin up very powerful instances to run and
tear them down as soon as I'm done, save me a lot of money.
4. GCP also has Google Cloud Shell, Cloud Shell Editor and Cloud Source Repos
so if I really wanted, I could do all of my work there, if I chose.
5. GCP also supports running Docker images, so that's one more thing I can
check off of my list.
6. If I want to run Python locally I can do that, I can also do that on GCP.
There's also [Colabratory](https://colab.research.google.com/) so that's a win
for Python data science users!
7. Github has Codespaces and there's even an online version of [VS Code](https://vscode.dev/).
So I'm also covered there if I need to test code online.
 
## When I cannot use the Pixelbook Go as my main machine:
1. The Pixelbook Go isn't going to be used to train neural nets, let's be honest.
It's limited to the processor, RAM and SSD of these machines, so I doubt that will
happen.
3. If my only option for some reason is to run RStudio locally, it can be done,
but it's not my first choice. Again, you're limited by the specs of the machine.
4. If you want to edit videos. I don't do any video editing but if I did, I'm
not sure it can be done on a Chromebook. I'm guessing you could use Youtube Studio
or WeVideo.
5. No Photoshop on Linux. First, I should mention that I'm aware of Adobe Creative
Cloud, but I haven't used it yet. If it works, I probably would just use that and
take this one off the list.
6. Gaming. I don't play games and don't know squat about what makes a good gaming machine.
 
## Final thoughts
Computers and web-based apps are quickly moving us back to
the [thin client](https://en.wikipedia.org/wiki/Thin_client) model of computing
where everything is cloud based.
 
11 years ago when the first Chromebook was released we didn't have the
online options or apps we have now. With the rise of even faster Internet speeds with 5G
it will be really exciting to see where we are 11 years from now.
 
There are some people who will need very specific operating systems for their work needs that
Chromebooks may never be able to solve for, hopefully it won't be that way
forever.
