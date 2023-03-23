{OVERALL_HEADER}
<form method="get" action="{LINK_LISTING}" name="locationForm" id="ListingForm">
    <div id="titlebar">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>{LANG_WE_FOUND} {ADSFOUND} {LANG_JOBS}</h1>

                    <div class="intro-banner-search-form listing-page margin-top-30 ac ac-what" id="ac-s">
                        <div class="intro-search-field">
                            <input id="s" style="" name="keywords" value="{KEYWORDS}" class="fc aci mts" type="search" placeholder="{LANG_SEARCH_FIELD}" autofocus="" data-ac="//ac.careerjet.net/ns" data-target="#ac-s" data-target2="#s" data-lc="en_US" data-mhd="10" data-mhm="3">
                            <button type="button" tabindex="-1" class="fc-clear ac-clear" data-target="#s">

                                <svg><use xlink:href="#icon-cross-circle-filled"></use></svg>

                            </button>
                        </div>
                        <div class="intro-search-field with-autocomplete">
                            <div class="input-with-icon ac ac-where" id="ac-l">
                                <input  id="l" name="city" value="{CITY}" class="fc aci mts" type="text" placeholder="{LANG_TOWN_REGION}" data-ac="//ac.careerjet.net/nl" data-target="#ac-l" data-target2="#l" data-loc="1" data-loctext="Use my current location" data-lc="en_{USER_COUNTRY_LOCAL}" data-mhd="10" data-mhm="3">
                                <i class="icon-feather-map-pin"></i>
                                <button type="button" class="ac-geocode geocode" title="Use my current location" tabindex="-1" data-target="#l">

                                    <svg class="icon"><use xlink:href="#icon-visor"></use></svg>

                                    <svg class="icon wait"><use xlink:href="#icon-wait"></use></svg>

                                </button>

                                <button type="button" tabindex="-1" class="fc-clear ac-clear" data-target="#l">

                                    <svg><use xlink:href="#icon-cross-circle-filled"></use></svg>

                                </button>
                                <input type="hidden" name="placetype" id="searchPlaceType" value="">
                                <input type="hidden" name="placeid" id="searchPlaceId" value="">
                                <input type="hidden" id="input-maincat" name="cat" value="{MAINCAT}"/>
                                <input type="hidden" id="input-subcat" name="subcat" value="{SUBCAT}"/>
                                <input type="hidden" id="input-filter" name="filter" value="{FILTER}"/>
                                <input type="hidden" id="input-sort" name="sort" value="{SORT}"/>
                                <input type="hidden" id="input-order" name="order" value="{ORDER}"/>
                            </div>
                        </div>
                        <div class="intro-search-button">
                            <button class="button ripple-effect">{LANG_SEARCH}</button>
                        </div>
                    </div>
                    <div class="hide-under-768px margin-top-20">
                        <ul class="categories-list">
                            {LOOP: SUBCATLIST}
                            <li>
                                <a href="{SUBCATLIST.link}">
                                    {SUBCATLIST.name}
                                </a>
                            </li>
                            {/LOOP: SUBCATLIST}
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4">
                <div class="filter-button-container">
                    <a href="javascript:void(0);" class="enable-filters-button">
                        <i class="enable-filters-button-icon"></i>
                        <span class="show-text">{LANG_ADVANCED_SEARCH}</span>
                        <span class="hide-text">{LANG_ADVANCED_SEARCH}</span>
                    </a>
                </div>
                <div class="sidebar-container search-sidebar">
                    <!-- Job Types -->
                    <div class="sidebar-widget">
                        <h3>{LANG_JOB_TYPE}</h3>
                        <ul>
                            {LOOP: POSTTYPES}
                            <li>
                                <div class="checkbox">
                                    <input type="checkbox" id="job_type_{POSTTYPES.id}" name="job-type" value="{POSTTYPES.id}"
                                    IF('{JOB_TYPE}'=='{POSTTYPES.id}'){ checked {:IF}>
                                    <label for="job_type_{POSTTYPES.id}"><span class="checkbox-icon"></span> {POSTTYPES.title}</label>
                                </div>
                            </li>
                            {/LOOP: POSTTYPES}
                        </ul>
                    </div>
                    <div class="sidebar-widget">
                        <h3>{LANG_SALARY_TYPE}</h3>
                        <ul>
                            {LOOP: SALARYTYPES}
                            <li>
                                <div class="checkbox">
                                    <input type="checkbox" id="salary_type_{SALARYTYPES.id}" name="salary-type" value="{SALARYTYPES.id}" IF('{SALARY_TYPE}'=='{SALARYTYPES.id}'){ checked {:IF}>
                                    <label for="salary_type_{SALARYTYPES.id}"><span class="checkbox-icon"></span> {SALARYTYPES.title}</label>
                                </div>
                            </li>
                             {/LOOP: SALARYTYPES}
                        </ul>
                    </div>
                    <div class="sidebar-widget">
                        <h3>{LANG_SALARY}</h3>
                        <div class="range-widget">
                            <div class="range-inputs">
                                <input type="text" placeholder="{LANG_MIN}" name="range1" value="{RANGE1}">
                                <input type="text" placeholder="{LANG_MAX}" name="range2" value="{RANGE2}">
                            </div>
                            <button type="submit" class="button"><i class="icon-feather-arrow-right"></i></button>
                        </div>
                    </div>
                    {LOOP: CUSTOMFIELDS}
                        IF("{CUSTOMFIELDS.type}"=="text-field"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.textbox}
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="textarea"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.textarea}
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="drop-down"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            <select class="selectpicker with-border" name="custom[{CUSTOMFIELDS.id}]">
                                <option value="" selected>{LANG_SELECT} {CUSTOMFIELDS.title}</option>
                                {CUSTOMFIELDS.selectbox}
                            </select>
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="radio-buttons"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.radio}
                        </div>
                    {:IF}
                        IF("{CUSTOMFIELDS.type}"=="checkboxes"){
                        <div class="sidebar-widget">
                            <h3 class="label-title">{CUSTOMFIELDS.title}</h3>
                            {CUSTOMFIELDS.checkbox}
                        </div>
                    {:IF}
                    {/LOOP: CUSTOMFIELDS}
                    <div class="sidebar-widget">
                        <button class="button full-width ripple-effect">{LANG_ADVANCED_SEARCH}</button>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-8">

                <h3 class="page-title">{LANG_SEARCH_RESULTS}</h3>

                <div class="notify-box margin-top-15">
                   <span class="font-weight-600">{ADSFOUND} {LANG_JOBS_FOUND}</span>

                    <div class="sort-by">
                        <span>{LANG_SORT_BY}</span>
                        <select class="selectpicker hide-tick" id="sort-filter">
                            <option data-filter-type="sort" data-filter-val="id" data-order="desc">{LANG_NEWEST}</option>
                            <option data-filter-type="sort" data-filter-val="title" data-order="desc">{LANG_NAME}</option>
                            <option data-filter-type="sort" data-filter-val="date" data-order="desc">{LANG_DATE}</option>
                            <option data-filter-type="sort" data-filter-val="price" data-order="desc">{LANG_SALARY} ({LANG_HIGH_TO_LOW})</option>
                            <option data-filter-type="sort" data-filter-val="price" data-order="asc">{LANG_SALARY} ({LANG_LOW_TO_HIGH})</option>
                        </select>
                    </div>
                </div>

                <div class="listings-container margin-top-35">
                    {LOOP: ITEM}IF("{ITEM.urgent}"=="0"){
                    <div class="job-listing IF({ITEM.highlight}){ highlight {:IF}">
                        <a href="{ITEM.link}">
                            <div class="job-listing-details">
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title">
                                        {ITEM.product_name}
                                        IF('{USERTYPE}' == 'user'){
                                        <span style="" class="fav-icon set-item-fav IF('{ITEM.favorite}'){ added {:IF}" data-item-id="{ITEM.id}" data-userid="{USER_ID}" data-action="setFavAd"></span>
                                        {:IF}
                                    </h3>
                                    IF({COMPANY_ENABLE}){
                                    <h4 class="job-listing-company">{ITEM.company_name}</h4>
                                    {:IF}
                                    <div class="job-location">
                                        <i class="la la-map-marker"></i> {ITEM.address}
                                    </div>
                                    <div class="job-type-buttons">
                                        <div class="job-type"><i class="la la-suitcase"></i>{ITEM.product_type}</div>
                                        IF("{ITEM.salary_min}"!="0"){
                                        <div class="salary"><i class="la la-credit-card"></i> {ITEM.salary_min} - {ITEM.salary_max} {LANG_PER} {ITEM.salary_type}</div>
                                        {ELSE}
                                        {:IF}
                                    </div>
                                    <div class="job-listing-title-buttons">
                                        IF("{ITEM.featured}"=="1"){ <div class="badge custom-badge-success"><i class="la la-hand-o-right"></i> {LANG_FEATURED}</div> {:IF}
                                        IF("{ITEM.urgent}"=="1"){ <div class="badge custom-badge-danger"><i class="la la-dashboard"></i> {LANG_URGENT}</div> {:IF}
                                        IF("{ITEM.new_status}" <= "3"){ <div class="badge"><i class="la la-bell-o"></i> {LANG_NEW}</div> {:IF}
                                    </div>
                                    <p class="job-listing-text">{ITEM.description}</p>
                                </div>
                            </div>
                            <div class="job-listing-footer with-icon">
                                <ul>
                                    <li style="margin-left: 0px;"><i class="la la-clock-o"></i> {ITEM.created_at} </li>
                                    <li>
                                        <span><i class="la la-send-o"></i>{LANG_APPLY_NOW}</span>
                                    </li>
                                </ul>
                            </div>
                        </a>
                    </div>
                   {:IF} {/LOOP: ITEM}
                    <div class="clearfix"></div>
                    IF("{ADSFOUND}"!="0"){
                    <div class="row">
                        <div class="col-md-12">
                            <!-- Pagination -->
                            <div class="pagination-container margin-top-20 margin-bottom-60">
                                <nav class="pagination">
                                    <ul>
                                        {LOOP: PAGES}
                                        IF("{PAGES.current}"=="0"){
                                        <li><a href="{PAGES.link}">{PAGES.title}</a></li>
                                        {ELSE}
                                        <li><a href="#" class="current-page">{PAGES.title}</a></li>
                                        {:IF}
                                        {/LOOP: PAGES}
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    {:IF}

                </div>

            </div>
        </div>
    </div>
</form>
<script type="text/javascript">

    $('#sort-filter').on('change', function (e) {
        var $item = $(this).find(':selected');

        var filtertype = $item.data('filter-type');
        var filterval = $item.data('filter-val');
        $('#input-' + filtertype).val(filterval);
        $('#input-order').val($item.data('order'));
        $('#ListingForm').submit();
    });

    var getMaincatId = '{MAINCAT}';
    var getSubcatId = '{SUBCAT}';

    $(window).bind("load", function () {
        if (getMaincatId != "") {
            $('li a[data-cat-type="maincat"][data-ajax-id="' + getMaincatId + '"]').trigger('click');
        } else if (getSubcatId != "") {
            $('li ul li a[data-cat-type="subcat"][data-ajax-id="' + getSubcatId + '"]').trigger('click');
        } else {
            $('li a[data-cat-type="all"]').trigger('click');
        }
    });
</script>
{OVERALL_FOOTER}
