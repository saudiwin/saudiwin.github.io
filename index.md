---
layout: home
permalink: /
title:
image:
   feature: banner_tall.png
---

#### Political writing and analysis by Christians. Peer-reviewed and honest.

<div class="tiles">
{% for post in site.posts %}
	{% include post-grid.html %}
{% endfor %}
</div><!-- /.tiles -->
