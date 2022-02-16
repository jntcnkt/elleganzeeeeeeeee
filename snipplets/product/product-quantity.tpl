{# Product quantity #}
{% if product.available and product.display_price %}
    {% if not has_one_variant or not product.variations %}
    <div class="form-row">
    {% endif %}
    <div class="{% if product.variations %}{% if has_one_variant %}col-6 {% else %}col-12{% endif %}{% else %}col-12{% endif %} col-md-6">
        <label class="form-label">{{ 'Cantidad' | translate }}</label>
        {% embed "snipplets/forms/form-input.tpl" with{
        type_number: true, input_value: '1', 
        input_name: 'quantity' ~ item.id, 
        input_custom_class: 'js-quantity-input text-center h5', 
        input_label: false, 
        input_append_content: true, 
        input_group_custom_class: 'js-quantity form-quantity', 
        form_control_container_custom_class: 'col', 
        input_min: '1',
        input_aria_label: 'Cambiar cantidad' | translate } %}
            {% block input_prepend_content %}
            <div class="row m-0 align-items-center">
                <span class="js-quantity-down text-center btn">
                    {% include "snipplets/svg/minus.tpl" %}
                </span>
            {% endblock input_prepend_content %}
            {% block input_append_content %}
                <span class="js-quantity-up text-center btn">
                    {% include "snipplets/svg/plus.tpl" %}
                </span>
            </div>
            {% endblock input_append_content %}
        {% endembed %}
    </div>
    {% if not has_one_variant or not product.variations %}
    </div>
    {% endif %}
{% endif %}