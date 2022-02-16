{#/*============================================================================
style-async.scss.tpl

    -This file contains all the theme non critical styles wich will be loaded asynchronously
    -Rest of styling can be found in:
        -snipplets/css/style-colors.scss.tpl --> For color and font styles related to config/settings.txt
        -snipplets/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{#/*============================================================================
  Table of Contents

  #Components
    // Margin and padding
    // Mixins
    // Animations
    // Wrappers
    // Buttons
    // Chips
    // Forms
    // Icons    
    // Modals
    // Alerts and notifications
    // Captcha
  #Home page
    // Instafeed
    // Video
  #Header and nav
    // Nav
    // Search
  #Footer
    // Nav
    // Newsletter
    // Copyright
  #Product grid
    // Filters
  #Product detail
  	// Image
  	// Form and info
  #Cart
    // Table
    // Totals
  #Media queries
    // Min width 768px
      //// Components
      //// Home page
      //// Product grid
      //// Cart page
  #Critical path utilities
  #Theme variants
    // Square
      /Home
      /Product detail
    // Round
      /Components
      /Home
      /Product detail

==============================================================================*/#}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and padding  */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 30px;
}
%element-margin-small {
  margin-bottom: 20px;
}


{# /* // Mixins */ #}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
    #{'-' + $prefix + '-' + $property}: $value;
  }
  #{$property}: $value;
}


