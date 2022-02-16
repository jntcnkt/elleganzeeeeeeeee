{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}
{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}

{% include 'snipplets/grid/category-controls.tpl' %}

{% if not show_help %}
<section class="category-body {% if settings.theme_variant != 'squared' %}mt-5{% endif %}" data-store="category-grid-{{ category.id }}">
	<div class="container-fluid p-0">
		{% if products %}
	        <div class="js-product-table product-table row no-gutters">
	        	{% include 'snipplets/product_grid.tpl' %}
	        </div>
	        {% if pages.current == 1 and not pages.is_last %}
             	<div class="js-load-more text-center mt-5 mb-5">
	                <a class="btn btn-primary d-inline-block">
	                	<span class="js-load-more-spinner" style="display:none;">{% include "snipplets/svg/sync.tpl" with {svg_custom_class : "svg-inline--fa fa-spin svg-icon-primary"} %}</span>{{ 'Mostrar más productos' | t }}
	                </a>
	            </div>
	             <div id="js-infinite-scroll-spinner" class="mt-5 mb-5 text-center w-100" style="display:none">
                    {% include "snipplets/svg/sync.tpl" with {svg_custom_class : "svg-inline--fa fa-2x fa-spin svg-icon-text"} %}
                </div>
	        {% endif %}
	    {% else %}
	        <p class="text-center">
	            {{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
	        </p>
	    {% endif %}
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
	{% include 'snipplets/defaults/show_help_category.tpl' %}
{% endif %}