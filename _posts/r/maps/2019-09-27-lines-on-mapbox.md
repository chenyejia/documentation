---
title: Mapbox in R | Examples | Plotly
name: Lines on Mapbox
permalink: r/lines-on-mapbox/
description: How to draw a line on Map in R with plotly.
layout: base
thumbnail: thumbnail/line_mapbox.jpg
language: r
page_type: example_index
has_thumbnail: true
display_as: maps
order: 6
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

### Mapbox Access Token

To plot on Mapbox maps with Plotly you `may` need a Mapbox account and a public [Mapbox Access Token](https://www.mapbox.com/studio), that you can add to your [Plotly Settings](https://plot.ly/settings/mapbox). See our [Mapbox Map Layers](/python/mapbox-layers/) documentation for more information. If you're using a Chart Studio Enterprise server, please see additional instructions [here](https://help.plot.ly/mapbox-atlas).

### How to draw a Line on a Map

To draw a line on your map, you either can use [Scattermapbox](https://plot.ly/r/reference/#scattermapbox) or [scattergeo](https://plot.ly/r/reference/#scattergeo) trace type in plotly. This example uses scattermapbox and defines the drawing [mode](https://plot.ly/python/reference/#scattermapbox-mode) to the combination of markers and line.


```r
library(plotly)

p <- plot_ly(
  type = 'scattermapbox',
  mode = "markers+lines",
  lon = c(10, 20, 30),
  lat = c(10, 20,30),
  marker = list(size = 10)) %>%
  add_trace(
    type = 'scattermapbox',
    mode = "markers+lines",
    lon = c(-50, -60,40),
    lat = c(30, 10, -20),
    marker = list(size = 10)) %>%
  layout(
    mapbox = list(
      style = "stamen-terrain",
      center = list(lon = 10, lat= 10),
      zoom = 1),
    margin =list(l=0,t=0,b=0,r=0))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="line-scattermapbox")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5919.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

This example uses scattermapbox trace and shows how to customize hoverinfo in Mapbox.


```r
library(plotly)

us_cities = read.csv("https://raw.githubusercontent.com/plotly/datasets/master/us-cities-top-1k.csv")

df = us_cities[us_cities$State == c('Washington'),]


p <- plot_ly(
    df,
    lat= ~lat,
    lon= ~lon,
    type = 'scattermapbox',
    mode='markers+lines',
    marker=list(
      color = 'fuchsia',
      size = 10,
      opacity =0.8),
    color = list('color'),
    hovertext = ~City,
    hoverinfo = "lat+lon+text") %>%
  layout(
    mapbox=list(style = 'stamen-terrain',
                center = list(lat =47, lon = -122),
                zoom =5),
    margin=list(r = 0,t = 0, l = 0, b = 0))

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = api_create(p, filename="hover-scattermapbox")
chart_link
```

<iframe src="https://plot.ly/~RPlotBot/5921.embed" width="800" height="600" id="igraph" scrolling="no" seamless="seamless" frameBorder="0"> </iframe>

#Reference

See [https://plot.ly/r/reference/#scattermapbox](https://plot.ly/r/reference/#scattermapbox) for more information and options!
