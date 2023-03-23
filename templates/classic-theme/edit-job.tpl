{OVERALL_HEADER}

<!-- Select Category Modal -->
<div class="zoom-anim-dialog mfp-hide popup-dialog big-dialog" id="categoryModal">
    <div class="popup-tab-content padding-0 tg-thememodal tg-categorymodal">
        <div class="tg-thememodaldialog">
            <div class="tg-thememodalcontent">
                <div class="tg-title">
                    <strong>{LANG_SELECT} {LANG_CATEGORY}</strong>
                </div>
                <div id="tg-dbcategoriesslider"
                     class="tg-dbcategoriesslider tg-categories owl-carousel select-category post-option">
                    

                </div>
                <ul class="tg-subcategories" style="display: none">
                    <li>
                        <div class="tg-title">
                            <strong>{LANG_SELECT} {LANG_SUBCATEGORY}</strong>

                            <div id="sub-category-loader" style="visibility:hidden"></div>
                        </div>
                        <div class=" tg-verticalscrollbar tg-dashboardscrollbar">
                            <ul id="sub_category">

                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Select Category Modal -->

<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_POST_JOB}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_POST_JOB}</li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="section gray">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-md-12">
                <div id="post_error"></div>
                <div class="payment-confirmation-page dashboard-box margin-top-0 padding-top-0 margin-bottom-50"
                     style="display: none">
                    <div class="headline">
                        <h3>{LANG_SUCCESS}</h3>
                    </div>
                    <div class="content with-padding padding-bottom-10">
                        <i class="la la-check-circle"></i>

                        <h2 class="margin-top-30">{LANG_SUCCESS}</h2>

                        <p>{LANG_JOBSUCCESS}</p>
                    </div>
                </div>
                <form id="post_job_form" action="{LINK_EDIT-JOB}?action=edit_ad" method="post"
                      enctype="multipart/form-data" accept-charset="UTF-8">
                    IF({COMPANY_ENABLE}){
                    <div class="dashboard-box margin-top-0 margin-bottom-30">
                        <!-- Headline -->
                        <div class="headline">
                            <h3><i class="la la-building"></i> {LANG_COMPANY_INFO}</h3>
                        </div>
                        <div class="content with-padding padding-bottom-10">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="submit-field">
                                        <h5>{LANG_COMPANY} *</h5>
                                        <select id="company-select" class="selectpicker with-border"
                                                title="{LANG_SELECT} {LANG_COMPANY}" data-size="7" name="company">
                                            {LOOP: COMPANIES}
                      <option value="{COMPANIES.id}" IF('{COMPANY_ID}'=='{COMPANIES.id}'){ selected {:IF}>{COMPANIES.title}</option>
                      {/LOOP: COMPANIES}
                                            <option value="0">{LANG_NEW_COMPANY}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xl-12 new-company" style="display: none">
                                    <div class="submit-field">
                                        <h5>{LANG_COMPANY_NAME} *</h5>
                                        <input type="text" class="with-border" name="company_name">
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_LOGO}</h5>

                                        <div class="uploadButton">
                                            <input class="uploadButton-input" type="file" accept="image/*" id="upload"
                                                   name="company_logo"/>
                                            <label class="uploadButton-button ripple-effect"
                                                   for="upload">{LANG_UPLOAD_LOGO}</label>
                                            <span class="uploadButton-file-name">{LANG_LOGO_HINT}</span>
                                        </div>
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_COMPANY_DESC} *</h5>
                                        <textarea cols="30" rows="5" class="with-border" name="company_desc"></textarea>
                                    </div>
                                </div>  
                                <div class="col-xl-12 ">
                                    <!-- CUstom Fields -->
                                    <div class="submit-field">
                                        <h5>{LANG_YOUR_COMPANY_NUMBER_OF_EMPLOYEES}</h5>
                                        <select id="company-employees" class="selectpicker with-border errorr"
                                                title="{LANG_SELECT} {LANG_COMPANY_EMPLOYEES}" data-size="7" name="company_employees">
                                                <option value="" >{LANG_SELECT_EMPLOYEES}</option>
                                                <option value="EMPLOYEE_1_49">{LANG_EMPLOYEE_1_49}</option>
                                                <option value="EMPLOYEE_50_149">{LANG_EMPLOYEE_50_149}</option>
                                                <option value="EMPLOYEE_150_249">{LANG_EMPLOYEE_150_249}</option>
                                                <option value="EMPLOYEE_250_499">{LANG_EMPLOYEE_250_499}</option>
                                                <option value="EMPLOYEE_500_749">{LANG_EMPLOYEE_500_749}</option>
                                                <option value="EMPLOYEE_750_999">{LANG_EMPLOYEE_750_999}</option>
                                                IF("{COMPANY_EMPLOYEES}"!=""){ <option value="{COMPANY_EMPLOYEES}" selected="selected">{COMPANY_EMPLOYEES}</option> {:IF}
                                        </select>
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_YOUR_ROLE_IN_HIRING_PROCESS}</h5>
                                        <select id="company-hiring-process" class="selectpicker with-border errorr " title="{LANG_SELECT} {LANG_YOUR_ROLE_IN_HIRING_PROCESS}" name="company_role">
                                            <option value="">{LANG_SELECT_ROLE}</option>
                                            <option value="hrg" IF("{COMPANY_ROLE}" == "hrg"){ selected='selected' {:IF}>{LANG_HUMAN_RESOURCE_GENERALIST}</option>
                                            <option value="ceo" IF("{COMPANY_ROLE}" == "ceo"){ selected='selected' {:IF}>{LANG_OWNER_CEO}</option>
                                            <option value="rec" IF("{COMPANY_ROLE}" == "rec"){ selected='selected' {:IF}>{LANG_RECRUITER_OR_TALLENT_ACQUISITION}</option>
                                            <option value="om" IF("{COMPANY_ROLE}" == "om"){ selected='selected' {:IF}>{LANG_ASSISTANT_OR_OFFICE_MANAGER}</option>
                                            <option value="hrm" IF("{COMPANY_ROLE}" == "hrm"){ selected='selected' {:IF}>{LANG_HIRING_MANAGER}</option>
                                            <option value="other" IF("{COMPANY_ROLE}" == "other"){ selected='selected' {:IF}>{LANG_OTHER}</option>
                                        </select>
                                    </div>
                                    <!--
                                    <div class="submit-field">
                                        <h5>{LANG_TYPICAL_HIRING_BUDGET}</h5>
                                        <select id="company-hiring-budget" class="selectpicker with-border errorr" title="{LANG_SELECT} {LANG_TYPICAL_HIRING_BUDGET}" name="company_budget">
                                            <option value="">{LANG_SELECT_OPTION}</option>
                                            <option value="1">{LANG_I_HAVE_A_BUDGET_FOR_MY_ROLE}</option>
                                            <option value="2">{LANG_NO_PLANNED_BUDGET_BUT_I_CAN_SPEND_IF_NEEDED}</option>
                                            <option value="3">{LANG_I_AM_NOT_ABLE_TO_SPEND_ON_HIRING}</option>
                                        </select>
                                    </div>-->
                                    <div class="submit-field">
                                        <h5>{LANG_HOW_YOU_HEARD_ABOUT_US}</h5>
                                        <select id="hear-about-us" class="selectpicker with-border errorr" title="{LANG_SELECT} {LANG_HOW_YOU_HEARD_ABOUT_US}" name="hear_about_us">
                                            <option value="">{LANG_SELECT_OPTION}</option>
                                            <option value="1" IF("{HEAR_ABOUT_US}" =="1"){ selected='selected' {:IF}>{LANG_MAIL}</option>
                                            <option value="3" IF("{HEAR_ABOUT_US}" =="3"){ selected='selected' {:IF}>{LANG_TV}</option>
                                            <option value="4" IF("{HEAR_ABOUT_US}" =="4"){ selected='selected' {:IF}>{LANG_SOCIAL_MEDIA}</option>
                                            <option value="5" IF("{HEAR_ABOUT_US}" =="5"){ selected='selected' {:IF}>{LANG_ONLINE_VIDEO}</option>
                                            <option value="6" IF("{HEAR_ABOUT_US}" =="6"){ selected='selected' {:IF}>{LANG_RADIO_AM_FM_XM}</option>
                                            <option value="7" IF("{HEAR_ABOUT_US}" =="7"){ selected='selected' {:IF}>{LANG_PODCAST}</option>
                                            <option value="8" IF("{HEAR_ABOUT_US}" =="8"){ selected='selected' {:IF}>{LANG_STREAMING_AUDIO}</option>
                                            <option value="9" IF("{HEAR_ABOUT_US}" =="9"){ selected='selected' {:IF}>{LANG_BILLBOARD}</option>
                                            <option value="10" IF("{HEAR_ABOUT_US}" =="10"){ selected='selected' {:IF}>{LANG_NEWSPAPER}</option>
                                            <option value="11" IF("{HEAR_ABOUT_US}" =="11"){ selected='selected' {:IF}>{LANG_SEARCH_ENGINE}</option>
                                            <option value="12" IF("{HEAR_ABOUT_US}" =="12"){ selected='selected' {:IF}>{LANG_OTHER}</option>
                                        </select>
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_HOW_WOULD_YOU_LIKE_TO_RECEIVE_APPLICATIONS?}</h5>
                                        <div class="radio margin-right-20">
                                            <input class="with-gap" type="radio" name="app_receive_type" id="Male" value="email" IF("{APP_RECEIVE_TYPE}" == "email"){ checked="" {:IF}>
                                            <label for="Male"><span class="radio-label"></span>{LANG_VIA_EMAIL}</label>
                                        </div>
                                        <br>
                                        <div class="radio margin-right-20">
                                            <input class="with-gap" type="radio" name="app_receive_type" id="Female" value="interview" IF("{APP_RECEIVE_TYPE}" == "interview"){ checked="" {:IF}>
                                            <label for="Female"><span class="radio-label"></span>{LANG_WALK_INTERVIEW}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    {:IF}
                    <div class="dashboard-box margin-top-0">
                        <!-- Headline -->
                        <div class="headline">
                            <h3><i class="icon-feather-briefcase"></i> {LANG_JOB_DETAILS}</h3>
                        </div>
                        <div class="content with-padding padding-bottom-10">
                            <div class="row">
                                <div class="col-xl-12">
                                    <!--
                                    <div class="form-group text-center">
                                        <a href="#categoryModal" id="choose-category"
                                           class="button popup-with-zoom-anim"><i class="icon-feather-check-circle"></i>
                                            &nbsp;{LANG_EDIT_CATEGORY}</a>
                                    </div>
                                    <div class="form-group selected-product" id="change-category-btn" IF(
                                    "{CATEGORY}"==""){ style='display: none' {:IF}>
                                    <ul class="select-category list-inline">
                                        <li id="main-category-text">{CATEGORY}</li>
                                        <li id="sub-category-text" IF(
                                        "{SUBCATEGORY}"==""){ style='display: none' {:IF}>{SUBCATEGORY}</li>
                                        <li class="active"><a href="#categoryModal" class="popup-with-zoom-anim"><i
                                                        class="icon-feather-edit"></i> {LANG_EDIT}</a></li>
                                    </ul>

                                    <input type="hidden" id="input-maincatid" name="catid" value="{CATID}">
                                    <input type="hidden" id="input-subcatid" name="subcatid" value="{SUBCATID}">
                                </div>
                                <input type="hidden" id="input-maincatid" name="catid" value="{CATID}">
                                <input type="hidden" id="input-subcatid" name="subcatid" value="{SUBCATID}">
                                <!-- cUSTOM fIELDS -->
                            
                                <div class="submit-field">
                                    <h5>{LANG_TITLE} *</h5>
                                    <input type="text" class="with-border" name="title" value="{TITLE}">
                                </div>
                                IF({JOB_IMAGE_FIELD}){
                                <div class="submit-field">
                                    <h5>{LANG_IMAGE}</h5>
                                    <div class="uploadButton">
                                        <input class="uploadButton-input" type="file" accept="image/*" id="job_image"
                                               name="job_image"/>
                                        <label class="uploadButton-button ripple-effect"
                                               for="job_image">{LANG_UPLOAD_IMAGE}</label>
                                        <span class="uploadButton-file-name">{LANG_LOGO_HINT}</span>
                                    </div>
                                </div>
                                {:IF}
                                
                                <div class="submit-field">
                                        <div class="row">
                                            <div class="col-lg-12 ac ac-where" id="ac-l">
                                                <h5>{LANG_LOCATION} *</h5>
                                                <input  id="l" name="city" value="{LOCATION}" class="fc aci mts" type="text" placeholder="{LANG_TOWN_REGION}" data-ac="//www.jobtotop.com/autocomplete" data-target="#ac-l" data-target2="#l" data-loc="1" data-loctext="Use my current location" data-lc="{USER_COUNTRY_LOCAL}" data-mhd="10" data-mhm="3" data-value="{LOCATION}">
                                                <input type="hidden" name="job_country" value="{USER_COUNTRY_LOCAL}">
                                            </div>
                                        </div>
                                    </div>
                                
                                <div class="submit-field">
                                    <h5>{LANG_DESCRIPTION} *</h5>
                                    <textarea cols="30" rows="5" class="with-border text-editor"
                                              name="content">{DESCRIPTION}</textarea>
                                </div>
                                <div class="submit-field">
                                    <h5>{LANG_JOB_TYPE} *</h5>
                                    <select class="selectpicker with-border" data-size="7" name="job_type">
                                        {LOOP: POSTTYPES}
                      <option value="{POSTTYPES.id}" IF('{PRODUCT_TYPE}'=='{POSTTYPES.id}'){ selected {:IF}>{POSTTYPES.title}</option>
                      {/LOOP: POSTTYPES}
                                    </select>
                                </div>
                                <div class="submit-field">
                                    <h5>{LANG_SALARY}</h5>

                                    <div class="row">
                                        <div class="col-xl-4 col-md-12">
                                            <div class="input-with-icon">
                                                <input class="with-border" type="text" placeholder="{LANG_MIN}"
                                                       name="salary_min" value="{SALARY_MIN}">
                                                <i class="currency">{USER_CURRENCY_SIGN}</i>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-12">
                                            <div class="input-with-icon">
                                                <input class="with-border" type="text" placeholder="{LANG_MAX}"
                                                       name="salary_max" value="{SALARY_MAX}">
                                                <i class="currency">{USER_CURRENCY_SIGN}</i>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-12">
                                            <select class="selectpicker with-border margin-bottom-16" data-size="7"
                                                    name="salary_type">
                                                {LOOP: SALARYTYPES}
                          <option value="{SALARYTYPES.id}" IF('{SALARY_TYPE}'=='{SALARYTYPES.id}'){ selected {:IF}>{LANG_PER} {SALARYTYPES.title}</option>
                          {/LOOP: SALARYTYPES}
                                            </select>
                                        </div>
                                        <div class="col-xl-12">
                                            <div class="checkbox">
                                                <input type="checkbox" id="negotiable" name="negotiable" value="1"
                                                       IF("{NEGOTIABLE}"=="1"){ checked {:IF}>
                                                <label for="negotiable"><span
                                                            class="checkbox-icon"></span> {LANG_NEGOTIABLE}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="ResponseCustomFields">
                                    {LOOP: CUSTOMFIELDS}
                                    IF('{CUSTOMFIELDS.type}'=="text-field"){
                                    <div class="submit-field">
                                        <h5>{CUSTOMFIELDS.title}</h5>
                                        {CUSTOMFIELDS.textbox}
                                    </div>
                                    {:IF}
                                    IF('{CUSTOMFIELDS.type}'=="textarea"){
                                    <div class="submit-field">
                                        <h5>{CUSTOMFIELDS.title}</h5>
                                        {CUSTOMFIELDS.textarea}
                                    </div>
                                    {:IF}
                                    IF('{CUSTOMFIELDS.type}'=="drop-down"){
                                    <div class="submit-field">
                                        <h5>{CUSTOMFIELDS.title}</h5>
                                        <select class="selectpicker with-border quick-custom-field"
                                                name="custom[{CUSTOMFIELDS.id}]" data-name="{CUSTOMFIELDS.id}"
                                                data-req="{CUSTOMFIELDS.required}">
                                            <option value="" selected>{LANG_SELECT} {CUSTOMFIELDS.title}</option>
                                            {CUSTOMFIELDS.selectbox}
                                        </select>
                                        <div class="quick-error">{LANG_FIELD_REQUIRED}</div>
                                    </div>
                                    {:IF}
                                    IF('{CUSTOMFIELDS.type}'=="radio-buttons"){
                                    <div class="submit-field">
                                        <h5>{CUSTOMFIELDS.title}</h5>
                                        {CUSTOMFIELDS.radio}
                                    </div>
                                    {:IF}
                                    IF('{CUSTOMFIELDS.type}'=="checkboxes"){
                                    <div class="submit-field">
                                        <h5>{CUSTOMFIELDS.title}</h5>
                                        {CUSTOMFIELDS.checkbox}
                                    </div>
                                    {:IF}
                                    {/LOOP: CUSTOMFIELDS}
                                </div>

                                <div class="submit-field">
                                    <h5>{LANG_PHONE_NUMBER}</h5>

                                    <div class="row">
                                        <div class="col-xl-6 col-md-12">
                                            <div class="input-with-icon-left">
                                                <i class="flag-img"><img
                                                            src="{SITE_URL}templates/{TPL_NAME}/images/flags/{USER_COUNTRY}.png"></i>
                                                <input type="text" class="with-border" name="phone" value="{PHONE}">
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-12">
                                            <div class="checkbox margin-top-12">
                                                <input type="checkbox" name="hide_phone" id="phone" value="1"
                                                       IF("{HIDEPHONE}"=="1"){ checked {:IF}>
                                                <label for="phone"><span
                                                            class="checkbox-icon"></span> {LANG_HIDE_FROM_USERS}</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- <div class="submit-field">
                                    <h5>{LANG_CITY} *</h5>
                                    <select id="jobcity" class="with-border" name="city" data-size="7"
                                            title="{LANG_SELECT} {LANG_CITY}">
                                        <option value="0" selected="selected">{LANG_SELECT} {LANG_CITY}</option>
                                        IF("{CITY}"!=""){
                                        <option value="{CITY}" selected="selected">{CITYNAME}</option> {:IF}
                                    </select>
                                </div> -->
                                <div class="submit-field">
                                    <div class="row">
                                        IF('{USER_COUNTRY}' == "us"){
                                        <div class="col-xl-4 col-md-12">
                                            <h5>ZIP CODE *</h5>
                                            <div class="quick-error" id="error-jobcity">ZIP CODE REQUIRED </div>
                                            <input class="with-border" type="text" placeholder="ZIP CODE"
                                                       name="zip_code" value="{ZIP}">
                                        </div>
                                        {:IF}
                                    </div>
                                </div>
                                IF({POST_ADDRESS_MODE}){
                                <div class="submit-field">
                                    <h5>{LANG_ADDRESS}</h5>
                                    <div class="input-with-icon">
                                        <div id="autocomplete-container" data-autocomplete-tip="{LANG_TYPE_ENTER}">
                                            <input class="with-border" type="text" placeholder="{LANG_ADDRESS}" name="location" id="address-autocomplete" value="{LOCATION}">
                                        </div>
                                        <div class="geo-location"><i class="la la-crosshairs"></i></div>
                                    </div>
                                    <div class="map shadow" id="singleListingMap" data-latitude="{LATITUDE}" data-longitude="{LONGITUDE}"  style="height: 200px" data-map-icon="map-marker"></div>
                                    <small>{LANG_DRAG_MAP_MARKER}</small>
                                    <input type="hidden" id="latitude" name="latitude" value="{LATITUDE}"/>
                                    <input type="hidden" id="longitude" name="longitude" value="{LONGITUDE}"/>
                                </div>
                                {:IF}
                                <div class="submit-field form-group">
                                    <h5>{LANG_APPLICATION_URL}</h5>

                                    <div class="input-with-icon">
                                        <input class="with-border" type="text" placeholder="http://"
                                               name="application_url" value="{APPLICATION_URL}">
                                        <i class="la la-link"></i>
                                    </div>
                                    <small>{LANG_APPLICATION_URL_HINT}</small>
                                </div>
                                IF("{POST_TAGS_MODE}"=="1"){
                                <!--
                                <div class="submit-field form-group">
                                    <h5>{LANG_TAGS}</h5>
                                    <input class="with-border" type="text" name="tags" value="{TAGS}">
                                    <small>{LANG_TAGS_HINT}</small>
                                </div>
                                -->
                                {:IF}
                            </div>
                        </div>
                    </div>
            </div>
            IF(!{LOGGED_IN}){
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="icon-feather-user"></i> {LANG_USER_DETAILS}</h3>
                </div>
                <div class="content with-padding padding-bottom-10">
                    <div class="row">
                        <div class="col-xl-6 col-md-12">
                            <div class="submit-field">
                                <h5>{LANG_FULL_NAME} *</h5>

                                <div class="input-with-icon-left">
                                    <i class="la la-user"></i>
                                    <input type="text" class="with-border" name="user_name" value="{SELLER_NAME}">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-md-12">
                            <div class="submit-field">
                                <h5>{LANG_EMAIL} *</h5>

                                <div class="input-with-icon-left">
                                    <i class="la la-envelope"></i>
                                    <input type="email" class="with-border" name="user_email" value="{SELLER_EMAIL}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            {:IF}
            <!-- Custom Fields -->
            <div class="dashboard-box margin-bottom-30">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="la la-building"></i> {LANG_COMMUNICATIONS}</h3>
                </div>
                <div class="content with-padding padding-bottom-10">
                    <div class="row">
                        <div class="submit-field form-group">
                            <h5>{LANG_COMMUNICATION_EMAIL}</h5>
                            <p>{LANG_SEND_DAILY_UPDATES_ABOUT_THIS_JOB_APPLICATION_TO}
                            <div class="input-with-icon">
                                <input class="with-border" type="email" placeholder="jhon@email.com"
                                       name="comm_email" value="{COMM_EMAIL}">
                                <i class="la la-link"></i>
                            </div>
                            <small>{LANG_EMAIL_COMMUNICATION_HINT}</small>
                        </div>
                    </div>
                </div>
            </div>

            IF({POST_PREMIUM_LISTING}){
            <div class="dashboard-box">
                <div class="headline">
                    <h3><i class="icon-feather-zap"></i> {LANG_MAKE_PREMIUM}
                        <small>({LANG_OPTIONAL})</small>
                    </h3>
                </div>
                <div class="content with-padding">
                    <div class="payment">

                        <div class="payment-tab " style="display:none;">
                            <div class="payment-tab-trigger">
                                <input  id="free" name="make_premium" type="radio" value="0">
                                <label for="free">{LANG_FREE_JOB}</label>
                            </div>
                            <div class="payment-tab-content">
                                <p>{LANG_CHECK_BY_TEAM}</p>
                            </div>
                        </div>

                        <div class="payment-tab payment-tab-active">
                            <div class="payment-tab-trigger">
                                <input checked type="radio" name="make_premium" id="make_premium" value="1">
                                <label for="make_premium">{LANG_PREMIUM} <span
                                            class="badge green pull-right">{LANG_RECOMMENDED}</span></label>
                            </div>

                        <!-- Custom Fields -->
                        <div class="row premium-plans" style="padding: 15px;">
                                <div class="col-lg-9 premium-plans-text">
                                    <div class="row">
                                        <span class="col-sm-5">
                                            <h5>{LANG_ADD_VIEW}</h5>
                                            <select class="form-control days with-border" id="edays" name="ad_days" style="padding: 10px;">
                                                <option value="" selected disabled>Select Ad Duration</option>
                                                <option value="1">{LANG_RUN_CONTINUS}</option>
                                                <option value="14">{LANG_14_DAYS}</option>
                                                <option value="30">{LANG_30_DAYS}</option>
                                                <option value="0">{LANG_CUSTOM_END_DATE}</option>
                                            </select>
                                        </span>
                                        <span class="col-sm-4" style="display: none">
                                            <h5> {LANG_DAYS}</h5>
                                            <input type="number" class="form-control days with-border" placeholder="No. of Days" name="days" value="0" >
                                        </span>
                                        <span class="col-sm-4" id="enddate"  style="display: none">
                                            <h5> {LANG_END_DATE}</h5>
                                            <input type="date" class="form-control enddate with-border" placeholder="End Date" min="<?php echo date('d/m/Y'); ?>" name="enddate">
                                        </span>
                                        <span class="col-sm-6" id="noE">
                                            <h5> {LANG_CVS} </h5>
                                            <select class="form-control days with-border" id="employees" name="employees" onchange="$('#cvs').val($(this).find('option:selected').attr('value'))  ;" style="padding: 10px;">
                                                <option value="" selected disabled>No. of Employees</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                            </select>
                                            
                                            <input type="hidden" class="form-control cvs with-border" placeholder="Employees" id="cvs" name="cvs" value="0" min="0" max="300">
                                            <input type="hidden" id="customFee" name="customFee" value="">
                                        </span>
                                    </div>
                                </div>
                                <div class="col-lg-3 premium-plans-price">
                                    <h5> {LANG_TOTAL_FEE} </h5>
                                    <span class="customFee"></span> {LANG_FOR} <span id="customDays"></span> {LANG_DAYS}
                                </div>
                        </div>
                            <div class="payment-tab-content">
                                <p>{LANG_UPGRADE_TEXT_INFO}</p>

                                <div class="row premium-plans">
                                    <div class="col-lg-3">
                                        <div class="checkbox">
                                            <input type="checkbox" id="featured" name="featured" value="1"
                                                   onchange="fillPrice(this,{FEATURED_FEE});">
                                            <label for="featured"><span class="checkbox-icon"></span> <span
                                                        class="badge blue">{LANG_FEATURED}</span></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 premium-plans-text">
                                        {LANG_FEATURED_AD_TEXT}
                                    </div>
                                    <div class="col-lg-3 premium-plans-price">
                                        $ {FEATURED_FEE} {LANG_FOR} {FEATURED_DURATION} {LANG_DAYS}
                                    </div>
                                </div>
                                <div class="row premium-plans" style="display:none;">
                                    <div class="col-lg-3">
                                        <div class="checkbox">
                                            <input type="checkbox" id="urgent" name="urgent" value="1"
                                                   onchange="fillPrice(this,{URGENT_FEE});">
                                            <label for="urgent"><span class="checkbox-icon"></span> <span
                                                        class="badge yellow">{LANG_URGENT}</span></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 premium-plans-text">
                                        {LANG_URGENT_AD_TEXT}
                                    </div>
                                    <div class="col-lg-3 premium-plans-price">
                                        $ {URGENT_FEE} {LANG_FOR} {URGENT_DURATION} {LANG_DAYS}
                                    </div>
                                </div>
                                <div class="row premium-plans" style="display:none;">
                                    <div class="col-lg-3">
                                        <div class="checkbox">
                                            <input type="checkbox" id="highlight" name="highlight" value="1"
                                                   onchange="fillPrice(this,{HIGHLIGHT_FEE});">
                                            <label for="highlight"><span class="checkbox-icon"></span> <span
                                                        class="badge red">{LANG_HIGHLIGHT}</span></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 premium-plans-text">
                                        {LANG_HIGHLIGHT_AD_TEXT}
                                    </div>
                                    <div class="col-lg-3 premium-plans-price">
                                        $ {HIGHLIGHT_FEE} {LANG_FOR} {HIGHLIGHT_DURATION} {LANG_DAYS}
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            {:IF}
            IF("{RESUBMIT}"=="1"){
            <div class="dashboard-box">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="icon-feather-user"></i> {LANG_MSG_REVIEWER}</h3>
                </div>
                <div class="content with-padding padding-bottom-10">
                    <div class="submit-field">
                        <h5>{LANG_COMMENT} *</h5>
                        <textarea class="with-border" name="comments" ></textarea>
                        <small>{LANG_COMMENT_PLACEHOLDER}</small>
                    </div>
                </div>
            </div>
            {:IF}
            <input type="hidden" name="product_id" value="{ITEM_ID}">
            <input type="hidden" name="submit">

            <div class="row margin-top-30 margin-bottom-80" style="align-items: center;">
                <div class="col-6">
                    <button type="submit" id="submit_job_button" name="Submit" class="button ripple-effect big"><i
                                class="icon-feather-plus"></i> SAVE AND CONTINUE</button>
                </div>
                <div class="col-6">
                    <div id="ad_total_cost_container" class="text-right" style="display: none">
                        <strong>
                            {LANG_TOTAL}:
                            <span class="currency-sign">{CURRENCY_SIGN}</span>
                            <span id="totalPrice">0</span>
                            <span class="currency-code">{CURRENCY_CODE}</span>
                        </strong>
                    </div>
                </div>
            </div>
            </form>
        </div>
        <div class="col-xl-4 hide-under-992px">
            <div class="dashboard-box margin-top-0">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="icon-feather-alert-circle"></i> {LANG_TIPS}</h3>
                </div>
                <div class="content with-padding padding-bottom-10">
                    <ul class="list-2">
                        <li>{LANG_POST_JOB_TIPS1}</li>
                        <li>{LANG_POST_JOB_TIPS2}</li>
                        <li>{LANG_POST_JOB_TIPS3}</li>
                        <li>{LANG_POST_JOB_TIPS4}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<link href="{SITE_URL}templates/{TPL_NAME}/css/category-modal.css" type="text/css" rel="stylesheet">
<link href="{SITE_URL}templates/{TPL_NAME}/css/owl.post.carousel.css" type="text/css" rel="stylesheet">
<link href="{SITE_URL}templates/{TPL_NAME}/css/select2.min.css" rel="stylesheet"/>
<script src="{SITE_URL}templates/{TPL_NAME}/js/select2.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/i18n/{LANG_CODE}.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/owl.carousel-category.min.js"></script>

<script>
    var ajaxurl = "{APP_URL}user-ajax.php";
    var lang_edit_cat = "<i class='icon-feather-check-circle'></i> &nbsp;{LANG_EDIT_CATEGORY}";

    $('#company-select').on('change', function () {
        if ($('#company-select').val() == 0) {
            $('.new-company').slideDown('fast');
            ;
        } else {
            $('.new-company').slideUp('fast');
        }
    });
    $('.company-select').trigger('change');
</script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.form.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/job_post.js"></script>
<script>



var today = new Date().toISOString().split('T')[0];
document.getElementsByName("enddate")[0].setAttribute('min', today);
var days = 0;

function DaysBetween(StartDate, EndDate) {
  // The number of milliseconds in all UTC days (no DST)
  const oneDay = 1000 * 60 * 60 * 24;

  var start = new Date(StartDate);
  var end = new Date(EndDate);
  // A day in UTC always lasts 24 hours (unlike in other time formats)
  //const start = Date.UTC(EndDate.getFullYear(), EndDate.getMonth(), EndDate.getDate());
  //const end = Date.UTC(StartDate.getFullYear(), StartDate.getMonth(), StartDate.getDate());

  // so it's safe to divide by 24 hours
  return (end.getTime() - start.getTime()) / oneDay;
}

$('.enddate').change(function(){
    var dat = $(this).val();
    console.log(dat);
    days = DaysBetween(today, dat);
});

$('#edays').change(function(){
    $("#noE").addClass("col-sm-6");
    $("#noE").removeClass("col-sm-3");
    
  if($(this).val() == '0'){ 
    $("#noE").addClass("col-sm-3");
    $("#noE").removeClass("col-sm-6");
    $("#enddate").css("display", "block");
    
  }else if($(this).val() == 14){
    $("#enddate").css("display", "none");
    days = 14;
    $("#setDays").val(days);
  }else if($(this).val() == 30){
    $("#enddate").css("display", "none");
    days = 30;
    $("#setDays").val(days);
  }else if($(this).val() == '1'){
    $("#enddate").css("display", "none");
    days = 1;
    $("#setDays").val(days);
  }
});


$(document).on('change', '.days, .cvs, #edays, .enddate', function() {
        //var days = $('.days').val();
        var cvs = $('.cvs').val();
        var total = (days * 3) + (cvs * 1);
        var display = $('.customFee').text('$ ' + total);
        var displayFee = $('#customFee').val(total);
        var displayDays = $('#customDays').text(days);
        

        var c = parseFloat(total).toFixed(2);
        $('#ad_total_cost_container').fadeIn();
        if (c == 0) {
            $('#ad_total_cost_container').fadeOut();
        }
        $('#totalPrice').html(c);
});


</script>
IF("{POST_DESC_EDITOR}"=="1"){
<link media="all" rel="stylesheet" type="text/css"
      href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/styles/simditor.css"/>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/mobilecheck.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/module.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/uploader.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/hotkeys.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/simditor.js"></script>
<script>
    (function () {
        $(function () {
            var $preview, editor, mobileToolbar, toolbar, allowedTags;
            Simditor.locale = 'en-US';
            toolbar = ['title', 'bold','italic','underline','|','ol','ul','blockquote','table','link','|','image','hr','indent','outdent','alignment'];
            mobileToolbar = ["bold", "italic", "underline", "ul", "ol"];
            if (mobilecheck()) {
                toolbar = mobileToolbar;
            }
            allowedTags = ['br', 'span', 'a', 'img', 'b', 'strong', 'i', 'strike', 'u', 'font', 'p', 'ul', 'ol', 'li', 'blockquote', 'pre', 'h1', 'h2', 'h3', 'h4', 'hr', 'table'];
            editor = new Simditor({
                textarea: $('.text-editor'),
                placeholder: '',
                toolbar: toolbar,
                toolbarFloat: false,
                pasteImage: false,
                defaultImage: '{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/images/image.png',
                upload: false,
                allowedTags: allowedTags
            });
            $preview = $('#preview');
            if ($preview.length > 0) {
                return editor.on('valuechanged', function (e) {
                    return $preview.html(editor.getValue());
                });
            }
        });
    }).call(this);
</script>
{:IF}

IF({POST_ADDRESS_MODE}){
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
    <script>
        $('#jobcity').on('change', function() {
            var data = $("#jobcity option:selected").val();
            var custom_data= $("#jobcity").select2('data')[0];
            var latitude = custom_data.latitude;
            var longitude = custom_data.longitude;
            var address = custom_data.text;
            $('#latitude').val(latitude);
            $('#longitude').val(longitude);
            if (document.getElementById("singleListingMap") !== null && singleListingMap) {
                $("#address-autocomplete").val(address);
                var newLatLng = new L.LatLng(latitude, longitude);
                singleListingMapMarker.setLatLng(newLatLng);
                singleListingMap.flyTo(newLatLng, 10);
            }
        });
    </script>
    {:IF}
{:IF}
{OVERALL_FOOTER}
