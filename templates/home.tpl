{% set show_help = not (settings.slider | length) and not (settings.video_embed or settings.show_instafeed) and not has_products %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# **** This will show default products in the home page before you upload some products **** #}
{% if show_help %}
    {% snipplet 'defaults/show_help.tpl' %}
{% else %}

	{# END of show default products in the home page #}

	{#  **** Home slider ****  #}

	{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

	<section data-store="slider-main">
		{% include 'snipplets/home/home-slider.tpl' %}
		{% if has_mobile_slider %}
			{% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
		{% endif %}
	</section>
				
	{#  **** Features Order ****  #}
	{% set newArray = [] %}

	{% for section in ['home_order_position_1', 'home_order_position_2', 'home_order_position_3', 'home_order_position_4', 'home_order_position_5', 'home_order_position_6', 'home_order_position_7'] %}
	    {% set section_select = attribute(settings,"#{section}") %}

	    		

	    {% if section_select not in newArray %}

	    	{% if section_select == 'look' %}

				{#  **** Featured slider products ****  #}
				{% include 'snipplets/home/home-products-slider.tpl' %}

			{% elseif section_select == 'welcome' %}

				{#  **** Welcome message ****  #}
				{% include 'snipplets/home/home-welcome-message.tpl' %}

			{% elseif section_select == 'video' %}

				{#  **** Video embed ****  #}
				{% include 'snipplets/home/home-video.tpl' %}
				
		    {% elseif section_select == 'informatives' %}

		    	{#  **** Informative banners ****  #}
				{% include 'snipplets/banner-services/banner-services.tpl' %}

		    {% elseif section_select == 'categories' %}

		    	{#  **** Categories banners ****  #}
				{% include 'snipplets/home/home-banners.tpl' with {'textoverimage': true} %}

			{% elseif section_select == 'instafeed' %}

				{#  **** Instafeed ****  #}
				{% include 'snipplets/home/home-instafeed.tpl' %}

			{% elseif section_select == 'products' %}

		        {#  **** Featured products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' %}

		    {% endif %}
	   {% set newArray = newArray|merge([section_select]) %}
	   
	   {% endif %}

	{% endfor %}

{% endif %}

{# Newsletter #}
{% include "snipplets/newsletter.tpl" %}
