+++
# Date this page was created.
date = "2017-08-05"

# Project title.
title = "Why the Two-Way Fixed Effects Model Is Difficult to Interpret, and What to Do About It"

# Project summary to display on homepage.
summary = "Despite their popularity, linear fixed effects models can be a painful experience for applied researchers. Our paper shows that some of these problems stem from the wide application of the two-way fixed effects model as opposed to the simpler and easier to interpret one-way fixed effects models."

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "lfe_square.jpg"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["fixed effects",'methodology','time series cross section','TSCS']

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
image = "headers/lfe_header.jpg"
caption = "The ideal-typical scientist"

+++

# Abstract

The two-way fixed effects (FE) model, an increasingly popular method for modeling time-series cross-section (TSCS) data, is substantively difficult to interpret because the model's estimates are a complex amalgamation of variation in the over-time and cross-sectional effects. We demonstrate this complexity in the two-way FE estimate through mathematical exposition. As an illustration, we develop a novel simulation that enables us to generate TSCS data with varying over-time and cross-sectional effects and examine the behavior of the two-way FE model as these effects change. We demonstrate that the two-way FE model makes specific assumptions about TSCS datasets, and if these assumptions are not met, the model may be unidentified even if substantial variation exists along both dimensions. Because of the difficulty in interpretation, we do not recommend that applied researchers rely on the two-way FE model except for situations in which the assumptions are well-understood, such as the canonical difference-in-difference design.

Link to paper [here](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3062619).
