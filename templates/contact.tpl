{% embed "snipplets/page-header.tpl" %}
	{% if is_order_cancellation %}
		{% set form_title = "Pedí la cancelación de tu última compra" | translate %}
	{% else %}
		{% set form_title = "Contacto" | translate %}
	{% endif %}
	{% block page_header_text %}{{ form_title }}{% endblock page_header_text %}
{% endembed %}

{% set has_contact_info = store.whatsapp or store.phone or store.email or store.address or store.blog or store.contact_intro %}
<section class="contact-page">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-8">
				{% if is_order_cancellation %}
					<div class="text-center mb-4">
						<p>{{ "Si te arrepentiste, podés pedir la cancelación enviando este formulario." | translate }} </p>
						<a class="btn-link-primary" href="{{ status_page_url }}"><strong>{{'Ver detalle de la compra >' | translate}}</strong></a>
						{% if has_contact_info %}
							<h5 class="mb-1 mt-4">{{ 'Si tenés problemas con otra compra, contactanos:' | translate }}</h5>
						{% endif %}
					</div>
				{% endif %}
				{% if store.contact_intro %}
					<p class="mb-4 text-center">{{ store.contact_intro }}</p>
				{% endif %}
				{% if has_contact_info %}
					{% include "snipplets/contact-links.tpl" %}
				{% endif %}
				{% if product %}  
					<div class="mb-4">
						<div class="row align-items-center justify-content-md-center text-center">
							<div class="col-md-auto">
								<p>{{ "Estás consultando por el producto:" | translate }} <strong>{{ product.name | a_tag(product.url) }}</strong></p>
							</div>
							<div class="col-md-auto">
								<img src="{{ product.featured_image | product_image_url('thumb') }}" title="{{ product.name }}" alt="{{ product.name }}" />
							</div>
						</div>
					</div>
				{% endif %}	
				{% if contact %}
					{% if contact.success %}
						{% if is_order_cancellation %}
                            <div class="alert alert-success">{{ "¡Tu pedido de cancelación fue enviado!" | translate }} {{ "Vamos a ponernos en contacto con vos apenas veamos tu mensaje." | translate }} 
                            <br> 
                            <strong>{{ "Tu código de trámite es" | translate }} #{{ last_order_id }}</strong></div>
                        {% else %}
							<div class="alert alert-success">{{ "¡Gracias por contactarnos! Vamos a responderte apenas veamos tu mensaje." | translate }}</div>
						{% endif %}
					{% else %}
						<div class="alert alert-danger">{{ "Necesitamos tu nombre y un email para poder responderte." | translate }}</div>
					{% endif %}
				{% endif %}	
				
				{% embed "snipplets/forms/form.tpl" with{form_id: 'contact-form', form_custom_class: 'js-winnie-pooh-form', form_action: '/winnie-pooh', submit_name: 'contact', submit_text: 'Enviar' | translate, data_store: 'contact-form' } %}
					{% block form_body %}

						{# Hidden inputs used to send attributes #}

						<div class="winnie-pooh hidden">
							<label for="winnie-pooh">{{ "No completar este campo" | translate }}:</label>
							<input type="text" id="winnie-pooh" name="winnie-pooh">
						</div>
						<input type="hidden" value="{{ product.id }}" name="product"/>
	                	{% if is_order_cancellation %}
							<input type="hidden" name="type" value="order_cancellation" />
						{% else %}
							<input type="hidden" name="type" value="contact" />
						{% endif %}

						{# Name input #}

						{% embed "snipplets/forms/form-input.tpl" with{input_for: 'name', type_text: true, input_name: 'name', input_id: 'name', input_placeholder: 'Nombre' | translate } %}
						{% endembed %}

						{# Email input #}

						{% embed "snipplets/forms/form-input.tpl" with{input_for: 'email', type_email: true, input_name: 'email', input_id: 'email', input_placeholder: 'Email' | translate } %}
						{% endembed %}

						{% if not is_order_cancellation %}

							{# Phone input #}

							{% embed "snipplets/forms/form-input.tpl" with{input_for: 'phone', type_tel: true, input_name: 'phone', input_id: 'phone', input_placeholder: 'Teléfono' | translate } %}
							{% endembed %}

							{# Message textarea #}

							{% embed "snipplets/forms/form-input.tpl" with{text_area: true, input_for: 'message', input_name: 'message', input_id: 'message', input_rows: '7', input_placeholder: 'Mensaje' | translate } %}
						{% endembed %}

						{% endif %}

					{% endblock %}
				{% endembed %}
			</div>
		</div>
	</sdiv>
</section>