---
title: "How To: Run Github Code on a Remote Server"
author: "chipoglesby"
date: '2017-03-07'
excerpt: A short example of how you can run remote code with version control.
layout: post
published: true
slug:
categories:

- Coding

tags:

- github
- bash

---

For a lot of my work, I host and run code on [Google Comptue Engine](https://cloud.google.com/compute/).
This gives me an easy and very cheap way of running specific scripts for as little as $5 per month.

Recently though, I've been thinking about how I could execute some code that's stored remotely on Github
without setting up version control on my remote machine.

The idea would be to create a public or private repo on github and store my `shell` scripts there and then
call them directly on the remote sever. That way I would remove the need to depoly code to a remote location
and the script would always be up to date.

I'm new to the ideas of CI/CD, so I'm sure there might be a better way to accomplish this, but short of setting up
version control on the remote server, this would be the most simple way to accomplish this.

Here's the set up:

1. In your repo, you would create a shell script that would be used to execute you all of your commands.
You could use the file `command.sh`
2. On your remote server, you would set up your shell script that would call the remote script and execute it.
You would use the file `remote.sh` which calls `command.sh` and excutes its code.

The [repo is here](https://github.com/chipoglesby/bashAndGithub) if you want to clone it and try it yourself.

The tools in this example are:

1. [`bash`](https://www.gnu.org/software/bash/) - To run the scripts
2. [`jq`](https://stedolan.github.io/jq/) - To process the results
3. [`sed`](http://www.grymoire.com/Unix/Sed.html) - To clean up results
4. [`Github Contents API`](https://developer.github.com/v3/repos/contents/) - To call the contents of your script.
