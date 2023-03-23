<!-- Footer -->

<footer id="footer" role="contentinfo">
 
 
 
<section id="footer-links" class="ali_footer" >         
    
    <div class="links_1">
          <div class="footer-logo ali_logo"> 
            <img src="{SITE_URL}storage/logo/{SITE_LOGO_FOOTER}" alt="Footer Logo">
          </div>
               <div class="mian_links">
                   <div class="upper_list">
                        <ul>      
                            <li><a href="{LINK_COMPANIES}">{LANG_COMPANIES}</a></li>      
                            
                            IF({LOGGED_IN}){
                                IF('{USERTYPE}' == "employer"){
                                    <li><a href="{LINK_JOB_SEEKERS}">{LANG_JOB_SEEKERS}</a></li>
                                {:IF}
                            {:IF}

                            <li><a href="{LINK_COUNTRIES}">{LANG_COUNTRIES}</a></li>
                            <li><a href="{LINK_CONTACT}">{LANG_CONTACT}</a></li>
                            <li><a href="/about">About Us</a></li>
                        </ul>  
                   </div>
                 
                    <div class="ali_links">
                        <ul>
                            <li><a href="/privacy">Privacy</a></li>
                            <li><a href="/terms">Terms</a></li>
                            <li><a href="/privacy/#ali_cookies">Cookies</a></li>
                            <li><a href="/subscription">Membership</a></li>
                            
                        </ul>
                    </div>
               </div>
    </div>

</section>
 
  <section id="footer-corporate">
  				
		<form role="form" method="post" action="{LINK_COUNTRIES}" autocomplete="off" accept-charset="utf-8" class="offside" id="footer-country">
      <button type="submit">
      </button>
    </form>			
    <span class="copyright">
            2023 JOBTOTOP, ALL RIGHTS RESERVED    
    </span>
  </section>
  
  
  
</footer>

IF({COOKIE_CONSENT}){
<!-- Cookie constent -->
<div class="cookieConsentContainer">
    <div class="cookieTitle">
        <h3>{LANG_COOKIES}</h3>
    </div>
    <div class="cookieDesc">
        <p>{LANG_COOKIES_MESSAGE}
            IF('{COOKIE_LINK}' != ''){
            <a href="{COOKIE_LINK}">{LANG_COOKIE_POLICY}</a>
            {:IF}
        </p>
        <div class="cookieButton">
            <a href="javascript:void(0)" class="button cookieAcceptButton">{LANG_COOKIES_ACCEPT}</a>
        </div>
    </div>

</div>
{:IF}

IF(!{LOGGED_IN}){
<!-- Sign In Popup -->
<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs popup-dialog">
        <ul class="popup-tabs-nav">
            <li><a href="#login">{LANG_LOGIN}</a></li>
        </ul>
        <div class="popup-tabs-container">
            <div class="popup-tab-content" id="login">
                <div class="welcome-text">
                    <h3>{LANG_WELCOME_BACK}</h3>
                    <span>{LANG_DONT_HAVE_ACCOUNT} <a href="{LINK_SIGNUP}">{LANG_SIGNUP_NOW}</a></span>
                </div>
                IF('{FACEBOOK_APP_ID}'!='' || '{GOOGLE_APP_ID}'!=''){
                <div class="social-login-buttons">
                    IF('{FACEBOOK_APP_ID}'!=''){
                    <button class="facebook-login ripple-effect" onclick="fblogin()"><i class="fa fa-facebook"></i> {LANG_LOGIN_VIA_FACEBOOK}</button>
                    {:IF}

                    IF('{GOOGLE_APP_ID}'!=''){
                    <button class="google-login ripple-effect" onclick="gmlogin()"><i class="fa fa-google"></i> {LANG_LOGIN_VIA_GOOGLE}</button>
                    {:IF}
                </div>
                <div class="social-login-separator"><span>{LANG_OR}</span></div>
                {:IF}
                <form id="login-form" method="post" action="{SITE_URL}login?ref={REF_URL}">
                    <div id="login-status" class="notification error" style="display:none"></div>
                    <div class="input-with-icon-left">
                        <i class="la la-user"></i>
                        <input type="text" class="input-text with-border" name="username" id="username"
                               placeholder="{LANG_USERNAME} / {LANG_EMAIL}" required/>
                    </div>

                    <div class="input-with-icon-left">
                        <i class="la la-unlock"></i>
                        <input type="password" class="input-text with-border" name="password" id="password"
                               placeholder="{LANG_PASSWORD}" required/>
                    </div>
                    <a href="{LINK_LOGIN}?fstart=1" class="forgot-password">{LANG_FORGOT_PASSWORD}</a>
                    <button id="login-button" class="button full-width button-sliding-icon ripple-effect" type="submit" name="submit">{LANG_LOGIN} <i class="icon-feather-arrow-right"></i></button>
                </form>
            </div>
        
    </div>
</div>
{:IF}

<script>
    var session_uname = "{USERNAME}";
    var session_uid = "{USER_ID}";
    var session_img = "{USERPIC}";
    // Language Var
    var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
    var LANG_ERROR = "{LANG_ERROR}";
    var LANG_CANCEL = "{LANG_CANCEL}";
    var LANG_DELETED = "{LANG_DELETED}";
    var LANG_ARE_YOU_SURE = "{LANG_ARE_YOU_SURE}";
    var LANG_YOU_WANT_DELETE = "{LANG_YOU_WANT_DELETE}";
    var LANG_YES_DELETE = "{LANG_YES_DELETE}";
    var LANG_JOB_DELETED = "{LANG_JOB_DELETED}";
    var LANG_RESUME_DELETED = "{LANG_RESUME_DELETED}";
    var LANG_EXPERIENCE_DELETED = "{LANG_EXPERIENCE_DELETED}";
    var LANG_COMPANY_DELETED = "{LANG_COMPANY_DELETED}";
    var LANG_SHOW = "{LANG_SHOW}";
    var LANG_HIDE = "{LANG_HIDE}";
    var LANG_HIDDEN = "{LANG_HIDDEN}";
    var LANG_TYPE_A_MESSAGE = "{LANG_TYPE_A_MESSAGE}";
    var LANG_ADD_FILES_TEXT = "{LANG_ADD_FILES_TEXT}";
    var LANG_ENABLE_CHAT_YOURSELF = "{LANG_ENABLE_CHAT_YOURSELF}";
    var LANG_JUST_NOW = "{LANG_JUST_NOW}";
    var LANG_PREVIEW = "{LANG_PREVIEW}";
    var LANG_SEND = "{LANG_SEND}";
    var LANG_FILENAME = "{LANG_FILENAME}";
    var LANG_STATUS = "{LANG_STATUS}";
    var LANG_SIZE = "{LANG_SIZE}";
    var LANG_DRAG_FILES_HERE = "{LANG_DRAG_FILES_HERE}";
    var LANG_STOP_UPLOAD = "{LANG_STOP_UPLOAD}";
    var LANG_ADD_FILES = "{LANG_ADD_FILES}";
    var LANG_CHATS = "{LANG_CHATS}";
    var LANG_NO_MSG_FOUND = "{LANG_NO_MSG_FOUND}";
    var LANG_ONLINE = "{LANG_ONLINE}";
    var LANG_OFFLINE = "{LANG_OFFLINE}";
    var LANG_TYPING = "{LANG_TYPING}";
    var LANG_GOT_MESSAGE = "{LANG_GOT_MESSAGE}";
</script>

<!-- <script src="./index_files/client" async="" defer=""></script> -->
<!-- Scripts -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/mmenu.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/tippy.all.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-select.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/snackbar.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/magnific-popup.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.cookie.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.nicescroll.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/slick.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js?ver={VERSION}"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js?ver={VERSION}"></script>

<script>
    /* THIS PORTION OF CODE IS ONLY EXECUTED WHEN THE USER THE LANGUAGE(CLIENT-SIDE) */
    $(function () {
        $('.language-switcher').on('click', '.dropdown-menu li', function (e) {
            var lang = $(this).data('lang');
            if (lang != null) {
                var res = lang.substr(0, 2);
                $('#selected_lang').html(res);
                $.cookie('Quick_lang', lang,{ path: '/' });
                location.reload();
            }
        });
    });
    $(document).ready(function () {
        var lang = $.cookie('Quick_lang');
        if (lang != null) {
            var res = lang.substr(0, 2);
            $('#selected_lang').html(res);
        }
    });
</script>
IF({LOGGED_IN} && '{QUICKCHAT_SOCKET_ON_OFF}'=='on'){
<script>
    var ws_protocol = window.location.href.indexOf("https://")==0?"wss":"ws";
    var ws_host = '{SOCKET_HOST}';
    var ws_port = '{SOCKET_PORT}';
    var WEBSOCKET_URL = ws_protocol+'://'+ws_host+':'+ws_port+'/quickchat';
    var filename = "{QUICKCHAT_SOCKET_SECRET_FILE}.php";
    var plugin_directory = "plugins/quickchat-socket/"+filename;
</script>
<link type="text/css" rel="stylesheet" media="all" href="{SITE_URL}plugins/quickchat-socket/assets/chatcss/chatbox.css"/>
<div id="quickchat-rtl"></div>
<script>
    if ($("body").hasClass("rtl")) {
        $('#quickchat-rtl').append('<link rel="stylesheet" type="text/css" href="{SITE_URL}plugins/quickchat-socket/assets/chatcss/chatbox-rtl.css">');
        var rtl = true;
    }else{
        var rtl = false;
    }
</script>
<!--Websocket Version Js-->
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/quickchat-websocket.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/smiley/js/emojione.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/smiley/smiley.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/lightbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/chatbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/assets/chatjs/chatbox_custom.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/uploader/plupload.full.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-socket/plugins/uploader/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<table id="lightbox" style="display: none;height: 100%">
    <tr><td height="10px"><p><img src="{SITE_URL}plugins/quickchat-socket/plugins/images/close-icon-white.png" width="30px" style="cursor: pointer"/></p></td></tr>
    <tr><td valign="middle"><div id="content"><img src="#"/></div></td></tr>
</table>
ELSEIF({LOGGED_IN} && '{QUICKCHAT_AJAX_ON_OFF}'=='on'){
<script>
    var filename = "{QUICKCHAT_AJAX_SECRET_FILE}.php";
    var plugin_directory = "plugins/quickchat-ajax/"+filename;
</script>
<link type="text/css" rel="stylesheet" media="all" href="{SITE_URL}plugins/quickchat-ajax/assets/chatcss/chatbox.css"/>
<div id="quickchat-rtl"></div>
<script>
    if ($("body").hasClass("rtl")) {
        $('#quickchat-rtl').append('<link rel="stylesheet" type="text/css" href="{SITE_URL}plugins/quickchat-ajax/assets/chatcss/chatbox-rtl.css">');
        var rtl = true;
    }else{
        var rtl = false;
    }
</script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/smiley/js/emojione.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/smiley/smiley.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/assets/chatjs/lightbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/assets/chatjs/chatbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/assets/chatjs/chatbox_custom.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/uploader/plupload.full.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/quickchat-ajax/plugins/uploader/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<table id="lightbox" style="display: none;height: 100%">
    <tr><td height="10px"><p><img src="{SITE_URL}plugins/quickchat-ajax/plugins/images/close-icon-white.png" width="30px" style="cursor: pointer"/></p></td></tr>
    <tr><td valign="middle"><div id="content"><img src="#"/></div></td></tr>
</table>

ELSEIF({LOGGED_IN} && '{ZECHAT_ON_OFF}'=='on'){
<script>
    var filename = "{ZECHAT_SECRET_FILE}.php";
    var plugin_directory = "plugins/zechat/"+filename;
</script>
<link type="text/css" rel="stylesheet" media="all" href="{SITE_URL}plugins/zechat/app/includes/chatcss/chat.css"/>
<div id="zechat-rtl"></div>
<script>
    if ($("body").hasClass("rtl")) {
        $('#zechat-rtl').append('<link rel="stylesheet" type="text/css" href="{SITE_URL}plugins/zechat/app/includes/chatcss/chat-rtl.css">');
        var rtl = true;
    }else{
        var rtl = false;
    }
</script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/plugins/smiley/js/emojione.min.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/plugins/smiley/smiley.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/includes/chatjs/lightbox.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/includes/chatjs/chat.js"></script>
<script type="text/javascript" src="{SITE_URL}plugins/zechat/app/includes/chatjs/custom.js"></script>
<script type="text/javascript"
        src="{SITE_URL}plugins/zechat/app/plugins/uploader/plupload.full.min.js"></script>
<script type="text/javascript"
        src="{SITE_URL}plugins/zechat/app/plugins/uploader/jquery.ui.plupload/jquery.ui.plupload.js"></script>

<table id="lightbox" style="display: none;height: 100%">
    <tr><td height="10px"><p><img src="{SITE_URL}plugins/zechat/app/plugins/images/close-icon-white.png" width="30px" style="cursor: pointer"/></p></td></tr>
    <tr><td valign="middle"><div id="content"><img src="#"/></div></td></tr>
</table>


{:IF}<script>!function(m,v,n){"use strict";var o=v.createElement("div"),e=v.createElement("ul"),t=v.createElement("li"),s=v.createElement("p"),a=v.createElement("section"),l=v.createElement("button"),c=v.createElement("canvas"),p=v.querySelector("body"),r=v.querySelector("#header"),i=v.querySelector("#footer");Element.prototype.matches||(Element.prototype.matches=Element.prototype.msMatchesSelector||Element.prototype.webkitMatchesSelector),Element.prototype.closest||(Element.prototype.closest=function(e){var t=this;do{if(t.matches(e))return t}while(null!==(t=t.parentElement||t.parentNode)&&1===t.nodeType);return null});var g=function(e,t,o,s,n,a,l,c){var r=new XMLHttpRequest,i;if("get"==s&&(e=e+(-1!==e.indexOf("?")?"&t=":"?t=")+Math.round(+new Date/1e3)),r.open(s,e),0<o.length)for(var u=0,d=o.length;u<d;u++)r.setRequestHeader(o[u].name,o[u].value);r.onload=function(){var e=r.getResponseHeader("Content-Type");200===r.status||304===r.status?a(r.responseText,{contentType:e,responseURL:r.responseURL||t}):l&&l(r.responseText,{contentType:e,responseURL:r.responseURL||t})},r.timeout=1e4,c&&(i=r.getResponseHeader("Content-Type"),r.ontimeout=function(){c(r.responseText,{contentType:i,responseURL:r.responseURL||t})}),"post"==s?r.send(n):r.send()},h=function(e,t){return e.dataset&&e.dataset[t]?e.dataset[t]:e.getAttribute("data-"+t)},u,d=function(){var e=o.cloneNode(!1);e.classList.add("scroll-measure"),p.appendChild(e);var t=e.offsetWidth-e.clientWidth;return p.removeChild(e),t}(),f=p.offsetWidth===m.innerWidth,y=function(e){return e&&decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*"+encodeURIComponent(e).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=\\s*([^;]*).*$)|^.*$"),"$1"))||null},L=function(e,t,o,s,n,a){if(!e||/^(?:expires|max\-age|path|domain|secure)$/i.test(e))return!1;var l="";if(o)switch(o.constructor){case Number:l=o===1/0?"; expires=Fri, 31 Dec 9999 23:59:59 GMT":"; max-age="+o;break;case String:l="; expires="+o;break;case Date:l="; expires="+o.toUTCString()}return document.cookie=encodeURIComponent(e)+"="+encodeURIComponent(t)+l+(n?"; domain="+n:"")+(s?"; path="+s:"")+(a?"; secure":""),!0},b=function(e,t,o){return!!this.hasItem(e)&&(document.cookie=encodeURIComponent(e)+"=; expires=Thu, 01 Jan 1970 00:00:00 GMT"+(o?"; domain="+o:"")+(t?"; path="+t:""),!0)},S=function(e){return!(!e||/^(?:expires|max\-age|path|domain|secure)$/i.test(e))&&new RegExp("(?:^|;\\s*)"+encodeURIComponent(e).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=").test(document.cookie)},q=function(){for(var e=document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g,"").split(/\s*(?:\=[^;]*)?;\s*/),t=e.length,o=0;o<t;o++)e[o]=decodeURIComponent(e[o]);return e},w=function(e){var e=e.querySelector("[autofocus]");e&&e.focus()},x=function(n,a,l){var c;return function(){var e=this,t=arguments,o=function(){c=null,l||n.apply(e,t)},s=l&&!c;m.clearTimeout(c),c=m.setTimeout(o,a),s&&n.apply(e,t)}},E=function(){for(var e=p.querySelectorAll(".acl"),t=0,o=e.length;t<o;t++)e[t].parentNode.removeChild(e[t])},k=function(){},A=function(c,r,e){var i=c.value.trim(),t,u,u,d,f,t,t;c.setAttribute("data-value",i),""!=i&&0!=i.length?(t=h(c,"lc")||"en_GB",u=10,u=m.innerWidth<=768?h(c,"mhm"):h(c,"mhd"),d=!1,f=h(c,"loctext"),h(c,"loc")&&(d=!0),t=["q="+i,"lc="+t],h(c,"ncc")&&t.push("ncc=1"),t=t.join("&"),g(e+"?"+t,null,[],"get",null,function(e,t){var o;if(0<(o=JSON.parse(e)).length){var s,o=o.slice(0,u),n='<div class="acl">';d&&(n+='<button type="button" class="geocode" tabindex="-1" data-target="'+h(c,"target2")+'">',n+='<svg class="icon"><use xlink:href="#icon-visor"/></svg>',n+=f,n+="</button>"),n+="<ul>";for(var a=0,l=o.length;a<l;a++)n+="<li>",n+='<button type="button" tabindex="-1" data-value="'+(s=o[a])+'" data-target="'+h(c,"target2")+'" class="acv">',n+=s.substr(0,i.length),n+="<b>"+s.substr(i.length,s.length)+"</b>",n+="</button>",n+="</li>";n+="</ul>",n+="</div>",E(),r.insertAdjacentHTML("beforeend",n),r.querySelector(".acl").classList.add("acl-on")}else E()},function(e,t){E()})):E()},C="function"==typeof v.createElement("form").checkValidity,T=function(e,t,o){if(C){var s=e.checkValidity();e.classList.remove("invalid"),e.classList.remove("valid");var n=e.querySelectorAll('[type="submit"]');if(s){e.classList.add("valid");for(var a=0,l=n.length;a<l;a++)n[a].removeAttribute("disabled"),n[a].disabled=!1;t&&t(e)}else{e.classList.add("invalid");for(var a=0,l=n.length;a<l;a++)n[a].setAttribute("disabled","disabled"),n[a].disabled=!0;o&&o(e)}}},_=function(e,t,o){e.form&&e.form.classList.contains("validate")&&e.closest(".validate")&&T(e.form||e.closest(".validate"),t,o)},N=null,R=null,H=function(){for(var e=p.querySelectorAll("form.validate"),t=0,o=e.length;t<o;t++)T(e[t])},M=!0,M="geolocation"in n,j=function(o,t){n.geolocation.getCurrentPosition(function(e){g(h(p,"reverse-geocode")+"?lat="+e.coords.latitude+"&lon="+e.coords.longitude,null,[{name:"X-Requested-With",value:"XMLHttpRequest"}],"get",null,function(e,t){var e=JSON.parse(e);o&&o(e)},function(e,t){o&&o(data)})},function(e){e.code==e.PERMISSION_DENIED?t&&t():D(o)},{enableHighAccuracy:!0,timeout:5e3,maximumAge:500})},D=function(o){g(h(p,"reverse-geocode"),null,[{name:"X-Requested-With",value:"XMLHttpRequest"}],"get",null,function(e,t){var e=JSON.parse(e);o&&o(e)},function(e,t){o&&o({})})},O=function(t,e){e.preventDefault(),t.closest(".geocode")&&(t=t.closest(".geocode"));var o=v.querySelector(h(t,"target")),s,e;o?(M="geolocation"in n,t.classList.add("geocode-wait"),s=function(e){e.l&&(o.value=e.l),o.classList.remove("wait"),t.classList.remove("geocode-wait"),_(o),o.focus();var e=o.closest(".find-location"),e;!e||(e=e.parentNode.querySelector(".location-suggestions"))&&(e.closest(".alert").remove(),o.classList.remove("fce"))},e=function(){o.classList.remove("wait"),t.classList.remove("geocode-wait"),o.focus();var e=2*o.value.length;o.setSelectionRange(e,e)},o.classList.add("wait"),M?j(s,e):D(s)):t.classList.remove("geocode-wait")},U=o.cloneNode(!1);U.id="modal-mask";var I=v.createElementNS("http://www.w3.org/2000/svg","svg"),W=v.createElementNS("http://www.w3.org/2000/svg","use");W.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href","#icon-wait"),I.appendChild(W),U.appendChild(I);var X=o.cloneNode(!1);X.id="modal";var I=o.cloneNode(!1);I.id="modal-inner";var $=a.cloneNode(!1);$.id="modal-dialog",$.role="document";var a=h(p,"modal-close-title")||"Close";I.appendChild($),I.insertAdjacentHTML("beforeend",'<button id="modal-close" class="modal-close"><svg class="icon"><use xlink:href="#icon-cross"/></svg><span class="sr">'+a+"</span></button>"),X.appendChild(I),p.appendChild(U),p.appendChild(X);var z=function(){return v.documentElement.classList.contains("modal-in")},J=function(e,t){t=t||[],U.classList.add("wait"),X.className="",0==t.length&&(t=["modal-std"]);for(var o=0,s=t.length;o<s;o++)X.classList.add(t[o]);p.clientHeight>m.innerHeight&&!f&&(p.style.paddingRight=d+"px",p.querySelector("#header").style.width="calc(100% - "+d+"px)"),v.documentElement.classList.add("modal-in"),B(e),v.querySelector("#modal-dialog > .modal-content")&&v.querySelector("#modal-dialog > .modal-content").classList.remove("sr")},B=function(e){G(),$.insertAdjacentHTML("afterbegin",e);var e=$.querySelector(".tab-panel .fc.fce");e&&openTab($.querySelector('a[href="#'+e.closest(".tab-panel").getAttribute("id")+'"]'));for(var t=$.querySelectorAll(".tabs li a"),o=0,s=t.length;o<s;o++)$.querySelector(t[o].getAttribute("href")+" .fc.fce")&&t[o].classList.add("error");m.setTimeout(function(){w($)},250)},F=function(){U.classList.remove("wait")},G=function(){var e=$.querySelector(".modal-content");e&&$.removeChild(e)},P=function(){m.setTimeout(function(){G(),v.documentElement.classList.remove("modal-in"),v.documentElement.style.height="",p.style.height="",U.classList.remove("wait"),p.style.paddingRight="",p.querySelector("#header").style.width="",X.className=""},100)},V=function(){var e=new Date(Date.now()+31536e6).toUTCString();L("cookie_consent",1,e,"/");var e=v.querySelector("#cookie-consent");e&&e.parentNode.removeChild(e)},Y=function(){v.documentElement.classList.toggle("nav-on")},K=function(e){for(var t=(e=e||p).querySelectorAll("img.lazy:not(.lazy-done):not(.lazy-err)"),o=function(){var e,t,l,e;p.classList.contains("rpk-done")||(e="http://www.w3.org/2000/svg",t="http://www.w3.org/1999/xlink",l=v.createElementNS(e,"svg"),(e=v.createElementNS(e,"use")).setAttributeNS(t,"xlink:href","#icon-user2"),l.appendChild(e),g(h(p,"rpk"),null,[],"get",null,function(e,t){for(var o=JSON.parse(e),s=p.querySelectorAll("img.photo"),n=0,a=s.length;n<a;n++)o.src?s[n].src=o.src:s[n].parentNode.replaceChild(l,s[n]);p.classList.add("rpk-done")},function(e,t){}))},s,n,a,l=0,c=t.length;l<c;l++)s=t[l],(n=h(s,"src"))?(s.onerror=function(e){this.classList.contains("photo")?o():this.classList.add("lazy-err")},s.onload=function(){this.classList.add("lazy-done"),this.removeAttribute("data-src")},s.src=n):s.classList.add("lazy-err")},Q=function(e,t,o,s){var n=JSON.parse(t);if(n.r)m.location.href=n.r;else{if(1==n.modal?(J(n.m,[]),K(v.querySelector("#modal-dialog")),"function"==typeof upload_file_init&&upload_file_init(v.querySelector("#modal-dialog")),"function"==typeof upload_photo_init&&upload_photo_init(v.querySelector("#modal-dialog")),H()):0==n.modal&&P(),n.xht){var a=p.querySelector(n.xht);if(a){var t=p.querySelectorAll(n.xht+" > *:not(h2)").length;n.x?a.outerHTML=n.x:a.outerHTML=n.m,w(a);for(var l=a.querySelectorAll("form.validate"),c=0,r=l.length;c<r;c++)T(l[c]);n.completeness&&(p.querySelector("#completeness").outerHTML=n.completeness),"undefined"!=typeof cv_builder_sections_drag_drop&&-1!=cv_builder_sections_drag_drop.indexOf(n.xht)&&cv_builder([n.xht]),v.querySelector("#cv-builder")&&n.add_section&&v.querySelector("#add-section")&&(v.querySelector("#add-section").outerHTML=n.add_section,0==t&&setTimeout(function(){m.scrollTo({behavior:"smooth",top:v.querySelector(n.xht).offsetTop-v.getElementById("header").offsetHeight-20})},300)),K(v.querySelector(n.xht))}}n.modal||n.xht||(e.outerHTML=n.m),n.utn&&(v.querySelector("#nav").outerHTML=n.utn,K(v.querySelector("#nav"))),F(),s&&s()}},Z=function(o,s){o.classList.add("wait"),o.disabled=!0;var n=o.getAttribute("href");h(o,"modal")&&(n+=-1!==n.indexOf("?")?"&mod="+h(o,"modal"):"?mod="+h(o,"modal")),g(n,null,[{name:"X-Requested-With",value:"XMLHttpRequest"}],"get",null,function(e,t){o.classList.remove("wait"),o.disabled=!1,Q(o,e,t,s),te(n)},function(e,t){o.classList.remove("wait"),o.disabled=!1,Q(o,e,t,s),te(n)},function(e,t){o.classList.remove("wait"),o.disabled=!1,te(n)})},ee=function(s,n){n&&(n.classList.add("wait"),n.disabled=!0);var a=s.getAttribute("action"),l=s.getAttribute("method"),c=null,e=function(){if("post"===l.toLowerCase()){for(var e=s.querySelectorAll('input[type="file"]:not([disabled])'),t=0,o=e.length;t<o;t++)0==e[t].files.length&&(e[t].setAttribute("disabled",""),e[t].disabled=!0);c=new FormData(s),n&&n.getAttribute("name")&&n.getAttribute("value")&&c.append(n.getAttribute("name"),n.getAttribute("value")),h(s,"modal")&&c.append("mod",h(s,"modal"))}else"get"===l.toLowerCase()&&(n&&n.getAttribute("name")&&n.getAttribute("value")&&(a=a+(-1!==a.indexOf("?")?"&":"?")+n.getAttribute("name")+"="+n.getAttribute("value")),h(s,"modal")&&(a=a+(-1!==a.indexOf("?")?"&mod=":"?mod=")+h(s,"modal")));g(a,null,[{name:"X-Requested-With",value:"XMLHttpRequest"}],l,c,function(e,t){n&&(n.classList.remove("wait"),n.disabled=!1),Q(s,e,t,null),te(a)},function(e,t){n&&(n.classList.remove("wait"),n.disabled=!1),Q(s,e,t,null),te(a)},function(e,t){n&&(n.classList.remove("wait"),n.disabled=!1),te(a)})};s.classList.contains("gcpc3")?gcpc3_init(s,function(){s.classList.contains("cjbc")?bot_challenge_get_token(s,function(){e()}):e()}):s.classList.contains("cjbc")?bot_challenge_get_token(s,function(){e()}):e()},te=function(e){var t;m.ga&&(/^((http|https):\/\/)/.test(e)||(e="https://"+window.location.host+e),ga("send",{hitType:"pageview",page:e}))},a=function(){var e=v.querySelector("#evf");e&&m.setTimeout(function(){e.click(),e.parentNode.removeChild(e)},500)},I=function(){var e,t,e;n.sendBeacon&&m.cjut&&(!(e=v.querySelector("#cjut"))||(t=h(e,"url"))&&((e=new FormData).append("d",m.cjut),n.sendBeacon(t,e)))},oe=function(e){var t,o;e&&h(e,"cjutd")&&h(e,"cjuturl")&&n.sendBeacon&&(t=h(e,"cjuturl"),(o=new FormData).append("d",h(e,"cjutd")),n.sendBeacon(t,o))},se=function(e){},ne;!function(e){var t;try{var o=Object.defineProperty({},"passive",{get:function(){t=!0}});e.addEventListener("test",null,o),e.removeEventListener("test",null,o)}catch(e){}return t}(m)||v.addEventListener("touchstart",function(){},{capture:!0,passive:!0});var ae=function(e){!0===e?p.addEventListener("touchmove",function(e){e.preventDefault()},!1):p.removeEventListener("touchmove",function(e){e.preventDefault()},!1)},le;(function(){var l=p.querySelectorAll(".recent-search-count");if(0!=l.length){for(var e=h(p,"recent-search-b"),t,o=["s","l","lid","cmp","ct","cp","radius"],s,n,a=[],c=0,r=l.length;c<r;c++)t=l[c],a.push(h(t,"d"));e=e+"?p="+a.join(".");var i=new XMLHttpRequest,e=e+(-1!==e.indexOf("?")?"&t=":"?t=")+Math.round(+new Date/1e3);i.open("get",e),i.onload=function(){var e,t=JSON.parse(i.responseText).c;if(t.length==l.length)for(var o,s,o,n=0,a=l.length;n<a;n++)s=(o=t[n]).c,o=o.m,0!=s&&s?l[n].classList.add("nonzero-count"):l[n].closest("a").href=h(l[n].closest("a"),"urlall"),l[n].closest("a").querySelector(".new .badge").innerHTML=o;else for(var n=0,a=l.length;n<a;n++)l[n].classList.remove("nonzero-count")},i.send()}})(),K(p),a(),I(),v.documentElement.addEventListener("click",function(e){var t=e.target,o,s,o,o;if("nav-toggle"==t.id||t.closest("#nav-toggle"))Y();else if(t.classList.contains("toggle")||t.closest(".toggle")){t.classList.contains("toggle")||(t=t.closest(".toggle")),(o=v.querySelector(h(t,"target")))&&(t.classList.toggle("on"),o.classList.toggle("sr"))}else if(t.classList.contains("confirm")||t.closest(".confirm")){e.preventDefault(),t.classList.contains("confirm")||(t=t.closest(".confirm"));var s=h(t,"confirm");if(!s)return!1;if(!m.confirm(s))return!1;"a"===t.nodeName.toLowerCase()&&(t.classList.contains("nav-xhr")?Z(t):m.location.href=t.href)}else if(t.closest(".nav-xhr")||t.classList.contains("nav-xhr"))e.preventDefault(),t.closest(".nav-xhr")&&(t=t.closest(".nav-xhr")),Z(t);else if("cookie-consent-ok"==t.id)V();else if(t.classList.contains("geocode")||t.closest(".geocode"))O(t,e);else if("modal"==t.id||"modal-mask"==t.id||"modal-close"==t.id||(t.classList.contains("modal-close")||t.closest(".modal-close"))&&t.closest("#modal"))e.preventDefault(),P();else if(t.closest(".ac")||!t.closest(".fc-clear")&&!t.classList.contains("fc-clear")){t.closest(".submit-xhr")&&("button"==t.nodeName.toLowerCase()&&"submit"==t.type||t.closest('[type="submit"]'))&&(e.preventDefault(),s=t.closest('[type="submit"]'),t.closest(".submit-xhr")&&(t=t.closest(".submit-xhr")),ee(t,s))}else{t.classList.contains("fc-clear")||(t=t.closest(".fc-clear"));var n=p.querySelector(h(t,"target"));if(!n)return;n.value="",n.focus()}if(t.classList.contains("aci")){if(!(o=h(t,"target"))||!p.querySelector(o))return;var n=h(t,"ac");if(!n)return;A(t,p.querySelector(o),n)}t.closest(".acl")&&("acv"===t.classList.contains||t.closest(".acv"))&&(e.preventDefault(),t.closest(".acv")&&(t=t.closest(".acv")),(o=p.querySelector(h(t,"target")))&&(o.value=h(t,"value"))),E(),(h(t,"cjutd")&&h(t,"cjuturl")||t.closest("[data-cjutd]")&&t.closest("[data-cjuturl]"))&&(t.closest("[data-cjutd]")&&t.closest("[data-cjuturl]")&&(t=t.closest("[data-cjutd]")),oe(t))},!1);var ce=function(e){e.classList.contains("fc-clear")||(e=e.closest(".fc-clear"));var t=p.querySelector(h(e,"target"));if(t){for(var o=v.querySelectorAll(".ac-geocode"),s=0,n=o.length;s<n;s++)o[s].disabled=!0;m.setTimeout(function(){t.value="",t.focus()},100),m.setTimeout(function(){for(var e=0,t=o.length;e<t;e++)o[e].disabled=!1},200)}};v.documentElement.addEventListener("mousedown",function(e){var t=e.target,o;t.closest(".ac")&&(t.closest(".fc-clear")||t.classList.contains("fc-clear"))?(e.preventDefault(),ce(t)):t.closest(".ac")&&(t.closest('button[type="submit"]')||"button"===t.nodeName.toLowerCase()&&"submit"==t.type)&&t.closest("form").submit()},!1),"ontouchstart"in v.documentElement&&v.documentElement.addEventListener("touchstart",function(e){var t=e.target,o;t.closest(".ac")&&(t.closest(".fc-clear")||t.classList.contains("fc-clear"))?(e.preventDefault(),ce(t)):t.closest(".ac")&&(t.closest('button[type="submit"]')||"button"===t.nodeName.toLowerCase()&&"submit"==t.type)&&t.closest("form").submit()},!1),v.documentElement.addEventListener("change",function(e){var t=e.target,o,s,n,a,n,a;if(t.classList.contains("fc-as"))(o=t.closest("form")).classList.contains("submit-xhr")?ee(o,t):o.submit();else if(t.closest(".list-interact")&&"checkbox"==t.type){if("toggle-all"==t.id)for(var o,l=(o=t.closest(".list-interact")).querySelectorAll('input[type="checkbox"]'),c=0,r=l.length;c<r;c++)l[c].checked=t.checked;else var o=t.closest(".list-interact");list_interact_process_checkboxes(o)}else if("cover-letter-template"==t.id){""!=(s=t.querySelector("option:checked")).value?(n=h(s,"title")||"",a=h(s,"text")||"",(n||a)&&(p.querySelector("#title").value=n,p.querySelector("#text").value=a)):(n=p.querySelector("#title"),a=p.querySelector("#text"),n.value=h(n,"original"),a.value=h(a,"original")),_(t)}else if(t.closest("#contact-us-form")&&"select"===t.nodeName.toLowerCase()){for(var i=v.querySelectorAll("#contact-us-form-displays > p"),c=0,r=i.length;c<r;c++)i[c].classList.add("sr");var a=v.querySelector("#contact-us-form-fields"),s,u,s;if(a.classList.add("sr"),"topic"==t.name){for(var d=v.querySelectorAll("#contact-us-form .subtopic"),c=0,r=d.length;c<r;c++)d[c].classList.add("sr"),d[c].querySelector("select").name="subtopic-wait";var s=t.options[t.selectedIndex],u=v.querySelector(h(s,"subtopic"));u&&(u.classList.remove("sr"),u.querySelector("select").name="subtopic")}else{"subtopic"==t.name&&(s=t.options[t.selectedIndex],u=h(s,"display-help"),s=h(s,"display-fields"),u&&v.querySelector(u)&&v.querySelector(u).classList.remove("sr"),1==s&&a.classList.remove("sr"))}}else if(h(t,"disable")&&"input"===t.nodeName.toLowerCase()){var f=p.querySelectorAll(h(t,"disable"));if(r=f.length)for(var c=0;c<r;c++)t.checked?f[c].disabled=!0:f[c].disabled=!1}else t.closest(".validate")&&_(t)},!1),m.screen.width<992&&v.querySelectorAll(".aci").forEach(function(e,t){e.addEventListener("blur",function(e){setTimeout(function(){E()},10)})}),v.onkeydown=function(e){var t=e.target,o=!1,s,n,e,a,e,o;(o="key"in(e=e||m.event)?"Escape"===e.key||"Esc"===e.key:27===e.keyCode)&&P(),t.classList.contains("aci")&&768<m.innerWidth&&(38!=e.keyCode&&40!=e.keyCode||(n=t.closest(t.getAttribute("data-target")).querySelector(".acl ul"))&&((e=(a=n.querySelector(".current"))?(a.classList.remove("current"),40==e.keyCode?a.nextSibling:a.previousSibling):n.querySelector(40==e.keyCode?"li:first-child":"li:last-child"))?(e.classList.add("current"),t.value=e.querySelector("button").getAttribute("data-value")):t.value=t.getAttribute("data-value")))},v.onkeyup=function(e){var t=e.target,o,e;!t.classList.contains("aci")||h(t,"value")==t.value||38==e.keyCode||40==e.keyCode||13==e.keyCode||(o=h(t,"target"))&&p.querySelector(o)&&((e=h(t,"ac"))&&A(t,p.querySelector(o),e))},v.documentElement.addEventListener("input",function(e){var e=e.target;e.closest("form.validate")&&_(e)},!1),v.documentElement.addEventListener("input",x(function(e){var t=e.target,e;h(t,"radiitarget")&&h(t,"radiioutput")&&(""!=(e=t.value.trim())&&location_radii_get(e,h(t,"radiioutput"),function(e){alert_radii_handle(e,h(t,"radiitarget"))}))},500),!1);var re=!1;m.addEventListener("scroll",function(){re||(re=!0,m.requestAnimationFrame(function(){100<m.pageYOffset?r.classList.remove("nb"):r.classList.add("nb"),re=!1}))},!1),v.documentElement.addEventListener("focus",function(e){var e=e.target;e.closest("#search-main")&&("s"==e.id||"l"==e.id)&&1025<=m.innerWidth&&e.closest(".row").classList.add("focus")},!0),v.documentElement.addEventListener("blur",function(e){var e=e.target;!e.closest("#search-main")||"s"!=e.id&&"l"!=e.id||e.closest(".row").classList.remove("focus")},!0)}(window,document,navigator);</script><div id="modal-mask"><svg><use xlink:href="#icon-wait"></use></svg></div><div id="modal"><div id="modal-inner"><section id="modal-dialog"></section><button id="modal-close" class="modal-close"><svg class="icon"><use xlink:href="#icon-cross"></use></svg><span class="sr">Close</span></button></div></div>

<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/9.15.0/firebase-app.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  const firebaseConfig = {
    apiKey: "AIzaSyD7zRPwYhyWtioTlOY7WVxNJjzpOhyFoSw",
    authDomain: "jobtotop-4702e.firebaseapp.com",
    projectId: "jobtotop-4702e",
    storageBucket: "jobtotop-4702e.appspot.com",
    messagingSenderId: "778881264803",
    appId: "1:778881264803:web:140f3d14959fb7047ea316"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  
  
  
  
  
  
  
</script>
</body>
</html>
