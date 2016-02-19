---
author: chipoglesby
comments: true
date: 2015-05-14 08:45:34+00:00
layout: post
slug: conditional-formatting
title: 'How to: Format cells in Google Spreadsheet based on a previous cells value'
wordpress_id: 28191
excerpt: For example, if the value of B1 is greater than A1, set the background of B2 to lime green.
categories:
- Adwords
tags:
- App Scripts
---

Recently I was asked to create a Google App Script for the old version of Google Spreadsheets that will format a new cell based on value of the previous cell. For example, if the value of B1 is greater than A1, set the background of B2 to lime green. If you update the cell later and the value is less than A1, the background will be removed.
<script src="https://gist.github.com/chipoglesby/af7ff46fd33094118e48.js"></script>
When I was writing the script, I was having some issues identifying the previous cell. I realized that I could work around it by using the varible: var previousPositionValue = sheet.getRange(currentRow, previousPosition).getValue();. The previousPosition is defined as the current column minus one. So if the cell is B1, the previous position would be A1 and so on.

In laymen's terms, this tells the script to pull the value of the previous cell. I'm sure there are much more elegant solutions, but this works for what I need. This script also assumes that you will be editing each cell manually by hand, ie: data entry. In the new version of Google Spreadsheets, this script wouldn't be necessary. You can now do conditional formatting with formulas, so you could [create a statement like the photo attached](http://www.chipoglesby.com/wp-content/uploads/2015/05/formatting.png).
