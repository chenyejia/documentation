---
title: Bullet Chart in R | Examples | Plotly
name: Bullet Charts
permalink: r/bullet-charts/
description: How to create a Bullet Chart in R with Plotly
layout: base
thumbnail: thumbnail/bullet.png
language: r
has_thumbnail: true
display_as: financial
order: 8
output:
  html_document:
    keep_md: true
---



### New to Plotly?

Plotly's R library is free and open source!<br>
[Get started](https://plot.ly/r/getting-started/) by downloading the client and [reading the primer](https://plot.ly/r/getting-started/).<br>
You can set up Plotly to work in [online](https://plot.ly/r/getting-started/#hosting-graphs-in-your-online-plotly-account) or [offline](https://plot.ly/r/offline/) mode.<br>
We also have a quick-reference [cheatsheet](https://images.plot.ly/plotly-documentation/images/r_cheat_sheet.pdf) (new!) to help you get started!

### Version Check

Version 4 of Plotly's R package is now [available](https://plot.ly/r/getting-started/#installation)!<br>
Check out [this post](http://moderndata.plot.ly/upgrading-to-plotly-4-0-and-above/) for more information on breaking changes and new features available in this version.

```r
library(plotly)
packageVersion('plotly')
```

```
## [1] '4.9.0.9000'
```

### Basic Bullet Charts

  Stephen Few's Bullet Chart was invented to replace dashboard [gauges](https://plot.ly/r/gauge-charts/) and meters, combining both types of charts into simple bar charts with qualitative bars (steps), quantitative bar (bar) and performance line (threshold); all into one simple layout.
  Steps typically are broken into several values, which are defined with an array. The bar represent the actual value that a particular variable reached, and the threshold usually indicate a goal point relative to the value achieved by the bar. See [indicator page](https://plot.ly/r/gauge-charts/) for more detail.


```r
library(plotly)

p <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  gauge = list(shape = "bullet"),
  delta = list(reference = 300),
  value = 220,
  domain = list(x = c(0, 1), y = c(0, 1)),
  title= list(text = "Profit"),
  height = 150)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="basic-bullet")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5907.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Add Steps, and Threshold

Below is the same example using "steps" attribute, which is shown as shading, and "threshold" to determine boundaries that visually alert you if the value cross a defined threshold.


```r
library(plotly)

p <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  value = 220,
  domain = list(x = c(0, 1), y= c(0, 1)),
  title = list(text = "<b>Profit</b>"),
  delta = list(reference = 200),
  gauge = list(
    shape = "bullet",
    axis = list(range = list(NULL, 300)),
    threshold = list(
      line = list(color = "red", width = 2),
      thickness = 0.75,
      value = 280),
    steps = list(
      list(range = c(0, 150), color = "lightgray"),
      list(range = c(150, 250), color = "gray"))),
  height = 150, width = 600) %>%
  layout(margin = list(l= 100, r= 10))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="advance-bullet")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5908.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

### Custom Bullet Chart

The following example shows how to customize your charts. For more information about all possible options check our [reference page](https://plot.ly/r/reference/#indicator).


```r
library(plotly)

p <- plot_ly(
  type = "indicator",
  mode = "number+gauge+delta",
  value = 220,
  domain = list(x = c(0, 1), y = c(0, 1)),
  delta = list(reference = 280, position = "top"),
  title = list(
    text = "<b>Profit</b><br><span style='color: gray; font-size:0.8em'>U.S. $</span>",
    font = list(size = 14)),
  gauge = list(
    shape = "bullet",
    axis = list(range = c(NULL, 300)),
    threshold = list(
      line = list(color = "red", width = 2, gradient = list(yanchor = "vertical")),
      thickness = 0.75,
      value = 270),
    bgcolor = "white",
    steps = list(list(range = c(0, 150), color = "cyan")),
    bar = list(color = "darkblue")),
  height = 150)

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="custom-bullet")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5909.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>
### Multi Bullet

Bullet charts can be stacked for comparing several values at once as illustrated below:


```r
library(plotly)

p <- plot_ly() %>%
  add_trace(
    type = "indicator",
    mode = "number+gauge+delta",
    value = 180,
    delta = list(reference = 200),
    domain = list(x = c(0.25, 1), y = c(0.08, 0.25)),
    title =list(text = "Revenue"),
    gauge = list(
      shape = "bullet",
      axis = list(range = c(NULL, 300)),
      threshold = list(
        line= list(color = "black", width = 2),
        thickness = 0.75,
        value = 170),
      steps = list(
        list(range = c(0, 150), color = "gray"),
        list(range = c(150, 250), color = "lightgray")),
      bar = list(color = "black"))) %>%
  add_trace(
    type = "indicator",
    mode = "number+gauge+delta",
    value = 35,
    delta = list(reference = 200),
    domain = list(x = c(0.25, 1), y = c(0.4, 0.6)),
    title = list(text = "Profit"),
    gauge = list(
      shape = "bullet",
      axis = list(range = list(NULL, 100)),
      threshold = list(
        line = list(color = "black", width= 2),
        thickness = 0.75,
        value = 50),
      steps = list(
        list(range = c(0, 25), color = "gray"),
        list(range = c(25, 75), color = "lightgray")),
      bar = list(color = "black"))) %>%
  add_trace(
    type =  "indicator",
    mode = "number+gauge+delta",
    value = 220,
    delta = list(reference = 300 ),
    domain = list(x = c(0.25, 1), y = c(0.7, 0.9)),
    title = list(text = "Satisfaction"),
    gauge = list(
      shape = "bullet",
      axis = list(range = list(NULL, 300)),
      threshold = list(
        line = list(color = "black", width = 2),
        thickness = 0.75,
        value = 210),
      steps = list(
        list(range = c(0, 100), color = "gray"),
        list(range = c(100, 250), color = "lightgray")),
      bar = list(color = "black")))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="multi-bullet")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5910.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

#Reference

See [https://plot.ly/r/reference/#indicator](https://plot.ly/r/reference/#indicator) for more information and chart attribute options!
