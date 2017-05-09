+++
# Date this page was created.
date = "2016-05-04"

# Project title.
title = "Absence Makes the Ideal Points Sharper: An Ordinal IRT Model for Complete-Data Rollcall Vote Modeling"

# Project summary to display on homepage.
summary = "I put forward a Bayesian IRT model that is capable of handling legislator absence as a form of data that can increase the precision of ideal point estimates."

# Optional image to display on homepage (relative to `static/img/` folder).
image_preview = "irt_square.jpg"

# Tags: can be used for filtering projects.
# Example: `tags = ["machine-learning", "deep-learning"]`
tags = ["bayesian",'item response theory','rollcall']

# Optional external URL for project (replaces project detail page).
external_link = ""

# Does the project detail page use math formatting?
math = false

# Optional featured image (relative to `static/img/` folder).
[header]
image = "headers/irt_header.jpg"
caption = "The US Capitol building in Washington, DC"

+++

I put forward a Bayesian IRT model that can handle legislators absences as a separate category of data for determining legislator ideal points. The estimation uses the concept of a hurdle model to deflate the probabilities of legislator's votes by the probability of absences. The model produces a single set of ideal points, but utilizes different parameters for bill absence points. Compared to DW-Nominate, this model tends to produce more moderate estimates of US Congresspeople's ideal points because it can model roll-call votes where there are very few opposing votes. For parliamentary data, the model provides much more precise estimates, especially in legislatures with very high rates of absence. Additionally, the model can incorporate absentions as a middle category between yes and no votes for legislatures with high rates of abstentions.

An R package providing this model, along with other standard IRT ideal point models, is under development. Current source code is available via [Github](https://github.com/saudiwin/idealstan). The estimation is done via MCMC with the Stan modeling language.
