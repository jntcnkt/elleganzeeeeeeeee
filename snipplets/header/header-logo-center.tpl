{% if settings.ad_bar and settings.ad_text %}
    <div class="js-addbar ad-container {% if theme_head_background == 'dark' %}ad-white{% endif %} p-bottom-quarter  p-top-quarter">
        {% snipplet "header/advertising.tpl" %}
    </div>
{% endif %}

<div class="js-desktop-head-container {% if settings.head_fix %}js-head-fixed{% endif %} head-{{ theme_head_background }} head-container transition-soft" data-store="head">
    <div class="container">
        <header>    
            <div class="row-fluid search-logo-cart-container">        
                <div class="span4 col-xs-3-custom">
                    {% if settings.tab_menu and not settings.search_fix %}    
                        <div class="js-toggle-mobile-search js-toggle-mobile-search-open mobile-search-btn text-center d-inline-block m-left-half visible-phone h5">
                            <div class="svg-icon-text">
                                {% include "snipplets/svg/search-regular.tpl" %}
                            </div>
                        </div>
                    {% endif %}
                    {% if not settings.tab_menu or ( settings.tab_menu and settings.search_fix ) %} 
                    <div class="js-modal-open text-center visible-phone pull-left" data-toggle="#nav-hamburger">
                        <div class="mobile-nav-first-row-icon p-relative svg-icon-text">
                            {% include "snipplets/svg/bars-regular.tpl" %} {{ 'Menú' | translate }}
                            {% if store.country == 'AR' and template == 'home' %}
                                <span class="js-quick-login-badge badge badge-primary badge-small badge-top m-right-half" style="display: none;"></span>
                            {% endif %}
                        </div>
                    </div>
                    {% endif %}
                    <div class="searchbox p-relative hidden-phone">
                        <form class="js-search-container js-search-form" action="{{ store.search_url }}" method="get">
                            <input class="js-search-input header-input form-control form-control-xs" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}"/>
                            <button type="submit" class="btn btn-desktop-search" value="{{ "Buscar" | translate }}" aria-label="{{ "Buscar" | translate }}">
                              {% include "snipplets/svg/search-regular.tpl" %}
                            </button>
                        </form>
                        <div class="js-search-suggest search-suggest">
                            {# AJAX container for search suggestions #}
                        </div>
                    </div>
                </div>
                <div class="span4 col-xs-6-custom logo-container">
                    {% if template == 'home' %}
                        <h1 class="mobile-logo-home text-center-xs">
                    {% endif %}
                        <div id="logo" class="mobile-logo-home logo-img-container {% if not has_logo %}hidden{% endif %}">
                            {{ store.logo('large') | img_tag(store.name, {class: 'logo-img  transition-soft-slow'}) | a_tag(store.url) }}
                        </div>
                        <div id="no-logo" {% if has_logo %} class="hidden" {% endif %}>
                            <a class="logo-text h1" href="{{ store.url }}">{{ store.name }}</a>
                        </div>
                    {% if template == 'home' %}
                        </h1>
                    {% endif %}
                </div>
                <div class="span4 hidden-phone text-right">
                    {% if languages | length > 1 %}
                        {% snipplet "header/languages.tpl" %}
                    {% endif %}
                    {% if store.has_accounts %}
                        {% snipplet "header/account.tpl" %}
                    {% endif %}
                    {% if not store.is_catalog and template != 'cart' %}
                        <div class="d-inline-block">
                            {% snipplet "header/cart-widget.tpl" as "cart" %}
                        </div>
                    {% endif %}
                </div>
                <div class="mobile-cart col-xs-3-custom text-right">
                    <div class="visible-phone">
                    {% if not settings.search_fix and not settings.tab_menu %}    
                        <div class="js-toggle-mobile-search js-toggle-mobile-search-open mobile-search-btn text-center d-inline-block h5">
                            <div class="svg-icon-text">
                                {% include "snipplets/svg/search-regular.tpl" %}
                            </div>
                        </div>
                    {% endif %}
                    {% if not store.is_catalog and template != 'cart' %}
                        <div class="d-inline-block">
                            {% snipplet "header/cart-widget.tpl" as "cart" %}
                        </div>
                    {% endif %}
                    </div>
                </div>

            </div>    
            <ul class="js-desktop-nav desktop-nav hidden-phone font-small" data-store="navigation">
                {% snipplet "navigation/navigation.tpl" %}
            </ul>
        </header>
        {% if settings.tab_menu %}
            <div class="js-mobile-head-second-row">
                {% snipplet "navigation/navigation-mobile-tabs-wide.tpl" %}
            </div>
        {% else %}       
            {% if settings.search_fix %}
            <div class="js-mobile-head-second-row searchbox search-fix visible-phone">
                <form class="js-search-container js-search-form" action="{{ store.search_url }}" method="get">
                    <input class="js-search-input header-input p-left-half form-control form-control-xs" autocomplete="off" type="search" name="q" placeholder="{{ 'Buscar' | translate }}" aria-label="{{ 'Buscador' | translate }}"/>
                    <button type="submit" class="btn btn-desktop-search" value="" aria-label="{{ 'Buscar' | translate }}">
                      {% include "snipplets/svg/search-regular.tpl" %}
                    </button>
                </form>
                <div class="js-search-suggest search-suggest">
                    {# AJAX container for search suggestions #}
                </div>
            </div>
            {% endif %} 
        {% endif %} 

    </div>
    {% include 'snipplets/notification.tpl' with {add_to_cart: true} %}
</div>