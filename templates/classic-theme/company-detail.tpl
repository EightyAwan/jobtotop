{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{NAME}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">
                                {LANG_HOME}
                            </a></li>
                        <li><a href="{LINK_COMPANIES}">
                                {LANG_COMPANIES}
                            </a></li>
                        <li>{NAME}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container">
	<div class="row">
		<!-- Content -->
		<div class="col-xl-8 col-lg-8">
      <div class="single-page-section">
        <div class="single-page-inner">
          <div class="single-page-image"><img src="{LOGO}" alt="{NAME}"></div>
          <div class="single-page-details">
            <h3>{NAME}</h3>
            <ul>
                IF('{CITYNAME}' != ''){
                <li>
                  <i class="icon-feather-map-pin"></i>
                  <span>{CITYNAME}, {STATENAME}</span>
                </li>
                {:IF}
                IF(!{HIDE_CONTACT}){
                IF('{PHONE}' != ''){
                <li>
                  <i class="icon-feather-phone-call"></i>
                  <span><a href="tel:{PHONE}" rel="nofollow">{PHONE}</a></span>
                </li>
                {:IF}
                IF('{FAX}' != ''){
                <li>
                  <i class="icon-feather-printer"></i>
                  <span>{FAX}</span>
                </li>
                {:IF}
                IF('{EMAIL}' != ''){
                <li>
                  <i class="icon-feather-mail"></i>
                  <span><a href="mailto:{EMAIL}" rel="nofollow">{EMAIL}</a></span>
                </li>
                {:IF}
                {:IF}
                IF('{WEBSITE}' != ''){
                <li>
                  <i class="icon-feather-link"></i>
                  <span><a href="{WEBSITE}" rel="nofollow">{WEBSITE}</a></span>
                </li>
                {:IF}
              </ul>
        </div>
        </div>
      </div>
			<div class="single-page-section">
			    IF('{DESCRIPTION}' != ''){
			        <h2>About Company</h2>
				    {DESCRIPTION}
				{:IF}
			</div>

			IF({TOTALITEM}){
			<div class="boxed-list margin-bottom-60" id="all-jobs">
				<div class="boxed-list-headline">
					<h3><i class="icon-feather-briefcase"></i> {LANG_ALL_JOBS}</h3>
				</div>
        <div class="listings-container compact-list-layout margin-top-30">
          {LOOP: ITEM}
          <a href="{ITEM.link}" class="job-listing">
              <div class="job-listing-details">
                  <div class="job-listing-description">
                      <h3 class="job-listing-title">{ITEM.name}
                            IF("{ITEM.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                            IF("{ITEM.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                            IF("{ITEM.highlight}"=="1"){ <div class="badge red"> {LANG_HIGHLIGHT}</div> {:IF}
                      </h3>
                      <div class="job-listing-footer">
                          <ul>
                              <li><i class="la la-map-marker"></i> {ITEM.city}</li>
                              IF("{ITEM.salary_min}"!="0"){
                              <li><i class="la la-credit-card"></i> {ITEM.salary_min}-{ITEM.salary_max}</li>
                              {:IF}
                              <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                          </ul>
                      </div>
                  </div>
                  <span class="job-type">{ITEM.product_type}</span>
              </div>
          </a>
          {/LOOP: ITEM}
        </div>
			</div>
      {:IF}
		</div>


		<!-- Sidebar -->
		<div class="col-xl-4 col-lg-4">
			<div class="sidebar-container">
        IF('{FACEBOOK}' != '' || '{TWITTER}' != '' || '{LINKEDIN}' != '' || '{PINTEREST}' != '' || '{YOUTUBE}' != '' || '{INSTAGRAM}' != ''){
        <div class="sidebar-widget">
          <h3>{LANG_FOLLOW_US}</h3>
          <ul class="share-buttons-icons">
            IF('{FACEBOOK}' != ''){
						<li><a href="{FACEBOOK}" data-button-color="#3b5998" title="{LANG_FACEBOOK}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-facebook"></i></a></li>
            {:IF}
            IF('{TWITTER}' != ''){
						<li><a href="{TWITTER}" data-button-color="#1da1f2" title="{LANG_TWITTER}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-twitter"></i></a></li>
            {:IF}
            IF('{LINKEDIN}' != ''){
						<li><a href="{LINKEDIN}" data-button-color="#0077b5" title="{LANG_LINKEDIN}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-linkedin"></i></a></li>
            {:IF}
            IF('{PINTEREST}' != ''){
            <li><a href="{PINTEREST}" data-button-color="#bd081c" title="{LANG_PINTEREST}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-pinterest-p"></i></a></li>
            {:IF}
            IF('{YOUTUBE}' != ''){
            <li><a href="{YOUTUBE}" data-button-color="#ff0000" title="{LANG_YOUTUBE}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
            {:IF}
            IF('{INSTAGRAM}' != ''){
            <li><a href="{INSTAGRAM}" data-button-color="#e1306c" title="{LANG_INSTAGRAM}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-instagram"></i></a></li>
            {:IF}
					</ul>
        </div>
        {:IF}
        IF('{LATITUDE}' != '' && '{LONGITUDE}' != ''){
				<!-- Location -->
				<div class="sidebar-widget">
					<h3>{LANG_LOCATION}</h3>
					<div id="single-job-map-container">
						<div id="map-detail" class="map-widget map height-200px"></div>
					</div>
				</div>
        {:IF}
			</div>
		</div>

	</div>
</div>
<div class="margin-top-15"></div>
<link href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript' src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>
<script async="async" type="text/javascript">
    var _latitude = {LATITUDE};
    var _longitude = {LONGITUDE};
    var site_url = '{SITE_URL}';
    var color = '{MAP_COLOR}';
    var path = '{SITE_URL}templates/{TPL_NAME}';
    var element = "map-detail";
    simpleMap(_latitude, _longitude, element);
</script>
{OVERALL_FOOTER}
