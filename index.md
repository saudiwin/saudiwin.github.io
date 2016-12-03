---
layout: intro
permalink: /
title:
image:
   feature: church_with_cross_big.png
---

#### Political writing by and for young evangelicals. Peer-reviewed and honest.

<div class="tiles">
{% for post in site.posts %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
