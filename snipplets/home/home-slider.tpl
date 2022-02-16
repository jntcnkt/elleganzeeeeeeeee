{% set has_main_slider = settings.slider and settings.slider is not empty %}
{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}

{% if not mobile %}
<div class="js-home-main-slider-container {% if not has_main_slider %}hidden{% endif %}">
{% endif %}
	<div class="{% if mobile %}js-home-mobile-slider{% else %}js-home-main-slider{% endif %}-visibility section-slider {% if has_main_slider and has_mobile_slider %}{% if mobile %}d-md-none{% else %}d-none d-md-block{% endif %}{% elseif not settings.toggle_slider_mobile and mobile %}hidden{% endif %}">
		<div class="js-home-slider{% if mobile %}-mobile{% endif %} nube-slider-home swiper-container">
		    <div class="swiper-wrapper">
		    	{% if mobile %}
		            {% set slider = settings.slider_mobile %}
		        {% else %}
		            {% set slider = settings.slider %}
		        {% endif %}
		        {% for slide in slider %}
		            <div class="swiper-slide slide-container">
		            	{% if slide.link %}
		            		<a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
		            	{% endif %}
		            	{% set has_text =  slide.title or slide.description or slide.button %}
		                	<div class="js-slider-slide slider-slide">
		                		{% set load_big_image = loop.first and ((has_main_slider and not has_mobile_slider) or (has_mobile_slider and mobile)) %}
		                		<img {% if load_big_image %}src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="slider-image"{% else %}src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="slider-image blur-up swiper-lazy" data-sizes="auto"{% endif %} alt="{{ 'Carrusel' | translate }} {{ loop.index }}"/>
		                		{% if has_text %}
		                			<div class="swiper-text swiper-{{ slide.color }}">
		                				{% if slide.description and settings.theme_variant == 'rounded' %}
			                				<div class="swiper-description mb-1">{{ slide.description }}</div>
			                			{% endif %}
			                			{% if slide.title %}
			                				<div class="swiper-title">{{ slide.title }}</div>
			                			{% endif %}
			                			{% if slide.description and settings.theme_variant == 'squared' %}
			                				<div class="swiper-description mt-4">{{ slide.description }}</div>
			                			{% endif %}
			                			{% if slide.button and slide.link %}
			                				<div class="btn btn-line btn-small swiper-btn mt-4">{{ slide.button }}</div>
			                			{% endif %}
			                		</div>
		            			{% endif %}
				            </div>
			            {% if slide.link %}
			            	</a>
			            {% endif %}
		        	</div>
		        {% endfor %}
		    </div>
		    <div class="js-swiper-home-control js-swiper-home-pagination{% if mobile %}-mobile{% endif %} swiper-pagination swiper-pagination-white"></div>
		    <div class="js-swiper-home-control js-swiper-home-prev{% if mobile %}-mobile{% endif %} swiper-button-prev">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "svg-inline--fa fa-w-8 fa-lg svg-icon-text"} %}</div>
		    <div class="js-swiper-home-control js-swiper-home-next{% if mobile %}-mobile{% endif %} swiper-button-next">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "svg-inline--fa fa-w-8 fa-lg svg-icon-text"} %}</div>
		</div>
	</div>
{% if not mobile %}
</div>
{% endif %}