{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_CONTACT_US}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_CONTACT_US}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
    <div class="container margin-bottom-50">
        <!-- <div class="map margin-bottom-50" id="singleListingMap" data-latitude="{LATITUDE}" data-longitude="{LONGITUDE}" data-map-icon="fa fa-marker"></div> -->
        <div class="business-info">
            <div class="row">
                <div class="col-sm-8">
                    <div class="contactUs">
                        <h2 class="margin-bottom-30">{LANG_CONTACT_US}</h2>
                        <p class="margin-bottom-30">At JobtoTop, we understand that our users may have questions, comments, or concerns about our platform and services. That's why we offer a range of ways for our users to get in touch with us and receive support.</p>
                        <form id="contact-form" class="contact-form" name="contact-form" method="post" action="#">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="with-border" required="required" placeholder="{LANG_YNAME}" name="name">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="email" class="with-border" required="required" placeholder="{LANG_YEMAIL}" name="email">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input type="text" class="with-border" required="required" placeholder="{LANG_SUBJECT}" name="subject">
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <textarea name="message" id="message" required="required" class="with-border" rows="7" placeholder="{LANG_MESSAGE}"></textarea>
                                    </div>
                                </div>

                                <div class="col-sm-12">
                                    <div class="form-group">

                                        IF("{RECAPTCHA_MODE}"=="1"){
                                        <div class="g-recaptcha" data-sitekey="{RECAPTCHA_PUBLIC_KEY}"></div>
                                        {:IF}

                                        <span style="color:red">IF("{RECAPTCH_ERROR}"!=""){ {RECAPTCH_ERROR} {:IF}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" name="Submit" class="button">{LANG_SEND_MESSAGE}</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Enquiry Form-->
                <!-- contact-detail -->
                <div class="col-sm-4">
                    <!-- <div class="dashboard-box margin-top-0">
                      <div class="headline">
                        <h3>{LANG_GET_TOUCH}</h3>
                      </div>
                      <div class="content with-padding">
                        {LANG_CONTACT_PAGE_TEXT}
                      </div>
                    </div> -->
                    <div class="dashboard-box">
                      <div class="headline">
                        <h3>{LANG_CONTACT_INFORMATION}</h3>
                      </div>
                      <div class="content with-padding">
                        <ul>
                            <!--
                            IF('{ADDRESS}'!=''){
                            <li class="job-property margin-bottom-10">
                              <i class="la la-map-marker"></i>
                              <span>{ADDRESS}</span>
                            </li>
                            {:IF}
                            IF('{PHONE}'!=''){
                            <li class="job-property margin-bottom-10">
                              <i class="la la-phone"></i>
                              <span><a href="tel:{PHONE}" rel="nofollow">{PHONE}</a></span>
                            </li>
                            {:IF}-->
                            IF('{EMAIL}'!=''){
                            <li class="job-property margin-bottom-0" style = "padding-left: 0px">
                                Users can also contact us via email at <br>
                            <!--    <i class="la la-envelope"></i> {PHONE} -->
                              <span><a href="mailto:support@jobtotop.com" rel="nofollow">support@jobtotop.com</a></span> Our support team is available to answer any questions or concerns you may have and provide assistance with using our platform.
                              
                            </li>
                            {:IF}
                        </ul>
                      </div>
                       <div class="dashboard-box">
                      <div class="headline">
                        <h3>Social Media <a target = "_blank" href="https://web.facebook.com/profile.php?id=100088154507293&_rdc=1&_rdr"><img src="{SITE_URL}templates/{TPL_NAME}/images/facebook.png" alt="" width= "35px" style = "margin:10px;"> </a> <a target = "_blank" href="https://www.instagram.com/_jobtotop/">  <img src="{SITE_URL}templates/{TPL_NAME}/images/instagram.png" alt="" width= "35px" style = "margin:10px;"> </a> </h3>
                      </div>
                      <div class="content with-padding">
                        <ul>
                         
                           
                            <li class="job-property margin-bottom-0" style = "padding-left: 0px">
                              Follow us on social media platforms such as 
                              <a target = "_blank" href="https://web.facebook.com/profile.php?id=100088154507293&_rdc=1&_rdr">Facebook,</a> and <a target = "_blank" href="https://www.instagram.com/_jobtotop/">Instagram</a> to stay up-to-date with the latest news and updates from JobtoTop. Our social media channels are also a great way to connect with other job seekers and stay informed about job search trends and insights.
                              
                            </li>
                        </ul>
                      </div>
                    </div>
                </div>
                <!-- contact-detail -->
            </div>
            <!-- row -->
        </div>
    </div>
<script src='https://www.google.com/recaptcha/api.js'></script>

IF("{MAP_TYPE}"=="google"){
<link href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript' src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>
<script>
    var _latitude = '{LATITUDE}';
    var _longitude = '{LONGITUDE}';
    var element = "singleListingMap";
    var path = '{SITE_URL}templates/{TPL_NAME}/';
    var getCity = false;
    var color = '{MAP_COLOR}';
    var site_url = '{SITE_URL}';
    simpleMap(_latitude, _longitude, element);
</script>
{ELSE}
<script>
    var openstreet_access_token = '{OPENSTREET_ACCESS_TOKEN}';
</script>
<link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/css/style.css">
<!-- Leaflet // Docs: https://leafletjs.com/ -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet.min.js"></script>

<!-- Leaflet Maps Scripts (locations are stored in leaflet-quick.js) -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-markercluster.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-gesture-handling.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-quick.js"></script>

<!-- Leaflet Geocoder + Search Autocomplete // Docs: https://github.com/perliedman/leaflet-control-geocoder -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-autocomplete.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-control-geocoder.js"></script>
{:IF}
{OVERALL_FOOTER}