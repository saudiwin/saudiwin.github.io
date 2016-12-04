---
layout: intro
permalink: /
title:
image:
   feature: church_with_cross_tall.jpg
---

#### Political writing and analysis by Christians. Peer-reviewed and honest.

<div class="tiles">
{% for post in site.posts %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
