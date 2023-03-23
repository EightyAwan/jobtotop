{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_CREATE_COMPANY}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_CREATE_COMPANY}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="section gray padding-bottom-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-12">
                <div class="dashboard-sidebar">
                    <div class="dashboard-sidebar-inner">
                        <div class="dashboard-nav-container">
                            <!-- Responsive Navigation Trigger -->
                            <a href="#" class="dashboard-responsive-nav-trigger">
                                <span class="hamburger hamburger--collapse" >
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </span>
                                <span class="trigger-title">{LANG_DASH_NAVIGATION}</span>
                            </a>

                            <div class="dashboard-nav">
                                <div class="dashboard-nav-inner">
                                  <ul data-submenu-title="{LANG_MY_ACCOUNT}">
                                    <li><a href="{LINK_DASHBOARD}"><i class="icon-feather-grid"></i> {LANG_DASHBOARD}</a></li>
                                      <li><a href="{LINK_PROFILE}/{USERNAME}"><i
                                                      class="icon-feather-user"></i> {LANG_PROFILE_PUBLIC}</a></li>
                                </ul>
                                <ul data-submenu-title="{LANG_MY_JOBS}">
                                    <li class="active"><a href="{LINK_MYCOMPANIES}"><i class="icon-feather-box"></i> {LANG_MY_COMPANIES} <span class="nav-tag">{COMPANIES}</span></a></li>
                                    <li><a href="{LINK_MYJOBS}"><i class="icon-feather-briefcase"></i> {LANG_MY_JOBS} <span class="nav-tag">{MYADS}</span></a></li>
                                    <li><a href="{LINK_SAVEDJOBS}"><i class="icon-feather-clock"></i> {LANG_SAVED_JOBS} <span class="nav-tag">{SAVEDADS}</span></a></li> <!-- Custom Fields -->
                                    <li><a href="{LINK_PENDINGJOBS}"><i class="icon-feather-clock"></i> {LANG_PENDING_JOBS} <span class="nav-tag">{PENDINGADS}</span></a></li>
                                    <li><a href="{LINK_HIDDENJOBS}"><i class="icon-feather-eye-off"></i> {LANG_HIDDEN_JOBS} <span class="nav-tag">{HIDDENADS}</span></a></li>
                                    <li><a href="{LINK_EXPIREJOBS}"><i class="icon-feather-alert-octagon"></i> {LANG_EXPIRED_JOBS} <span class="nav-tag">{EXPIREADS}</span></a></li>
                                    <li><a href="{LINK_RESUBMITJOBS}"><i class="icon-feather-rotate-cw"></i> {LANG_RESUBMITTED_JOBS} <span class="nav-tag">{RESUBMITADS}</span></a></li>
                                </ul>

                                <ul data-submenu-title="{LANG_ACCOUNT}">
                                  IF('{WCHAT}'=='on'){
                                  <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                  {:IF}
                                    <li><a href="{LINK_TRANSACTION}"><i class="icon-feather-file-text"></i> {LANG_TRANSACTIONS}</a></li>
                                    <li><a href="{LINK_LOGOUT}"><i class="icon-feather-log-out"></i> {LANG_LOGOUT}</a></li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 col-md-12">
            <div class="dashboard-box margin-top-0">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="icon-feather-box"></i> {LANG_CREATE_COMPANY}</h3>
                </div>
                <div class="content with-padding">
                 IF('{ERROR}' != ''){
                 <span class="status-not-available">{ERROR}</span>
                 {:IF}
                 <form method="post" accept-charset="UTF-8" enctype="multipart/form-data">
                    <div class="submit-field">
                      <h5>{LANG_NAME} *</h5>
                      <input type="text" class="with-border" id="name" name="name" value="{NAME}" required="">
                  </div>
                  <div class="submit-field">
                      <h5>{LANG_LOGO}</h5>
                      <div class="uploadButton">
                          <input class="uploadButton-input" type="file"  accept="image/png, image/jpeg" id="company_logo" name="logo"/>
                          <label class="uploadButton-button ripple-effect" for="company_logo">{LANG_UPLOAD_LOGO}</label>
                          <span class="uploadButton-file-name">{LANG_LOGO_HINT}</span>
                      </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_COMPANY_DESCRIPTION} *</h5>
                    <textarea cols="30" rows="5" class="with-border" name="company_desc" required="" style="white-space: pre-line;">{DESCRIPTION}</textarea>
                </div>
                <div class="submit-field">
                    <h5>{LANG_CITY}</h5>
                    <select id="jobcity" class="with-border" name="city" data-size="7" title="{LANG_SELECT} {LANG_CITY}">
                      <option value="0" selected="selected">{LANG_SELECT} {LANG_CITY}</option>
                      IF('{CITY}' != ''){
                        <option value="{CITY}" selected="selected">{CITYNAME}</option>
                      {:IF}
                  </select>
              </div>
              IF({POST_ADDRESS_MODE}){
              <div class="submit-field">
                    <h5>{LANG_ADDRESS}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="text" placeholder="{LANG_TYPE_ADDRESS}" name="location" id="address-autocomplete" value="{LOCATION}">
                      <i class="la la-crosshairs"></i>
                  </div>
                  <div class="map height-200px shadow" id="map"></div>
                  <small>{LANG_DRAG_MAP_MARKER}</small>
                  <input type="hidden" id="latitude" name="latitude"  value="{LATITUDE}"/>
                  <input type="hidden" id="longitude" name="longitude" value="{LONGITUDE}"/>
              </div>
              {:IF}
              <div class="submit-field">
                    <h5>{LANG_PHONE_NUMBER}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="text" name="phone" value="{PHONE}">
                      <i class="icon-feather-phone"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_FAX}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="text" name="fax" value="{FAX}">
                      <i class="icon-feather-printer"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_EMAIL}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="email" name="email" value="{EMAIL}">
                      <i class="icon-feather-mail"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_WEBSITE}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="website" value="{WEBSITE}">
                      <i class="icon-feather-link"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_FACEBOOK}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="facebook" value="{FACEBOOK}">
                      <i class="icon-feather-facebook"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_TWITTER}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="twitter" value="{TWITTER}">
                      <i class="icon-feather-twitter"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_LINKEDIN}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="linkedin" value="{LINKEDIN}">
                      <i class="icon-feather-linkedin"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_PINTEREST}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="pinterest" value="{PINTEREST}">
                      <i class="fa fa-pinterest-p"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_YOUTUBE}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="youtube" value="{YOUTUBE}">
                      <i class="icon-feather-youtube"></i>
                    </div>
                  </div>
                  <div class="submit-field">
                    <h5>{LANG_INSTAGRAM}</h5>
                    <div class="input-with-icon">
                      <input class="with-border" type="url" name="instagram" value="{INSTAGRAM}">
                      <i class="icon-feather-instagram"></i>
                    </div>
                  </div>
          IF('{ID}' != ''){
          <input type="hidden" name="id" value="{ID}">
          {:IF}
          <button type="submit" name="submit" class="button ripple-effect">{LANG_SAVE}</button>
      </form>
  </div>
</div>
</div>
</div>
</div>
</div>
<link href="{SITE_URL}templates/{TPL_NAME}/css/select2.min.css" rel="stylesheet"/>
<script src="{SITE_URL}templates/{TPL_NAME}/js/select2.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/i18n/{LANG_CODE}.js"></script>
<script>
    /* Get and Bind cities */
$('#jobcity').select2({
    ajax: {
        url: ajaxurl + '?action=searchCityFromCountry',
        dataType: 'json',
        delay: 50,
        data: function (params) {
            var query = {
                q: params.term, /* search term */
                page: params.page
            };

            return query;
        },
        processResults: function (data, params) {
                /*
                 // parse the results into the format expected by Select2
                 // since we are using custom formatting functions we do not need to
                 // alter the remote JSON data, except to indicate that infinite
                 // scrolling can be used
                 */
                 params.page = params.page || 1;

                 return {
                    results: data.items,
                    pagination: {
                        more: (params.page * 10) < data.totalEntries
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; }, /* let our custom formatter work */
        minimumInputLength: 2,
        templateResult: function (data) {
            return data.text;
        },
        templateSelection: function (data, container) {
            return data.text;
        }
    });
</script>
IF({POST_ADDRESS_MODE}){
<!-- If address mode enable: ADDRESS FIELD JAVASCRIPT -->
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
  var element = "map";
  var color = '#9C27B0';
  var zoom = '#9C27B0';
  var getCity = false;
  var path = '{SITE_URL}templates/{TPL_NAME}/';
  var Countries = '{USER_COUNTRY}';
  if(Countries != ""){
    var str = Countries;
    var str_array = str.split(',');
    var getCountry = [];
    for(var i = 0; i < str_array.length; i++)
    {
      getCountry.push(str_array[i]);

    }
  }
  else{
    var getCountry = "all";
  }
  simpleMap(_latitude, _longitude, element, true);

  $('#jobcity').on('change', function() {
    var data = $("#jobcity option:selected").val();
    var custom_data= $("#jobcity").select2('data')[0];
    var latitude = custom_data.latitude;
    var longitude = custom_data.longitude;
    var address = custom_data.text;
    $('#latitude').val(latitude);
    $('#longitude').val(longitude);
    simpleMap(latitude, longitude, element, true, address);
  });
</script>
<!-- If address mode enable: ADDRESS FIELD JAVASCRIPT -->
{:IF}
{OVERALL_FOOTER}
