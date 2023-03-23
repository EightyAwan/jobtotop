var lastClickedMarker,searchClicked,mapAutoZoom,map,automaticGeoLocation=!1;function heroMap(e,t,a,o,l,n,i){if(null!=document.getElementById(a)){if(i||(i=14),!s)var s=0;var r=$("#map").attr("data-map-zoom"),d=$("#map").attr("data-map-scroll");if(void 0!==r&&!1!==r)parseInt(r);else;if(void 0!==d&&!1!==d)var c=parseInt(d);else c=!1;function m(e){navigator.geolocation?navigator.geolocation.getCurrentPosition(function(t){var a=t.coords.latitude,o=t.coords.longitude;$("#latitude").val(a),$("#longitude").val(o),mapCenter=new google.maps.LatLng(a,o),map.panTo(mapCenter),getcityStateOnDrag(a,o),$("#map").removeClass("fade-map"),e("success")}):alert("Geolocation is not supported by this browser.")}map=new google.maps.Map(document.getElementById(a),{zoom:i,scrollwheel:c,center:new google.maps.LatLng(e,t),mapTypeId:google.maps.MapTypeId.ROADMAP,zoomControl:!1,mapTypeControl:!1,scaleControl:!1,panControl:!1,navigationControl:!1,streetViewControl:!1,styles:[{featureType:"poi",elementType:"labels.text.fill",stylers:[{color:"#747474"},{lightness:"23"}]},{featureType:"poi.attraction",elementType:"geometry.fill",stylers:[{color:"#f38eb0"}]},{featureType:"poi.government",elementType:"geometry.fill",stylers:[{color:"#ced7db"}]},{featureType:"poi.medical",elementType:"geometry.fill",stylers:[{color:"#ffa5a8"}]},{featureType:"poi.park",elementType:"geometry.fill",stylers:[{color:"#c7e5c8"}]},{featureType:"poi.place_of_worship",elementType:"geometry.fill",stylers:[{color:"#d6cbc7"}]},{featureType:"poi.school",elementType:"geometry.fill",stylers:[{color:"#c4c9e8"}]},{featureType:"poi.sports_complex",elementType:"geometry.fill",stylers:[{color:"#b1eaf1"}]},{featureType:"road",elementType:"geometry",stylers:[{lightness:"100"}]},{featureType:"road",elementType:"labels",stylers:[{visibility:"off"},{lightness:"100"}]},{featureType:"road.highway",elementType:"geometry.fill",stylers:[{color:"#ffd4a5"}]},{featureType:"road.arterial",elementType:"geometry.fill",stylers:[{color:"#ffe9d2"}]},{featureType:"road.local",elementType:"all",stylers:[{visibility:"simplified"}]},{featureType:"road.local",elementType:"geometry.fill",stylers:[{weight:"3.00"}]},{featureType:"road.local",elementType:"geometry.stroke",stylers:[{weight:"0.30"}]},{featureType:"road.local",elementType:"labels.text",stylers:[{visibility:"on"}]},{featureType:"road.local",elementType:"labels.text.fill",stylers:[{color:"#747474"},{lightness:"36"}]},{featureType:"road.local",elementType:"labels.text.stroke",stylers:[{color:"#e9e5dc"},{lightness:"30"}]},{featureType:"transit.line",elementType:"geometry",stylers:[{visibility:"on"},{lightness:"100"}]},{featureType:"water",elementType:"all",stylers:[{color:"#d2e7f7"}]}]}),$(".geo-location i").on("click",function(){$("#map").addClass("fade-map"),$(this).addClass("fa-circle-o-notch fa-spin"),$(this).removeClass("fa-crosshairs"),m(function(e){$(".geo-location > i").fadeOut("slow")})}),1==automaticGeoLocation&&($("#map").addClass("fade-map"),m(function(e){$(".geo-location > i").fadeOut("slow")})),1==s?google.maps.event.addListener(map,"idle",function(){if(1!=searchClicked){map.getBounds().getNorthEast().lat(),map.getBounds().getNorthEast().lng(),map.getBounds().getSouthWest().lat(),map.getBounds().getSouthWest().lng();null!=f&&f.clearMarkers(),T(ajaxurl+"?action=getlocHomemap")}}):google.maps.event.addListenerOnce(map,"idle",function(){T(ajaxurl+"?action=getlocHomemap")}),1==n&&$(".hero-section .map").addClass("show-marker-labels");var p=document.createElement("div");new function(e,t){p.index=1,t.controls[google.maps.ControlPosition.RIGHT_CENTER].push(p),e.style.padding="5px",e.className="zoomControlWrapper";var a=document.createElement("div");e.appendChild(a);var o=document.createElement("div");o.className="custom-zoom-in",a.appendChild(o);var l=document.createElement("div");l.className="custom-zoom-out",a.appendChild(l),google.maps.event.addDomListener(o,"click",function(){t.setZoom(t.getZoom()+1)}),google.maps.event.addDomListener(l,"click",function(){t.setZoom(t.getZoom()-1)})}(p,map);var g,u=$("#scrollEnabling");$(u).click(function(e){e.preventDefault(),$(this).toggleClass("enabled"),$(this).is(".enabled")?map.setOptions({scrollwheel:!0}):map.setOptions({scrollwheel:!1})});var f,y=[],v=[],h=[];function _(e){for(y=[],g=0;g<e.length;g++){var t,a,l=document.createElement("div");a=null!=e[g].marker_image?e[g].marker_image:path+"assets/img/default.png",1==e[g].featured?l.innerHTML='<div class="marker" data-id="'+e[g].id+'"><div class="title">'+e[g].title+'</div><div class="marker-wrapper"><div class="pin"><div class="image" style="background-image: url('+a+');"></div></div></div>':l.innerHTML='<div class="marker" data-id="'+e[g].id+'"><div class="title">'+e[g].title+'</div><div class="marker-wrapper"><div class="pin"><div class="image iconPosition"><i class="'+e[g].cat_icon+'"></i></div></div></div></div>',e[g].latitude&&e[g].longitude&&e[g].address?n(g,"latitudeLongitude"):!e[g].address||e[g].latitude||e[g].longitude?e[g].latitude&&e[g].longitude&&!e[g].address?n(g,"latitudeLongitude"):console.log("No location coordinates"):n(g,"address")}function n(a,n){if("latitudeLongitude"==n)t=new RichMarker({position:new google.maps.LatLng(e[a].latitude,e[a].longitude),map:map,draggable:!1,content:l,flat:!0}),google.maps.event.addListener(t,"click",function(e,t){return function(){"sidebar"==o?r($(this.content.firstChild).attr("data-id")):"gmapAdBox"==o?s($(this.content.firstChild).attr("data-id"),this,t):"modal"==o&&openModal($(this.content.firstChild).attr("data-id"),"modal_item.php")}}(0,a)),y.push(t);else if("address"==n){a;var i=new google.maps.Geocoder,d={address:e[a].address};i.geocode(d,function(e){return function(a,l){if(l==google.maps.GeocoderStatus.OK){if(t=new RichMarker({position:a[0].geometry.location,map:map,draggable:!1,content:e,flat:!0}),y.push(t),c(),1==mapAutoZoom){for(var n=new google.maps.LatLngBounds,i=0;i<y.length;i++)n.extend(y[i].getPosition());map.fitBounds(n)}google.maps.event.addListener(t,"click",function(){"sidebar"==o?r($(this.content.firstChild).attr("data-id")):"gmapAdBox"==o?s($(this.content.firstChild).attr("data-id"),this,0):"modal"==o&&openModal($(this.content.firstChild).attr("data-id"),"modal_item.php")})}else console.log("Geocode failed "+l)}}(l))}if(1==mapAutoZoom){var m=new google.maps.LatLngBounds;for(a=0;a<y.length;a++)m.extend(y[a].getPosition());map.fitBounds(m)}}var i;function s(e,t,a){$.ajax({url:ajaxurl+"?action=openlocatoionPopup",dataType:"html",data:{id:e},method:"POST",success:function(o){gmapAdBoxOptions={content:o,disableAutoPan:!1,pixelOffset:new google.maps.Size(-135,-50),zIndex:null,alignBottom:!0,boxClass:"gmapAdBox-wrapper",enableEventPropagation:!0,closeBoxMargin:"0px 0px -8px 0px",closeBoxURL:path+"/assets/img/close-btn.png",gmapAdBoxClearance:new google.maps.Size(1,1)},null!=i&&i.close(),y[a].gmapAdBox=new gmapAdBox(gmapAdBoxOptions),y[a].gmapAdBox.open(map,t),i=y[a].gmapAdBox,setTimeout(function(){$(".item.gmapAdBox[data-id="+e+"]").parent().addClass("show")},10),google.maps.event.addListener(y[a].gmapAdBox,"closeclick",function(){$(lastClickedMarker).removeClass("active")})},error:function(){console.log("error")}})}function r(e){$.ajax({url:ajaxurl+"?action=sidebar_detail",data:{id:e},method:"POST",success:function(e){$(".sidebar-wrapper").html(e),$(".results-wrapper").removeClass("loading"),initializeOwl(),ratingPassive(".sidebar-wrapper .sidebar-content"),initializeFitVids(),socialShare(),initializeReadMore(),$(".sidebar-wrapper .back").on("click",function(){$(".results-wrapper").removeClass("show-detail"),$(lastClickedMarker).removeClass("active")}),$(document).keyup(function(e){switch(e.which){case 27:$(".sidebar-wrapper .back").trigger("click")}}),$(".results-wrapper").addClass("show-detail")},error:function(e){console.log("error "+e)}})}$(".marker").live("mouseenter",function(){var e=$(this).attr("data-id");$(".results-wrapper .results-content .result-item[data-id="+e+"] a").addClass("hover-state")}).live("mouseleave",function(){var e=$(this).attr("data-id");$(".results-wrapper .results-content .result-item[data-id="+e+"] a").removeClass("hover-state")}),$(".marker").live("click",function(){$(this).attr("data-id");$(lastClickedMarker).removeClass("active"),$(this).addClass("active"),lastClickedMarker=$(this)});var d=[{url:path+"assets/img/cluster.png",height:36,width:36}];function c(){[],v=[],h=[];for(var e=0;e<y.length;e++)map.getBounds().contains(y[e].getPosition())?(h.push(y[e]),v.push($(y[e].content.firstChild).attr("data-id")),y[e].setVisible(!0)):y[e].setVisible(!1);f.repaint()}f=new MarkerClusterer(map,y,{styles:d,maxZoom:16,ignoreHidden:!0}),google.maps.event.addListener(map,"idle",function(){c()}),c()}function T(e,t){if(void 0===t)t=$("#hero-home-map").serialize();$.ajax({url:e,dataType:"json",method:"GET",data:t,cache:!1,success:function(e){if(0!=e){for(var t=0;t<y.length;t++)y[t].setMap(null);e,_(e)}},error:function(e){console.log(e)}})}$("[data-ajax-response='map']").on("click",function(e){e.preventDefault();var t=ajaxurl+"?action=getlocHomemap";searchClicked=1,1==$(this).attr("data-ajax-auto-zoom")&&(mapAutoZoom=5);var a=$(this).closest("form").serialize();null!=f&&f.clearMarkers(),T(t,a)}),autoComplete(map)}}function reloadMap(){google.maps.event.trigger(map,"resize")}function simpleMap(e,t,a,o,l){var n;if(o||(o=!1),l){n={address:l},(new google.maps.Geocoder).geocode(n,function(e,t){if(t==google.maps.GeocoderStatus.OK){var a=e[0].geometry.location.lat(),o=e[0].geometry.location.lng();i(new google.maps.LatLng(a,o)),getcityStateOnDrag(a,o)}else console.log("Geocode failed"),console.log(t)})}else i(new google.maps.LatLng(e,t)),getcityStateOnDrag(e,t);function i(e){var t={zoom:14,center:e,disableDefaultUI:!0,scrollwheel:!0,styles:[{featureType:"all",elementType:"labels.icon",stylers:[{visibility:"off"}]},{featureType:"landscape",stylers:[{saturation:-100},{lightness:60}]},{featureType:"road.local",stylers:[{saturation:-100},{lightness:40},{visibility:"on"}]},{featureType:"transit",stylers:[{saturation:-100},{visibility:"simplified"}]},{featureType:"administrative.province",stylers:[{visibility:"off"}]},{featureType:"water",stylers:[{visibility:"on"},{lightness:30}]},{featureType:"road.highway",elementType:"geometry.fill",stylers:[{color:color},{lightness:40}]},{featureType:"road.highway",elementType:"geometry.stroke",stylers:[{visibility:"off"}]},{featureType:"poi.park",elementType:"geometry.fill",stylers:[{color:color},{lightness:60},{saturation:-40}]},{}]},l=document.getElementById(a),n=new google.maps.Map(l,t),i=new RichMarker({position:e,map:n,draggable:o,content:"<img src="+path+"/images/marker.png>",flat:!0});google.maps.event.addListener(i,"dragend",function(){var e=this.position.lat(),t=this.position.lng();$("#latitude").val(e),$("#longitude").val(t),getcityStateOnDrag(e,t)}),autoComplete(n,i)}function s(e){navigator.geolocation?navigator.geolocation.getCurrentPosition(function(t){var a=t.coords.latitude,o=t.coords.longitude;$("#latitude").val(a),$("#longitude").val(o),i(new google.maps.LatLng(a,o)),getcityStateOnDrag(a,o),e("success")}):alert("Geolocation is not supported by this browser.")}$(".geo-location i").on("click",function(){jQuery(this).addClass("fa-circle-o-notch fa-spin"),jQuery(this).removeClass("fa-crosshairs"),s(function(e){$(".geo-location > i").fadeOut("slow")})}),1==automaticGeoLocation&&s(function(e){})}function autoComplete(e,t){if($("#address-autocomplete").length){e||(e=new google.maps.Map(document.getElementById("address-autocomplete")));var a=document.getElementById("address-autocomplete");if(getCity&&"all"!=getCountry)var o={types:["(cities)"],componentRestrictions:{country:getCountry}};else if("all"!=getCountry)o={componentRestrictions:{country:getCountry}};else o={};var l=new google.maps.places.Autocomplete(a,o);l.bindTo("bounds",e),google.maps.event.addListener(l,"place_changed",function(){var a=l.getPlace();$("#latitude").val(a.geometry.location.lat()),$("#longitude").val(a.geometry.location.lng());a.geometry.location.lat(),a.geometry.location.lng();if(a.geometry){e.setCenter(a.geometry.location),e.setZoom(14),t?(t.setPosition(a.geometry.location),t.setVisible(!0),$("#latitude").val(t.getPosition().lat()),$("#longitude").val(t.getPosition().lng()),i()):i();a.address_components&&[a.address_components[0]&&a.address_components[0].short_name||"",a.address_components[1]&&a.address_components[1].short_name||"",a.address_components[2]&&a.address_components[2].short_name||""].join(" ")}});var n={locality:"long_name",administrative_area_level_2:"long_name",administrative_area_level_1:"long_name",country:"long_name"};function i(){var e=l.getPlace();for(var t in n)null!=document.getElementById(t)&&(document.getElementById(t).value="",document.getElementById(t).disabled=!1);for(var a=0;a<e.address_components.length;a++){var o=e.address_components[a].types[0];if(n[o]){var i=e.address_components[a][n[o]];null!=document.getElementById(o)&&(document.getElementById(o).value=i)}}}}}function getcityStateOnDrag(e,t){$.getJSON("https://maps.googleapis.com/maps/api/geocode/json?latlng="+e+","+t,function(e){if(jsondt=e.results,"0"!=jsondt.length){var t=jsondt[0].address_components,a=null,o=null,l=null,n=null,s=null;for(i=0;i<t.length;++i){var r=t[i].types;d(r,"locality")&&""!=(a=t[i].long_name)&&$("#locality").val(a),d(r,"administrative_area_level_2")&&""!=(o=t[i].long_name)&&$("#administrative_area_level_2").val(o),d(r,"administrative_area_level_1")&&""!=(l=t[i].long_name)&&$("#administrative_area_level_1").val(l),d(r,"country")&&""!=(n=t[i].long_name)&&$("#country-input").val(n),null!=o&&null!=l&&null!=n&&""!=(s=o+", "+l+", "+n)&&$("#address-autocomplete").val(s)}function d(e,t){for(z=0;z<e.length;++z)if(e[z]==t)return!0;return!1}}else console.log("address_components not found")})}function pinMapByAddress(e){$.getJSON("http://maps.googleapis.com/maps/api/geocode/json?address="+e+"&sensor=false",function(e){if(jsondt=e.results,"0"!=jsondt.length){var t=jsondt[0].address_components,a=null,o=null,l=null,n=null,s=null;for(i=0;i<t.length;++i){var r=t[i].types;d(r,"locality")&&(a=t[i].long_name,$("#locality").val(a)),d(r,"administrative_area_level_2")&&(o=t[i].long_name,$("#administrative_area_level_2").val(o)),d(r,"administrative_area_level_1")&&(l=t[i].long_name,$("#administrative_area_level_1").val(l)),d(r,"country")&&(n=t[i].long_name,$("#country-input").val(n)),null!=o&&null!=l&&null!=n&&(s=o+", "+l+", "+n,$("#address-autocomplete").val(s))}function d(e,t){for(z=0;z<e.length;++z)if(e[z]==t)return!0;return!1}}else document.getElementById("address-autocomplete").value="",console.log("address_components not found")})}