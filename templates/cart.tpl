{% if settings.theme_variant == 'squared' %}
    <div class="section-cart-detail">
{% endif %}

        {% embed "snipplets/page-header.tpl" with {'breadcrumbs': true} %}
            {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
        {% endembed %}

        <div id="shoppingCartPage" class="cart-page container-fluid {% if settings.theme_variant == 'rounded' %}mt-2{% endif %} visible-when-content-ready" data-minimum="{{ settings.cart_minimum_value }}">
            <form action="{{ store.cart_url }}" method="post" class="cart-body" data-store="cart-form">
                <div class="row cart-body">
                    <div class="col-12 {% if cart.items %}col-md-8{% endif %} {% if settings.theme_variant == 'squared' %}pl-0 pr-0{% endif %}">
                        {# Cart alerts #}

                        {% if error.add %}
                            <div class="alert alert-warning {% if settings.theme_variant == 'squared' %}m-3{% endif %}">
                                {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
                            </div>
                        {% endif %}
                        {% for error in error.update %}
                            <div class="alert alert-warning {% if settings.theme_variant == 'squared' %}m-3{% endif %}">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</div>
                        {% endfor %}
                        {% if cart.items %}
                            <div class="js-ajax-cart-list cart-row mt-3 {% if settings.theme_variant == 'rounded' %}box{% endif %}">

                                {# Cart items #}

                                {% if cart.items %}
                                  {% for item in cart.items %}
                                    {% include "snipplets/cart-item-ajax.tpl" with {'cart_page': true} %}
                                  {% endfor %}
                                {% endif %}
                            </div>
                        {% else %}

                            {#  Empty cart  #}

                            <div class="alert alert-info {% if settings.theme_variant == 'squared' %}m-3{% endif %}">
                                {% if error %}
                                    {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}
                                    <a href="{{ store.products_url }}" class="btn btn-link p-none">{{ "ver otros acá" | translate }}</a>
                                {% else %}
                                    {{ "El carrito de compras está vacío." | translate }}
                                {% endif %}
                                {{ ("Ver más productos" | translate ~ " »") | a_tag(store.products_url) }}
                            </div>
                        {% endif %}
                        <div id="error-ajax-stock" style="display: none;">
                            <div class="alert alert-warning">
                                {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link ml-1">{{ "ver otros acá" | translate }}</a>
                            </div>
                        </div>

                        {% set show_cart_fulfillment = settings.shipping_calculator_cart_page and (store.has_shipping or store.branches) %}

                        {% if show_cart_fulfillment %}
                            <div class="mb-2 full-width-container">
                              {% include "snipplets/cart-shipping.tpl" %}
                            </div>
                        {% endif %}
                    </div>
                    {% if cart.items %}
                        <div class="col-12 col-md-4 pl-md-3 pr-md-3 pb-3 {% if settings.theme_variant == 'squared' %}border-left-md{% endif %}">
                            <div id="cart-sticky-summary" class="position-sticky-md {% if settings.theme_variant == 'rounded' %}box mt-md-3{% endif %}">
                                {% include "snipplets/cart-totals-and-cta.tpl" with {'cart_page': true} %}
                            </div>
                        </div>
                    {% endif %}
                </div>
            </form>
            <div id="store-curr" class="hidden">{{ cart.currency }}</div>
        </div>
{% if settings.theme_variant == 'squared' %}
    </div>
{% endif %}