{# /* // Animations */ #}

.transition-soft {
  @include prefix(transition, all .3s ease, webkit ms moz o);
}
.transition-up {
  position: relative;
  top: -8px;
  @include prefix(transition, all 0.5s ease, webkit ms moz o);
  z-index: 10;
  pointer-events: none;
  &-active {
    top: 0;
    opacity: 1; 
    z-index: 100;
    pointer-events: all;
  }
}

.beat {
  animation: .8s 2 beat;
}
@keyframes beat {
  0% {
    @include prefix(transform, scale(1), webkit ms moz o);
  }
  25% {
    @include prefix(transform, scale(1.1), webkit ms moz o);
  }
  40% {
    @include prefix(transform, scale(1), webkit ms moz o);
  }
  60% {
    @include prefix(transform, scale(1.1), webkit ms moz o);
  }
  100% {
    @include prefix(transform, scale(1), webkit ms moz o);
  }
}

{# /* // Wrappers */ #}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding: 15px;
  &-title{
    margin-bottom: 30px;
    text-align: center;
    text-transform: uppercase;
    font-size: 12px;
  }
}

{# /* // Buttons */ #}

.btn-whatsapp {
  position: fixed;
  right: 10px;
  bottom: 10px;
  z-index: 100;
  color: white;
  background-color:#4dc247;
  box-shadow: 2px 2px 6px rgba(0,0,0,0.4);
  border-radius: 50%;
  svg{
    width: 45px;
    height: 45px;
    padding: 10px;
    fill: white;
    vertical-align:middle;
  }
}

.btn-transition {
  position: relative;
  overflow: hidden;
  .transition-container {
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    margin-top: -20px;
    opacity: 0;
    text-align: center;
    @include prefix(transition, all 0.5s ease, webkit ms moz o);
    cursor: not-allowed;
    pointer-events: none;
    &.btn-transition-progress{
      margin-top: -7px;
    }
    &.btn-transition-progress-small{
      margin-top: -11px;
      @include prefix(transform, scale(.7), webkit ms moz o);
    }
    &.btn-transition-success{
      margin-top: -10px;
    }
    &.btn-transition-success-small{
      margin-top: -7px;    
    }
    &.active {
      opacity: 1;
    }
  }
} 

{# /* // Chips */ #}

.chip {
  position: relative;
  margin: 0 5px 5px 0;
  padding: 10px 28px 10px 10px;
  &:focus {
    outline: 0;
  }
  &-remove-icon {
    position: absolute;
    top: 9px;
    right: 10px;
    width: 10px;
  }
}

{# /* // Forms */ #}

.form-quantity svg{
  cursor: pointer;
}

.radio-button{
  position: relative;
  width: 100%;
  float: left;
  clear: both;
  margin-bottom: 40px;
  font-weight: normal;
  text-align: left;
  cursor: pointer;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  &.disabled{
    opacity: 0.6;
    cursor: not-allowed;
    input[type="radio"] {
      cursor: not-allowed;
    }
  }
  &-content{
    position: relative;
    float: left;
    width: 100%;
  }
  &-icons-container{
    position: absolute;
    top: 3px;
    left: 0;
    width: 26px;
    height: 100%;
  }
  &-icon{
    float: left;
    border-radius: 50%;
    width: 18px;
    height: 18px;
  }
  &-label{
    width: 100%;
    float: left;
    margin-top: 6px;
    padding-left: 30px;
  }
}
.radio-button-item{
  &:only-child .radio-button,
  &:last-of-type .radio-button{
    margin-bottom: 0;
  }
}

.shipping-extra-options .radio-button-item:first-child .radio-button{
  margin-top: 40px;
}

.list-readonly {
  .list-item {
    width: 100%;
    float: left;
    clear: both;
    margin-bottom: 40px;
    &:only-child,
    &:last-of-type{
      margin-bottom: 0;
    }
  }
  .shipping-extra-options {
    .list-item:first-child{
      margin-top: 40px;
    }
    .radio-button-item:first-child .radio-button {
      margin-top: 0;
    }
  } 
  .radio-button-icons-container{
    display: none;
  }
  .radio-button-label,
  .radio-button{
    margin: 0;
    padding: 0;
    cursor: default;
  }
}

input,
select,
textarea{
  &[disabled],
  &[disabled]:hover,
  &[readonly],
  &[readonly]:hover{
    background-color: #DDD;
    cursor: not-allowed; 
  }
}

{# /* // Icons */ #}

.social-icon {
  display: inline-block;
  padding: 10px;
  font-size: 22px;
}

{# /* // Alerts and notifications */ #}

.alert {
  clear: both;
  padding: 8px;
  text-align: center;
  @extend %element-margin;
}

.notification-hidden{
  transition: all .1s cubic-bezier(.16,.68,.43,.99);
  @include prefix(transform, rotatex(90deg), webkit ms moz o);
  pointer-events: none;
}
.notification-visible{
  transition: all .5s cubic-bezier(.16,.68,.43,.99);
  @include prefix(transform, rotatex(0deg), webkit ms moz o);
}
.notification-floating .notification-close {
  position: absolute;
  top: 6px;
  right: 8px;
  z-index: 1;
  width: 24px; 
  cursor: pointer;
}

{# /* // Captcha */ #}

.g-recaptcha {
  margin-bottom: 24px;
}

.g-recaptcha > div {
  margin: 0 auto;
}

.grecaptcha-badge {
  bottom: 100px !important;
}

{# /* // Modals */ #}

.modal{
  position: fixed;
  top: 0;
  display: block;
  width: 80%;
  height: 100%;
  padding: 10px;
  -webkit-overflow-scrolling: touch;
  overflow-y: auto;
  @include prefix(transition, all .4s ease-in-out, webkit ms moz o);
  z-index: 20000;
  &-zindex-top{
    z-index: 20001;
  }
  &-fixed-wrapper{
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow-x: hidden;
    .modal-fixed-wrapper-content{
      .modal-header{
        padding: 0;
        margin-bottom: 10px;
      }
    }
    .modal-footer{
      width: 100%;
    }
  }
  &-header{
    width: 100%;
    *{
      display: inline;
      font-weight: bold;
    }
  }
  &-footer{
    padding: 10px 0;
    clear: both;
  }
  &-full{
    width: 100%;
  }
  &-docked-md{
    width: 100%;
  }
  &-docked-small{
    width: 80%;
  }
  &-top{
    top: -100%;
    left: 0;
  }
  &-bottom{
    top: 100%;
    left: 0;
  }
  &-left{
    left: -100%;
  }
  &-right{
    right: -100%;
    padding: 0;
    .modal-header{
      padding: 20px 20px 10px 20px;
    }
    .modal-fixed-wrapper{
      .modal-footer{
        padding: 0 20px 20px 20px;
      }
      &-content{
        padding: 30px 20px 0 20px;
      }
      .modal-fixed-wrapper-content{
        .modal-footer{
          padding: 0;
        }
      }
    }
  }
  .modal-fixed-wrapper{
    .modal-header{
      padding-bottom: 10px;
    }
  }
  &-centered{
    height: 100%;
    width: 100%;
    &-small{
      width: 80%;
      height: auto;
      margin: 0;
      left: 50%;
      @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
      .modal-body{
        min-height: 150px;
        max-height: 400px;
        overflow: auto;
      }
    }
  }
  &-top.modal-show,
  &-bottom.modal-show {
    top: 0;
    &.modal-centered-small{
      top: 50%;
    }
  }
  &-left.modal-show {
    left: 0;
  }
  &-right.modal-show {
    right: 0;
  }
  &-close { 
    display: inline;
    width: 25px;
    padding: 2px 5px 0 5px;
    cursor: pointer;
    &.left{
      float: left;
      padding: 5px 5px 0 0;
    }
    &.right{
      float: right;
    }
  }
  &-context-md{
    top: 100%;
  }
  .tab-group{
    width: 100%;
  }
}

.modal-overlay{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #00000047;
  z-index: 10000;
  // Cursor pointer added to JS is triggered on IOS
  cursor: pointer;
  &.modal-zindex-top{
    z-index: 20000;
  }
}

.modal-visible{
  overflow: hidden;
}

.fancybox-slide--html{
  .fancybox-content  {
    width: 100%;
    height: calc(100% - 70px) ;
    padding: 0;
    @include prefix(transform, translateY(20px), webkit ms moz o);
    background: transparent;
  }
  .fancybox-close-small {
    {# Hardcoded neutral color to match non iframe fancybox modal #}
    color: #ccc!important;
  }
}

.fancybox-toolbar {
  opacity: 1!important;
  visibility: visible!important;
  .fancybox-button {
    display: none!important;
    &.fancybox-button--close{
      display: block!important;
    }
  }
}

.fancybox-close-small {
  display: none!important;
}

{# /* // Tables */ #}

.table{
  width: 100%;
  border-collapse: collapse;
  border-spacing: 0;
  thead{
    th{
      padding: 8px;
      &:first-of-type{
        padding-left: 0;
      }
    }
  }
  td{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}


.tab-group{
  width: 100vw;
  padding: 0;
  overflow-x: scroll;
  white-space: nowrap;
  .tab{
    display: inline-flex;
    float: none;
    &-link{
      float: left;
      padding: 10px;
      text-align: center;
    }
  }
}

.tab-panel:not(.active){
  display: none;
}
.tab-panel.active{
  display: block;
}

{# /* Cards */ #}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	margin-bottom: 20px;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-clip: border-box;
  &-collapse {
    height: 52px;
    margin: 0;
    padding: 0;
    overflow: hidden;
    @include prefix(transition, all 0.3s ease, webkit ms moz o);
    &-toggle {
      position: absolute;
      top: 0;
      right: 0;
      padding: 10px 15px;
      @include prefix(transition, all 0.3s ease, webkit ms moz o);
      &.active {
        margin-top: 0;
        transform: rotate(90deg);
      }
    }
    &.active {
      height: calc(100% - 20px);
    }
  }
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 15px;
}

.card-header {
  margin-bottom: 0;
  {% if settings.theme_variant == 'squared' %}
    padding: 10px;
  {% else %}
    padding: 15px;
  {% endif %}
  &-collapse {
    padding-right: 50px;
    position: relative;
  }
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Nav */ #}

.modal-nav-hamburger .modal-footer {
  margin-bottom: -10px;
  padding: 0;  
}

.nav-primary {
  padding: 0 0 10px;
  .languages{
    float: left;
    margin: -20px 0 20px 0;

  }
  .search-container .search-input{
    border: 0;
    height: 60px;
    border-radius: 0;
  }
  .nav-list {
    margin: 0;
    padding: 10px 0 10px;
    list-style: none;
    .item-with-subitems {
      position: relative;
    }
    .nav-list-link {
      display: block;
      padding: 12px 0;
      font-size: 16px;
      font-weight: 700;
      }
    &-arrow {
      position: absolute;
      top: 7px;
      right: 0;
      width: 26px;
      padding: 2px 8px;
      cursor: pointer;
    }
    .selected .nav-list-arrow  {
      transform: rotate(90deg);
    }
    .list-subitems {
      padding: 0 0 0 5px;
      list-style: none;
      .nav-list-link {
        font-weight: 400;
        padding:10px 0;
        font-size: 14px;
      }
    }
  }

}

.nav-secondary {
  display: flex;
  margin: 0 -10px 0 -10px;
  padding: 15px 0;
  .nav-account {
    float: left;
    margin: 0;
    padding: 0;
    list-style: none;
    .nav-accounts-item {
      display: inline-block;
      margin: 5px 10px 0 0;
      font-size: 14px;
      font-weight: 300;
    } 
  }
}

.form-select-account-links {
  position: absolute;
  left: 0;
  width: 100%;
  padding: 10px;
  text-align: left;
}

.form-control-icon-account.selected {
  transform: rotate(90deg);
}

.hamburger-panel{
    box-shadow: none;
    .btn-hamburger-close {
        right: 15px;
        top: 6px;
        font-size: 18px;
    }
    .list-items {
        padding: 45px 0 10px;
        .hamburger-panel-link {
            display: block;
            padding: 20px;
            letter-spacing: 1px;
            font-weight: 400;
            border-bottom: 0;
        }
        .list-subitems { 
            padding: 0;
        }
    }
    .hamburger-panel-arrow {
        font-size: 12px;
        &.selected {
            transform: rotate(90deg);
        }
    }
    .hamburger-panel-first-row {
        background: none;
        .mobile-accounts{
            padding: 0 12px;
            .mobile-accounts-item {
                width: auto;
                display: inline-block;
                .mobile-accounts-link {
                    padding: 10px 5px;
                    font-size: 12px;
                    opacity: 0.6;
                }
                &:first-child a:after {
                position: relative;
                right: -7px;
                content: "|";
                }
            }
        }
    }
  &-arrow{
    top: 15px;
    right: 10px;
    margin-top: -10px;
    &.selected i{
      transform-origin: center;
      transform: rotate(180deg);
      -webkit-transform: rotate(180deg);
      -moz-transform: rotate(180deg);
      -ms-transform: rotate(180deg);
      -o-transform: rotate(180deg);
    }
  }
}

.account-user-icon {
  float: left;
  {% if settings.theme_variant == 'squared' %}
    width: 60px;
    height: 60px;
    margin: -15px 15px 0 0;
    line-height: 60px;
  {% else %}
    width: 30px;
    height: 30px;
    margin: 3px 15px 0 10px;
    line-height: 30px;
    border-radius: 100%;
  {% endif %}
  text-align: center;
  text-transform: uppercase;
}


{# /* // Search */ #}

.search-suggest{
  display: none;
  position: absolute;
  left: 0;
  width: 100%;
  z-index: 2000;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
  -webkit-overflow-scrolling: touch;
  &-list{
    margin: 0 10px 10px 10px;
    padding: 0;
  }
  &-item{
    padding: 10px 15px;
    list-style: none;
  }
  &-icon{
    margin: 0 10px;
    font-size: 14px;
  }
}

.head-main .search-suggest{
  width: 150%;
}

{#/*============================================================================
  #Footer
==============================================================================*/#}

footer {
  margin-top: 40px;
  padding: 40px 0; 
}

{# /* // Nav */ #}

.footer-menu {
  list-style: none;
  .footer-menu-item{
  }
}

{# /* // Newsletter */ #}

.section-newsletter-home {
  padding-top: 50px;
}

.footer-payments-shipping-logos {
  img {
    width: auto;
    max-height: 35px;
    margin: 2px;
    padding: 5px;
    border: 1px solid #eaeaea;
  }
}

{# /* // Copyright */ #}

.powered-by {
  &-text {
    display: inline-block;
    vertical-align: top;
  }
  &-logo {
    display: inline-block;
    width: 160px;
    margin-left: 2px;
  }
}

.footer-logo {
  img {
    max-width: 100px;
    margin: 2px;
  }
  &.seal-afip img {
    max-height: 35px;
  }
}

{#/*============================================================================
  #Home Page
==============================================================================*/#}

.section-newsletter-home {
  @extend %section-margin;
}

{# /* // Instafeed */ #}

.section-instafeed-home {
  position: relative;
  min-height: 100px;
}

.instafeed-title {
  position: absolute;
  top: 30px;
  left: 30px;
  z-index: 9;
  &-user {
    display: inline-block;
    margin: 0 0 0 5px;
    line-height: 28px;
    vertical-align: top;
    word-break: break-all;
  }
}

.section-instafeed-home .instafeed-link:first-child {
  width: 100%;
  padding-top: 100%;
}

.instafeed {
  &-link {
    position: relative;
    float: left;
    width: 50%;
    padding-top: 50%;
    overflow: hidden;
    &:hover .instafeed-img {
    opacity: 0.5;
    }
    &:hover .instafeed-info {
      opacity: 1;
    }
  }
  &-img {
    position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
  &-info {
    position: absolute;
    top: 50%;
    left: 50%;
    padding: 0;
    font-weight: 300;
    text-align: center;
    opacity: 0;
    transform: translate(-50%, -50%);
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
}

{# /* // Banners */ #}

.textbanner {
  &-image.overlay {
    opacity: 0.6;
    @include prefix(transition, all 0.8s ease, webkit ms moz o);
  }
  &:hover .textbanner-image.overlay,
  &:focus .textbanner-image.overlay {
    @include prefix(transform, scale(1.03), webkit ms moz o);
  }
}

{#/*============================================================================
  #Product Grid
==============================================================================*/#}

{# /* // Filters */ #}

.filter-color-container {
  position: relative;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin: 0 -10px;
}

.checkbox-container {
  position: relative;
  display: inline-block;
  margin: 0 8px 8px 0;
  .checkbox {
    position: relative;
    display: inline-block;
    height: 100%;
    padding: 12px 16px;
    font-size: 12px;
    font-weight: normal;
    text-align: left;
    cursor: pointer;
    &-color {
      display: inline-block;
      position: relative;
      width: 18px;
      height: 18px;
      vertical-align: middle;
    }
  }

  &.btn-filter-color {
    float: left;
    width: 50%;
    margin: 0;
    {% if settings.theme_variant == 'squared' %}
      line-height: 28px;
    {% endif %}
    .checkbox {
      width: 100%;
    }
  }
  &.color-filter .text-color{
    display: inline-block;
    width: calc(100% - 32px);
    margin-left: 10px;
    text-align: left;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    vertical-align: middle;
  }


  input {
    display: none;
    &:checked + .checkbox {
      opacity: 1;
    }
  }
  &.selected {
    padding-right: 25px;
    &:after {
      position: absolute;
      top: 12px;
      right: 16px;
    }  
    .checkbox {
      padding-right: 10px;
    }
  }
}

.filters-overlay {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 30000;
  width: 100%;
  height: 100%;
  .filters-updating-message {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 80%;
    text-align: center;
    @include prefix(transform, translate(-50%, -50%), webkit ms moz o);
    * {
      font-size: 24px;
    }
  }
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

body.compensate-for-scrollbar{overflow:hidden}.fancybox-active{height:auto}.fancybox-is-hidden{left:-9999px;margin:0;position:absolute!important;top:-9999px;visibility:hidden}.fancybox-container{-webkit-backface-visibility:hidden;height:100%;left:0;outline:none;position:fixed;-webkit-tap-highlight-color:transparent;top:0;-ms-touch-action:manipulation;touch-action:manipulation;-webkit-transform:translateZ(0);transform:translateZ(0);width:100%;z-index:99992}.fancybox-container *{box-sizing:border-box}.fancybox-bg,.fancybox-inner,.fancybox-outer,.fancybox-stage{bottom:0;left:0;position:absolute;right:0;top:0}.fancybox-outer{-webkit-overflow-scrolling:touch;overflow-y:auto}.fancybox-bg{background:#1e1e1e;opacity:0;transition-duration:inherit;transition-property:opacity;transition-timing-function:cubic-bezier(.47,0,.74,.71)}.fancybox-is-open .fancybox-bg{opacity:.9;transition-timing-function:cubic-bezier(.22,.61,.36,1)}.fancybox-caption,.fancybox-infobar,.fancybox-navigation .fancybox-button,.fancybox-toolbar{direction:ltr;opacity:0;position:absolute;transition:opacity .25s ease,visibility 0s ease .25s;visibility:hidden;z-index:99997}.fancybox-show-caption .fancybox-caption,.fancybox-show-infobar .fancybox-infobar,.fancybox-show-nav .fancybox-navigation .fancybox-button,.fancybox-show-toolbar .fancybox-toolbar{opacity:1;transition:opacity .25s ease 0s,visibility 0s ease 0s;visibility:visible}.fancybox-infobar{color:#ccc;font-size:13px;-webkit-font-smoothing:subpixel-antialiased;height:44px;left:0;line-height:44px;min-width:44px;mix-blend-mode:difference;padding:0 10px;pointer-events:none;top:0;-webkit-touch-callout:none;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.fancybox-toolbar{right:0;top:0}.fancybox-stage{direction:ltr;overflow:visible;-webkit-transform:translateZ(0);transform:translateZ(0);z-index:99994}.fancybox-is-open .fancybox-stage{overflow:hidden}.fancybox-slide{-webkit-backface-visibility:hidden;display:none;height:100%;left:0;outline:none;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:absolute;text-align:center;top:0;transition-property:opacity,-webkit-transform;transition-property:transform,opacity;transition-property:transform,opacity,-webkit-transform;white-space:normal;width:100%;z-index:99994}.fancybox-slide:before{content:"";display:inline-block;font-size:0;height:100%;vertical-align:middle;width:0}.fancybox-is-sliding .fancybox-slide,.fancybox-slide--current,.fancybox-slide--next,.fancybox-slide--previous{display:block}.fancybox-slide--image{overflow:hidden;padding:44px 0}.fancybox-slide--image:before{display:none}.fancybox-slide--html{padding:6px}.fancybox-content{background:#fff;display:inline-block;margin:0;max-width:100%;overflow:auto;-webkit-overflow-scrolling:touch;padding:44px;position:relative;text-align:left;vertical-align:middle}.fancybox-slide--image .fancybox-content{-webkit-animation-timing-function:cubic-bezier(.5,0,.14,1);animation-timing-function:cubic-bezier(.5,0,.14,1);-webkit-backface-visibility:hidden;background:transparent;background-repeat:no-repeat;background-size:100% 100%;left:0;max-width:none;overflow:visible;padding:0;position:absolute;top:0;-webkit-transform-origin:top left;transform-origin:top left;transition-property:opacity,-webkit-transform;transition-property:transform,opacity;transition-property:transform,opacity,-webkit-transform;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;z-index:99995}.fancybox-can-zoomOut .fancybox-content{cursor:zoom-out}.fancybox-can-zoomIn .fancybox-content{cursor:zoom-in}.fancybox-can-pan .fancybox-content,.fancybox-can-swipe .fancybox-content{cursor:-webkit-grab;cursor:grab}.fancybox-is-grabbing .fancybox-content{cursor:-webkit-grabbing;cursor:grabbing}.fancybox-container [data-selectable=true]{cursor:text}.fancybox-image,.fancybox-spaceball{background:transparent;border:0;height:100%;left:0;margin:0;max-height:none;max-width:none;padding:0;position:absolute;top:0;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;width:100%}.fancybox-spaceball{z-index:1}.fancybox-slide--iframe .fancybox-content,.fancybox-slide--map .fancybox-content,.fancybox-slide--pdf .fancybox-content,.fancybox-slide--video .fancybox-content{height:100%;overflow:visible;padding:0;width:100%}.fancybox-slide--video .fancybox-content{background:#000}.fancybox-slide--map .fancybox-content{background:#e5e3df}.fancybox-slide--iframe .fancybox-content{background:#fff}.fancybox-iframe,.fancybox-video{background:transparent;border:0;display:block;height:100%;margin:0;overflow:hidden;padding:0;width:100%}.fancybox-iframe{left:0;position:absolute;top:0}.fancybox-error{background:#fff;cursor:default;max-width:400px;padding:40px;width:100%}.fancybox-error p{color:#444;font-size:16px;line-height:20px;margin:0;padding:0}.fancybox-button{background:rgba(30,30,30,.6);border:0;border-radius:0;box-shadow:none;cursor:pointer;display:inline-block;height:44px;margin:0;padding:10px;position:relative;transition:color .2s;vertical-align:top;visibility:inherit;width:44px}.fancybox-button,.fancybox-button:link,.fancybox-button:visited{color:#ccc}.fancybox-button:hover{color:#fff}.fancybox-button:focus{outline:none}.fancybox-button.fancybox-focus{outline:1px dotted}.fancybox-button[disabled],.fancybox-button[disabled]:hover{color:#888;cursor:default;outline:none}.fancybox-button div{height:100%}.fancybox-button svg{display:block;height:100%;overflow:visible;position:relative;width:100%}.fancybox-button svg path{fill:currentColor;stroke-width:0}.fancybox-button--fsenter svg:nth-child(2),.fancybox-button--fsexit svg:nth-child(1),.fancybox-button--pause svg:nth-child(1),.fancybox-button--play svg:nth-child(2){display:none}.fancybox-progress{background:#ff5268;height:2px;left:0;position:absolute;right:0;top:0;-webkit-transform:scaleX(0);transform:scaleX(0);-webkit-transform-origin:0;transform-origin:0;transition-property:-webkit-transform;transition-property:transform;transition-property:transform,-webkit-transform;transition-timing-function:linear;z-index:99998}.fancybox-close-small{background:transparent;border:0;border-radius:0;color:#ccc;cursor:pointer;opacity:.8;padding:8px;position:absolute;right:-12px;top:-44px;z-index:401}.fancybox-close-small:hover{color:#fff;opacity:1}.fancybox-slide--html .fancybox-close-small{color:currentColor;padding:10px;right:0;top:0}.fancybox-slide--image.fancybox-is-scaling .fancybox-content{overflow:hidden}.fancybox-is-scaling .fancybox-close-small,.fancybox-is-zoomable.fancybox-can-pan .fancybox-close-small{display:none}.fancybox-navigation .fancybox-button{background-clip:content-box;height:100px;opacity:0;position:absolute;top:calc(50% - 50px);width:70px}.fancybox-navigation .fancybox-button div{padding:7px}.fancybox-navigation .fancybox-button--arrow_left{left:0;padding:31px 26px 31px 6px}.fancybox-navigation .fancybox-button--arrow_right{padding:31px 6px 31px 26px;right:0}.fancybox-caption{bottom:0;color:#eee;font-size:14px;font-weight:400;left:0;line-height:1.5;padding:25px 44px;right:0;text-align:center;z-index:99996}.fancybox-caption:before{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAD6CAQAAADKSeXYAAAAYklEQVQoz42RwQ3AMAgDjfcfup8WoRykfBAK5mQHKSz5rbXJPis1hjiV3CIqgG0hLZPkVkA4p4x5oR1bVeDrdCLrW2Q0D5bcwY3TGMHbdw3mPRuOtaspYP1w//G1OIcW148H0DMCqI/3mMMAAAAASUVORK5CYII=);background-repeat:repeat-x;background-size:contain;bottom:0;content:"";display:block;left:0;pointer-events:none;position:absolute;right:0;top:-44px;z-index:-1}.fancybox-caption a,.fancybox-caption a:link,.fancybox-caption a:visited{color:#ccc;text-decoration:none}.fancybox-caption a:hover{color:#fff;text-decoration:underline}.fancybox-loading{-webkit-animation:a 1s linear infinite;animation:a 1s linear infinite;background:transparent;border:4px solid #888;border-bottom-color:#fff;border-radius:50%;height:50px;left:50%;margin:-25px 0 0 -25px;opacity:.7;padding:0;position:absolute;top:50%;width:50px;z-index:99999}@-webkit-keyframes a{to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}@keyframes a{to{-webkit-transform:rotate(1turn);transform:rotate(1turn)}}.fancybox-animated{transition-timing-function:cubic-bezier(0,0,.25,1)}.fancybox-fx-slide.fancybox-slide--previous{opacity:0;-webkit-transform:translate3d(-100%,0,0);transform:translate3d(-100%,0,0)}.fancybox-fx-slide.fancybox-slide--next{opacity:0;-webkit-transform:translate3d(100%,0,0);transform:translate3d(100%,0,0)}.fancybox-fx-slide.fancybox-slide--current{opacity:1;-webkit-transform:translateZ(0);transform:translateZ(0)}.fancybox-fx-fade.fancybox-slide--next,.fancybox-fx-fade.fancybox-slide--previous{opacity:0;transition-timing-function:cubic-bezier(.19,1,.22,1)}.fancybox-fx-fade.fancybox-slide--current{opacity:1}.fancybox-fx-zoom-in-out.fancybox-slide--previous{opacity:0;-webkit-transform:scale3d(1.5,1.5,1.5);transform:scale3d(1.5,1.5,1.5)}.fancybox-fx-zoom-in-out.fancybox-slide--next{opacity:0;-webkit-transform:scale3d(.5,.5,.5);transform:scale3d(.5,.5,.5)}.fancybox-fx-zoom-in-out.fancybox-slide--current{opacity:1;-webkit-transform:scaleX(1);transform:scaleX(1)}.fancybox-fx-rotate.fancybox-slide--previous{opacity:0;-webkit-transform:rotate(-1turn);transform:rotate(-1turn)}.fancybox-fx-rotate.fancybox-slide--next{opacity:0;-webkit-transform:rotate(1turn);transform:rotate(1turn)}.fancybox-fx-rotate.fancybox-slide--current{opacity:1;-webkit-transform:rotate(0deg);transform:rotate(0deg)}.fancybox-fx-circular.fancybox-slide--previous{opacity:0;-webkit-transform:scale3d(0,0,0) translate3d(-100%,0,0);transform:scale3d(0,0,0) translate3d(-100%,0,0)}.fancybox-fx-circular.fancybox-slide--next{opacity:0;-webkit-transform:scale3d(0,0,0) translate3d(100%,0,0);transform:scale3d(0,0,0) translate3d(100%,0,0)}.fancybox-fx-circular.fancybox-slide--current{opacity:1;-webkit-transform:scaleX(1) translateZ(0);transform:scaleX(1) translateZ(0)}.fancybox-fx-tube.fancybox-slide--previous{-webkit-transform:translate3d(-100%,0,0) scale(.1) skew(-10deg);transform:translate3d(-100%,0,0) scale(.1) skew(-10deg)}.fancybox-fx-tube.fancybox-slide--next{-webkit-transform:translate3d(100%,0,0) scale(.1) skew(10deg);transform:translate3d(100%,0,0) scale(.1) skew(10deg)}.fancybox-fx-tube.fancybox-slide--current{-webkit-transform:translateZ(0) scale(1);transform:translateZ(0) scale(1)}@media (max-height:576px){.fancybox-caption{padding:12px}.fancybox-slide{padding-left:6px;padding-right:6px}.fancybox-slide--image{padding:6px 0}.fancybox-close-small{right:-6px}.fancybox-slide--image .fancybox-close-small{background:#4e4e4e;color:#f2f4f6;height:36px;opacity:1;padding:6px;right:0;top:0;width:36px}}.fancybox-share{background:#f4f4f4;border-radius:3px;max-width:90%;padding:30px;text-align:center}.fancybox-share h1{color:#222;font-size:35px;font-weight:700;margin:0 0 20px}.fancybox-share p{margin:0;padding:0}.fancybox-share__button{border:0;border-radius:3px;display:inline-block;font-size:14px;font-weight:700;line-height:40px;margin:0 5px 10px;min-width:130px;padding:0 15px;text-decoration:none;transition:all .2s;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;white-space:nowrap}.fancybox-share__button:link,.fancybox-share__button:visited{color:#fff}.fancybox-share__button:hover{text-decoration:none}.fancybox-share__button--fb{background:#3b5998}.fancybox-share__button--fb:hover{background:#344e86}.fancybox-share__button--pt{background:#bd081d}.fancybox-share__button--pt:hover{background:#aa0719}.fancybox-share__button--tw{background:#1da1f2}.fancybox-share__button--tw:hover{background:#0d95e8}.fancybox-share__button svg{height:25px;margin-right:7px;position:relative;top:-1px;vertical-align:middle;width:25px}.fancybox-share__button svg path{fill:#fff}.fancybox-share__input{background:transparent;border:0;border-bottom:1px solid #d7d7d7;border-radius:0;color:#5d5b5b;font-size:14px;margin:10px 0 0;outline:none;padding:10px 15px;width:100%}.fancybox-thumbs{background:#ddd;bottom:0;display:none;margin:0;-webkit-overflow-scrolling:touch;-ms-overflow-style:-ms-autohiding-scrollbar;padding:2px 2px 4px;position:absolute;right:0;-webkit-tap-highlight-color:transparent;top:0;width:212px;z-index:99995}.fancybox-thumbs-x{overflow-x:auto;overflow-y:hidden}.fancybox-show-thumbs .fancybox-thumbs{display:block}.fancybox-show-thumbs .fancybox-inner{right:212px}.fancybox-thumbs__list{font-size:0;height:100%;list-style:none;margin:0;overflow-x:hidden;overflow-y:auto;padding:0;position:absolute;position:relative;white-space:nowrap;width:100%}.fancybox-thumbs-x .fancybox-thumbs__list{overflow:hidden}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar{width:7px}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-track{background:#fff;border-radius:10px;box-shadow:inset 0 0 6px rgba(0,0,0,.3)}.fancybox-thumbs-y .fancybox-thumbs__list::-webkit-scrollbar-thumb{background:#2a2a2a;border-radius:10px}.fancybox-thumbs__list a{-webkit-backface-visibility:hidden;backface-visibility:hidden;background-color:rgba(0,0,0,.1);background-position:50%;background-repeat:no-repeat;background-size:cover;cursor:pointer;float:left;height:75px;margin:2px;max-height:calc(100% - 8px);max-width:calc(50% - 4px);outline:none;overflow:hidden;padding:0;position:relative;-webkit-tap-highlight-color:transparent;width:100px}.fancybox-thumbs__list a:before{border:6px solid #ff5268;bottom:0;content:"";left:0;opacity:0;position:absolute;right:0;top:0;transition:all .2s cubic-bezier(.25,.46,.45,.94);z-index:99991}.fancybox-thumbs__list a:focus:before{opacity:.5}.fancybox-thumbs__list a.fancybox-thumbs-active:before{opacity:1}@media (max-width:576px){.fancybox-thumbs{width:110px}.fancybox-show-thumbs .fancybox-inner{right:110px}.fancybox-thumbs__list a{max-width:calc(100% - 10px)}}

.thumbs{
  align-items: center;
  justify-content: center;
  .thumb-link {
    display: inline-block;
    position: relative;
    width: 100px;
    margin: 2px;
    vertical-align: top;
    opacity: 0.7;
    text-align: center;
    &:hover{
      opacity: 1;
    }
  }
  .thumb-image {
    width: 100%;
  }
}

.user-content img {
	max-width: 100%;
	height: auto !important;
}

.swiper-pagination-fraction.right{
  bottom: initial;
  left: initial;
  min-height: 30px;
  padding: 0 5px;
  font-size: 12px;
  font-weight: 300;
  line-height: 30px;
  transform: none;
}

{# /* // Form and info */ #}

.social-share-button {
  display: inline-block;
  padding: 8px;
  font-size: 20px;
  &:hover,
  &:focus{
    opacity: 0.8;
  }
}

.section-fb-comments {
  @extend %section-margin;
}

.section-products-related {
  margin-bottom: -40px; /* Negative margin for footer continuity */
}

.product-description {
  font-weight: 300;
}

{#/*============================================================================
  #Cart
==============================================================================*/#}


{# /* Table */ #}

.cart{
  &-footer{
    border-top: 1px solid rgba(0,0,0, 0.05);
  }
}

.cart-item{
  position: relative;
  @extend %element-margin-small;
  &-name{
    padding-right: 40px;
  }
  &-btn{
    padding: 6px;
    display: inline-block;
    background: transparent;
    font-size: 16px;
    opacity: 0.8;
    &:hover{
      opacity: 0.6;
    }
  }
  &-input{
    display: inline-block;
    width: 40px;
    height: 30px;
    font-size: 16px;
    text-align: center;
    -moz-appearance:textfield;
    &::-webkit-outer-spin-button,
    &::-webkit-inner-spin-button{
      -webkit-appearance: none;
    }
  }
  .fa-cog{
    display: none;
  }
  &-spinner{
    position: absolute;
    left: 50%;
    width: 40px;
    margin-left: -20px;
    text-align: center;
  }
  &-delete{
    position: absolute;
    right: 5px;
  }
  &-quantity {
    width: 130px;
  }
  .img-fluid {
    min-width: 100%;
  }
}

.cart-unit-price{
  float: left;
  width: 100%;
  margin: 5px 0 2px 0;
}

.cart-promotion-detail{
  float: left;
  width: 65%;
  text-align: left;
} 
.cart-promotion-number{
  position: absolute;
  right: 0;
  bottom: 0;
  float: right;
  text-align: right;
  font-weight: bold;
}


{# /* // Totals */ #}

.cart-subtotal{
  float: right;
  clear: both;
  margin: 0 0 10px 0;
}
.total-promotions-row{
  float: right;
  width: 100%;
  margin-bottom: 5px;
  position: relative;
  .cart-promotion-number{
    margin-left: 5px;
  }
}
.cart-total{
  clear: both;
  padding-top: 15px;
  margin-top: 5px;
  font-weight: bold;
  border-top: 1px solid rgba(0,0,0, 0.05);
}
.cart-promotion-detail{
  width: 65%;
  float: left;
}
.cart-promotion-number{
  position: absolute;
  right: 0;
  bottom: 0;
  width: 35%;
  float: right;
  margin: 0;
  text-align: right;
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}


{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* //// Components */ #}

  {# /*  Modals */ #}

  .modal{
    &-right{
    right: -100%;
      .modal-header{
        padding: 20px 30px 10px 30px;
      }
      .modal-fixed-wrapper{
        .modal-footer {
          padding: 0 30px 10px 30px;
        }
        &-content{
          padding: 30px 30px 0 30px;
        }
      }
    }
    &-centered{
      left: 10%;
      width: 80%;
      height: 80%;
      margin: 5% auto;
      &-small{
        left: 50%;
        width: 40%;
        height: auto;
        max-height: 80%;
        margin: 0;
        .modal-bottom.modal-show {
          top: 25%;
        }
      }
    }
    &-docked-md{
      width: 33.333%;
      min-width: 400px;
    }
    &-docked-small{
      width: 350px;
    }
    &-context-md{
      position: absolute;
      top: 50%;
      right: 0;
      left: initial;
      height: auto;
      width: 100%;
      max-height: 400px;
      margin: 0;
      opacity: 0;
      @include prefix(transition, all .2s ease-in-out, webkit ms moz o);
      &.modal-show.modal-top{
        top: calc(100% + 5px);
        opacity: 1;
      }
    }
    &-fixed-wrapper{
      &-content{
        height: 100%;
        overflow-y: auto;
        overflow-x: hidden;
      }
    }
  }

  .fancybox-slide--html .fancybox-content{
    width: 85%;
    height: auto;
    padding: 44px;
  }

  {# /*  Notifications */ #}

  .notification-floating .notification,
  .nav-secondary {
    width: 350px;
  }

  {# /* Tabs */ #}

  .tab-group{
    width: calc(100% + 20px);
    overflow-x: auto;
    white-space: normal;
    .tab{
      float: left;
    }
  }

  {# /* Footer */ #}

  .footer-menu {
    list-style: none;
    .footer-menu-item {  
      display: inline-block;
      padding: 0 15px;
    }
  }
  .copyright {
    padding: 0;
  }

  {# /* //// Home page */ #}

  {# /* // Products Slider */ #}

  .section-product-slider-home .item-image {
    height: 50vw;
  }

  .section-product-slider-home .item-image img {
    width: 100%;
    object-fit: cover;
  }

  {# /* // Featured Products */ #}

  .featured-title{
    align-items: center;
  }

  .featured-item{
    .square-item {
      height: calc(25vw + 120px);
      .item-image,
      img {
        height: 25vw;
        object-fit: cover;
        width: 100%;      
      }
    }
  }

  .featured-item-big{
    .square-item {
      height: calc(50vw + 240px);
      .item-image,
      img {
        max-height: none;
        height: calc(50vw + 120px);
      }
    }
  }

  {# /* Instafeed */ #}

  .section-instafeed-home .instafeed-link:first-child {
    width: 40%;
    padding-top: 40%;
  }
  .instafeed-link {
    width: 20%;
    padding-top: 20%;
  }
  
  {# /* Video */ #}

  .embed-responsive.embed-responsive-16by9 {
    padding-bottom: 56.25%;
  }
  .video-image {
    height: auto;
    width: 100%;
    max-width: 100%;
  }

  {# /* //// Product grid */ #}

  {# /* // Filters */ #}

  .filter-color-container {
    margin: 0;
    border: none;
  }

  .checkbox-container .checkbox {
    padding: 2px 15px;
  }

  .btn-filter {
    line-height: 26px;
    border-radius: 0;
    vertical-align: middle;
    &.color-filter {
      width: auto;
      margin: 0 8px 8px 0;
      border: none;
      .text-color {
        display: none;
      }
      .checkbox {
        padding: 0;
      }
      &.selected {
        padding: 0 22px 2px 7px;
        &:after {
          top: 2px;
          right: 8px; 
        }
      }
    }
    &.color-filter-custom {
      width: auto;
      margin: 0 8px 8px 0;
    }
    &.selected{
      padding-right: 20px;
      &:after {
        position: absolute;
        top: 3px;
        right: 12px;
      }  
    }
  }

  {# /* //// Cart page */ #}

  .cart-item-img {
    max-width: 130px;
  }

}

{#/*============================================================================
  #Theme Variants
==============================================================================*/ #}

{# /* The theme variants define changes on buttons, inputs and spacing */ #}

{% if settings.theme_variant == 'squared' %}
  
  {# /* // Square */ #}

  {# /* /Home */ #}

  .textbanner {
    &-image.overlay {
      opacity: 0.6;
      @include prefix(transition, all 0.5s ease, webkit ms moz o);
    }
    &:hover .textbanner-image.overlay,
    &:focus .textbanner-image.overlay {
      opacity: 0.4;
      @include prefix(transform, scale(1.03), webkit ms moz o);
    }
  }

  {# /* Instafeed */ #}

  .instafeed-user-fallback {
    font-size: 24px;
    font-weight: bold;
    line-height: inherit;
  }

  {# /* /Product detail */ #}

  .swiper-pagination-fraction.right{
    top: 0;
    right: 0;
  }

  {# /* /Media queries */ #}

  @media (min-width: 768px) {  

    {# /* Components */ #}

    .textbanner{
      .textbanner-title-with-btn,
      .textbanner-btn{
        @include prefix(transition, all 0.5s ease, webkit ms moz o);
      }
      &:hover .textbanner-title-with-btn,
      &:focus .textbanner-title-with-btn {
        bottom: 0;
      }
      &:hover .textbanner-btn,
      &:focus .textbanner-btn {
        opacity: 1;
      }
    }

    .instafeed-user-fallback{
      font-size: 40px;
    }
  }

  .checkbox-container {
    &.btn-filter-color {
      border-top: none;
      border-left: none;
    }
    .checkbox {
      line-height: 20px;
    }
  }


{% else %}

  {# /* // Round */ #}

  .section-slider,
  .textbanner {
    @extend %element-margin;
  }

  .social-icon {
    padding: 8px 20px;
    font-size: 16px;
  }

  {# /* /Components */ #}


  .main-content {
    @include prefix(transition, all 0.25s ease, webkit ms moz o);
  }
  .modal{
    border-radius: 10px;
  }
  .modal-visible {
    .main-content {
      @include prefix(transition, all 0.25s ease, webkit ms moz o);
    }
  }

  .notification-floating .notification{
    border-radius: 10px;
    @include prefix(box-shadow,  0 0 10px 0 rgba(0,0,0,0.08), webkit ms moz o);
  }

  .btn-filter,
  .chip,
  .card-img{
    border-radius: 10px;
  }

  .btn-whatsapp {
    right: 30px;
    bottom: 30px;
  }
  
  .form-select-account-links {
    border-radius: 0 0 15px 15px;
  }

  .card-footer {
    padding: 15px;
  }

  {# /* /Filter */ #}

  .filter-color-container {
    margin: 0 -2px;
  }
  .checkbox-container {
    border-radius: 40px;
    .checkbox {
      border-radius: 40px;
      &-color {
        width: 22px;
        height: 22px;
        border-radius: 100%;
      }
    }

    &.btn-filter-color {
      width: calc(50% - 12px);
      margin: 4px;
      .checkbox {
        width: 100%;
        line-height: 20px;
      }
    }
    &.color-filter .text-color{
      display: inline-block;
      width: calc(100% - 36px);
      margin-left: 10px;
      text-align: left;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      vertical-align: middle;
    }

    input {
      display: none;
      &:checked ~ .checkbox {
        opacity: 1;
      }
    }
    &.selected {
      padding-right: 25px;
      &:after {
        position: absolute;
        top: 12px;
        right: 16px;
      }  
      .checkbox {
        padding-right: 10px;
      }
    }
  }


  {# /* /Home */ #}

  .item-buy-variants {
    margin: 0 20px 20px;
    padding: 20px 10px 10px;
    opacity: 0;
    @include prefix(transition, opacity 0.2s ease-in, webkit ms moz o);
    &.visible {
      opacity: 1;
      @include prefix(transition, opacity 0.4s ease-out, webkit ms moz o);
      @include prefix(transition-delay, 0.2s, webkit ms moz o);
    }
  }
  .instafeed-title {
    position: relative;
    top: 0px;
    left: auto;
    z-index: 9;
    &-user {
      line-height: 45px;
      vertical-align: bottom;
    }
    i {
      font-size: 45px;
      line-height: 45px;
    }
  }
  .instafeed-container {
    margin: 0 -10px;
    .instafeed-img {
      padding: 10px;
    }
  }

  .textbanner {
    &-image.overlay {
      opacity: 0.8;
    }
    &:hover .textbanner-image.overlay,
    &:focus .textbanner-image.overlay {
      opacity: 0.5;
    }
  }

  {# /* /Product detail */ #}

  .swiper-pagination-fraction.right{
    top: 10px;
    right: 10px;
  }

  {# /* /Media queries */ #}

  @media (min-width: 768px) {  

    {# /* Components */ #}

    .modal{
      &-docked-md,
      &-docked-small{
        padding: 20px 10px;
      }
    }
    .section-product-slider-home .item-image {
      height: 30vw;
    }


    {# /* // Filters */ #}


    .btn-filter {
      line-height: 26px;
      vertical-align: middle;
      &.color-filter {
        width: auto;
        margin: 0 8px 8px 0;
        border: none;
        .text-color {
          display: none;
        }
        &.selected {
          padding: 0 22px 2px 7px;
          &:after {
            right: 8px;
            top: 2px;
          }
        }
      }
      &.color-filter-custom {
        width: auto;
        margin: 0 8px 8px 0;
      }
      &.selected{
        padding-right: 20px;
        &:after {
          position: absolute;
          top: 3px;
          right: 12px;
        }  
      }
    }

  }
  
{% endif %}

{#/*============================================================================
  #Critical path utilities
==============================================================================*/#}

.visible-when-content-ready{
  visibility: visible!important;
}
.display-when-content-ready{
  display: block!important;
}
