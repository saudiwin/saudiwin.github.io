+++
# Date this page was created.
date = "2017-08-05"

# Project title.
title = "Rethinking Two-way Fixed Effects: A Generative Model and Simulation for Time-Series Cross-Section Data"

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

What do we compare when we run a fixed effects (FE) model on time-series cross-sectional data? If we place
the FEs on the cases, then the coefficients compare one time point to another for the same case. If we place
the FEs on the time points, then the coefficients compare one case to another at the same point in time. If we
place the FEs on both the cases and time points in the same model — two-way FEs — then this model removes
confounders that are fixed over time or across cases, but at a cost: the coefficients combine cross-sectional and
temporal variance in a way that does not clearly describe how cases differ from one another or how these cases
change over time. We urge researchers to avoid employing two-way FEs and instead to focus on choosing a
model that directly speaks to the research question of interest.

Link to paper [here](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3062619).
