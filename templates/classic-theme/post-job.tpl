{OVERALL_HEADER}<style>
    textarea:focus :focus {
        border: 1px solid #2d74c8;
        box-shadow: 2px 2px 4px 2px rgba(45, 116, 200, 0.2)
    }

    .errorStyle {
        border: 2px solid red;
        border-radius: 5px;
    }

    .errorrStyle {
        outline: 2px solid red;
    }
</style>
<div id="post_ad_email_exist" class="mfp-wrap mfp-close-btn-in mfp-auto-cursor mfp-align-top my-mfp-zoom-in mfp-ready"
    tabindex="-1" style="display: none">
    <div class="mfp-container mfp-inline-holder">
        <div class="mfp-content">
            <div class="zoom-anim-dialog dialog-with-tabs popup-dialog">
                <ul class="popup-tabs-nav" style="pointer-events: none;">
                    <li class="active"><a href="#exist_acc">{LANG_LINK_EXIST_ACCOUNT}</a></li>
                </ul>
                <div class="popup-tabs-container">
                    <div class="popup-tab-content" id="exist_acc" style="">
                        <form accept-charset="utf-8" id="email_exists_login">
                            <p id="email_exists_success" style="display: none;"> <span
                                    class="status-available">{LANG_LINK_ACCOUNT_SUCCESS}</span> </p>
                            <p><span id="quickad_email_already_linked"></span> <br>{LANG_ENTER_PASS_LINK_AC}</p>
                            <p id="email_exists_error" style="display: none;"></p>
                            <div class="form-group"> <span>{LANG_USERNAME}:</span> <strong
                                    id="quickad_username_display"></strong> </div>
                            <div class="form-group"> <span>{LANG_EMAIL}:</span> <strong
                                    id="quickad_email_display"></strong> </div>
                            <div> <span>{LANG_PASSWORD}:</span> <input type="password"
                                    class="with-border margin-bottom-0" id="password" name="password"> <a
                                    href="{LINK_LOGIN}?fstart=1" target="_blank" id="fb_forgot_password_btn">
                                    <small>{LANG_FORGOT_PASSWORD}</small> </a> </div>
                            <div> <input type="hidden" name="email" id="email" value="" /> <input type="hidden"
                                    name="username" id="username" value="" /> <button id="link_account" type="button"
                                    value="Submit" class="button ripple-effect"> {LANG_LINK_ACCOUNT} </button> </div>
                        </form>
                        <div id="email_exists_user">
                            <p>{LANG_EMAIL_LINKED_USER}</p> <button type="button" class="button ripple-effect"
                                id="change-email"> {LANG_CHANGE_EMAIL} </button>
                        </div>
                    </div>
                </div> <button type="button" class="mfp-close"></button>
            </div>
        </div>
    </div>
    <div class="mfp-bg my-mfp-zoom-in mfp-ready"></div>
</div><!-- Select Category Modal -->
<div class="zoom-anim-dialog mfp-hide popup-dialog big-dialog" id="categoryModal">
    <div class="popup-tab-content padding-0 tg-thememodal tg-categorymodal">
        <div class="tg-thememodaldialog">
            <div class="tg-thememodalcontent">
                <div class="tg-title"> <strong>{LANG_SELECT} {LANG_CATEGORY}</strong> </div>
                <div id="tg-dbcategoriesslider"
                    class="tg-dbcategoriesslider tg-categories owl-carousel select-category post-option"> </div>
                <ul class="tg-subcategories" style="display: none">
                    <li>
                        <div class="tg-title"> <strong>{LANG_SELECT} {LANG_SUBCATEGORY}</strong>
                            <div id="sub-category-loader" style="visibility:hidden"></div>
                        </div>
                        <div class=" tg-verticalscrollbar tg-dashboardscrollbar">
                            <ul id="sub_category"> </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div><!-- Select Category Modal -->
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_POST_JOB}</h1> <!-- Breadcrumbs -->
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
<div class="section black">
    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-md-12">
                <div id="post_error"></div>
                <div class="payment-confirmation-page dashboard-box margin-top-0 padding-top-0 margin-bottom-50"
                    style="display: none">
                    <div class="headline">
                        <h3>{LANG_SUCCESS}</h3>
                    </div>
                    <div class="content with-padding padding-bottom-10"> <i class="la la-check-circle"></i>
                        <h2 class="margin-top-30">{LANG_SUCCESS}</h2>
                        <p>{LANG_JOBSUCCESS}</p>
                    </div>
                </div>
                <form id="post_job_form" action="{LINK_POST-JOB}?action=post_job" method="post"
                    enctype="multipart/form-data" accept-charset="UTF-8"
                    style="color: black !important; font-weight: bolder !important;"> IF({COMPANY_ENABLE}){ <div
                        class="dashboard-box margin-top-0 margin-bottom-30 quick-custom-field"> <!-- Headline -->
                        <div class="headline">
                            <h3><i class="la la-building"></i> {LANG_COMPANY_INFO}</h3>
                        </div>
                        <div class="content with-padding padding-bottom-10">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="submit-field my_pen">

                                        <h5>{LANG_COMPANY} *</h5>
                                        <select id="company-select" class="selectpicker with-border comp-error-b "
                                            title="{LANG_SELECT} {LANG_COMPANY}" data-size="7" name="company"> {LOOP:
                                            COMPANIES} <option value="{COMPANIES.id}">{COMPANIES.title}</option>
                                            {/LOOP: COMPANIES} <option value="0">{LANG_NEW_COMPANY}</option> </select>
                                        <small id="comp-error" style="color:red"></small>
                                    </div>
                                    <div class="col-xl-12 new-company" style="display: none">
                                        <div class="submit-field my_pen">
                                            <h5>{LANG_COMPANY_NAME} *</h5> <input type="text"
                                                class="with-border new-company-error-b" name="company_name"
                                                id="new-company">
                                        </div>
                                    </div>
                                    <div class="submit-field my_pen">
                                        <h5>{LANG_YOUR_COMPANY_NUMBER_OF_EMPLOYEES} *</h5> <select
                                            id="company-employees" class="selectpicker with-border emp-error-b"
                                            title="{LANG_SELECT} {LANG_COMPANY_EMPLOYEES}" data-size="7"
                                            name="company_employees">
                                            <option value="">{LANG_SELECT_EMPLOYEES}</option>
                                            <option value="EMPLOYEE_1_49">{LANG_EMPLOYEE_1_49}</option>
                                            <option value="EMPLOYEE_50_149">{LANG_EMPLOYEE_50_149}</option>
                                            <option value="EMPLOYEE_150_249">{LANG_EMPLOYEE_150_249}</option>
                                            <option value="EMPLOYEE_250_499">{LANG_EMPLOYEE_250_499}</option>
                                            <option value="EMPLOYEE_500_749">{LANG_EMPLOYEE_500_749}</option>
                                            <option value="EMPLOYEE_750_999">{LANG_EMPLOYEE_750_999}</option>
                                        </select> <small id="emp-error" style="color:red"></small>
                                    </div>
                                    <div class="submit-field my_pen">
                                        <h5>{LANG_YOUR_ROLE_IN_HIRING_PROCESS} *</h5> <select
                                            id="company-hiring-process" class="selectpicker with-border hir-error-b "
                                            title="{LANG_SELECT} {LANG_YOUR_ROLE_IN_HIRING_PROCESS}"
                                            name="company_role">
                                            <option value="">{LANG_SELECT_ROLE}</option>
                                            <option value="hrg">{LANG_HUMAN_RESOURCE_GENERALIST}</option>
                                            <option value="ceo">{LANG_OWNER_CEO}</option>
                                            <option value="rec">{LANG_RECRUITER_OR_TALLENT_ACQUISITION}</option>
                                            <option value="om">{LANG_ASSISTANT_OR_OFFICE_MANAGER}</option>
                                            <option value="hrm">{LANG_HIRING_MANAGER}</option>
                                            <option value="other">{LANG_OTHER}</option>
                                        </select> <small id="hir-error" style="color:red"></small>
                                    </div>
                                    <!--                                    <div class="submit-field my_pen">                                        <h5>{LANG_TYPICAL_HIRING_BUDGET}</h5>                                        <select id="company-hiring-budget" class="selectpicker with-border errorr" title="{LANG_SELECT} {LANG_TYPICAL_HIRING_BUDGET}" name="company_budget">                                            <option value="">{LANG_SELECT_OPTION}</option>                                            <option value="1">{LANG_I_HAVE_A_BUDGET_FOR_MY_ROLE}</option>                                            <option value="2">{LANG_NO_PLANNED_BUDGET_BUT_I_CAN_SPEND_IF_NEEDED}</option>                                            <option value="3">{LANG_I_AM_NOT_ABLE_TO_SPEND_ON_HIRING}</option>                                        </select>                                    </div> -->
                                    <div class="submit-field my_pen">
                                        <h5>{LANG_HOW_YOU_HEARD_ABOUT_US} *</h5> <select id="hear-about-us"
                                            class="selectpicker with-border hear-error-b"
                                            title="{LANG_SELECT} {LANG_HOW_YOU_HEARD_ABOUT_US}" name="hear_about_us">
                                            <option value="" selected>{LANG_SELECT_OPTION}</option>
                                            <option value="1">{LANG_MAIL}</option>
                                            <option value="3">{LANG_TV}</option>
                                            <option value="4">{LANG_SOCIAL_MEDIA}</option>
                                            <option value="5">{LANG_ONLINE_VIDEO}</option>
                                            <option value="6">{LANG_RADIO_AM_FM_XM}</option>
                                            <option value="7">{LANG_PODCAST}</option>
                                            <option value="8">{LANG_STREAMING_AUDIO}</option>
                                            <option value="9">{LANG_BILLBOARD}</option>
                                            <option value="10">{LANG_NEWSPAPER}</option>
                                            <option value="11">{LANG_SEARCH_ENGINE}</option>
                                            <option value="12">{LANG_OTHER}</option>
                                        </select> <small id="hear-error" style="color:red"></small>
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_HOW_WOULD_YOU_LIKE_TO_RECEIVE_APPLICATIONS?}</h5>
                                        <div class="radio margin-right-20"> <input class="with-gap" type="radio"
                                                name="app_receive_type" id="Male" value="email" checked=""> <label
                                                for="Male"><span class="radio-label"></span>{LANG_VIA_EMAIL}</label>
                                        </div> <br>
                                        <div class="radio margin-right-20"> <input class="with-gap" type="radio"
                                                name="app_receive_type" id="Female" value="interview"> <label
                                                for="Female"><span
                                                    class="radio-label"></span>{LANG_WALK_INTERVIEW}</label> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> {:IF} <div class="dashboard-box margin-top-0"> <!-- Headline -->
                        <div class="headline">
                            <h3><i class="icon-feather-briefcase"></i> {LANG_JOB_DETAILS}</h3>
                        </div>
                        <div class="content with-padding padding-bottom-10">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="submit-field ac ac-what" id="ac-s">
                                        <h5>{LANG_TITLE} *</h5> <input type="text" id="s"
                                            class="with-border p-title fc aci title-error-b" name="title"
                                            data-ac="//ac.careerjet.net/ns" data-target="#ac-s" data-target2="#s"
                                            data-lc="en_US" data-mhd="10" data-mhm="3"> <button type="button"
                                            tabindex="-1" class="fc-clear ac-clear" data-target="#s"> </button>
                                        <div class="quick-error" id="error-p-title">{LANG_JOB_TITLE_REQ} </div> <small
                                            id="title-error" style="color:red"></small>
                                    </div>
                                    <div class="submit-field ac ac-where" id="ac-l">
                                        <h5>{LANG_LOCATION} *</h5> <input id="l" name="city" value="" class="fc aci mts"
                                            type="text" placeholder="{LANG_TOWN_REGION}"
                                            data-ac="//www.jobtotop.com/autocomplete" data-target="#ac-l"
                                            data-target2="#l" data-loc="1" data-loctext="Use my current location"
                                            data-lc="{USER_COUNTRY_LOCAL}" data-mhd="10" data-mhm="3"> <input
                                            type="hidden" name="job_country" value="{USER_COUNTRY_LOCAL}"> <button
                                            type="button" tabindex="-1" class="fc-clear ac-clear" data-target="#l">
                                            <svg>
                                                <use xlink:href="#icon-cross-circle-filled"></use>
                                            </svg> </button>
                                        <div class="quick-error" id="error-p-title">{LANG_JOB_LOCATION_REQ} </div>
                                        <small id="title-error" style="color:red"></small>
                                    </div> IF({JOB_IMAGE_FIELD}){ <div class="submit-field">
                                        <h5>{LANG_IMAGE}</h5>
                                        <div class="uploadButton"> <input class="uploadButton-input" type="file"
                                                accept="image/*" id="job_image" name="job_image" /> <label
                                                class="uploadButton-button ripple-effect"
                                                for="job_image">{LANG_UPLOAD_IMAGE}</label> <span
                                                class="uploadButton-file-name">{LANG_LOGO_HINT}</span> </div>
                                    </div> {:IF} <div class="submit-field">
                                        <h5>{LANG_DESCRIPTION} *</h5>
                                        <div class="quick-error" id="error-p-desc">{LANG_DESC_REQ} </div> <textarea
                                            cols="30" rows="5" id="p-desc"
                                            class="with-border text-editor desc-error-b p-desc"
                                            style="textarea:focus {border: 1px solid #2d74c8;box-shadow: 2px 2px 4px 2px rgba(45, 116, 200, 0.2) }"
                                            name="content"></textarea> <small id="desc-error" style="color:red"></small>
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_JOB_TYPE} *</h5>
                                        <div class="quick-error" id="error-job-type">{LANG_JOB_TYPE_REQ} </div> <select
                                            class="selectpicker with-border jtype-error-b" id="job-type" data-size="7"
                                            name="job_type"> {LOOP: POSTTYPES} <option value="{POSTTYPES.id}">
                                                {POSTTYPES.title}</option> {/LOOP: POSTTYPES} </select> <small
                                            id="jtype-error" style="color:red"></small>
                                    </div>
                                    <div class="submit-field">
                                        <h5>{LANG_SALARY}</h5>
                                        <div class="quick-error" id="error-salary_max">{LANG_SALARY_MUST_NO} </div>
                                        <div class="row">
                                            <div class="col-xl-4 col-md-12">
                                                <div class="input-with-icon"> <input class="with-border" type="text"
                                                        placeholder="{LANG_MIN}" name="salary_min"> <i
                                                        class="currency">{USER_CURRENCY_SIGN}</i> </div>
                                            </div>
                                            <div class="col-xl-4 col-md-12">
                                                <div class="input-with-icon"> <input id="salary"
                                                        class="with-border salary-error-b" type="text"
                                                        placeholder="{LANG_MAX}" name="salary_max"> <i
                                                        class="currency">{USER_CURRENCY_SIGN}</i> <small
                                                        id="salary-error" style="color:red"></small> </div>
                                            </div>
                                            <div class="col-xl-4 col-md-12"> <select
                                                    class="selectpicker with-border margin-bottom-16" data-size="7"
                                                    name="salary_type"> {LOOP: SALARYTYPES} <option
                                                        value="{SALARYTYPES.id}">{LANG_PER} {SALARYTYPES.title}</option>
                                                    {/LOOP: SALARYTYPES} </select> </div>
                                            <div class="col-xl-12">
                                                <div class="checkbox"> <input type="checkbox" id="negotiable"
                                                        name="negotiable" value="1"> <label for="negotiable"><span
                                                            class="checkbox-icon"></span> {LANG_NEGOTIABLE}</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="ResponseCustomFields"> {LOOP: CUSTOMFIELDS}
                                        IF('{CUSTOMFIELDS.type}'=="text-field"){ <div class="submit-field">
                                            <h5>{CUSTOMFIELDS.title}</h5> {CUSTOMFIELDS.textbox}
                                        </div> {:IF} IF('{CUSTOMFIELDS.type}'=="textarea"){ <div class="submit-field">
                                            <h5>{CUSTOMFIELDS.title}</h5> {CUSTOMFIELDS.textarea}
                                        </div> {:IF} IF('{CUSTOMFIELDS.type}'=="drop-down"){ <div class="submit-field">
                                            <h5>{CUSTOMFIELDS.title}</h5> <select
                                                class="selectpicker with-border quick-custom-field"
                                                name="custom[{CUSTOMFIELDS.id}]" data-name="{CUSTOMFIELDS.id}"
                                                data-req="{CUSTOMFIELDS.required}">
                                                <option value="" selected>{LANG_SELECT} {CUSTOMFIELDS.title}</option>
                                                {CUSTOMFIELDS.selectbox}
                                            </select>
                                            <div class="quick-error">{LANG_FIELD_REQUIRED}</div>
                                        </div> {:IF} IF('{CUSTOMFIELDS.type}'=="radio-buttons"){ <div
                                            class="submit-field">
                                            <h5>{CUSTOMFIELDS.title}</h5> {CUSTOMFIELDS.radio}
                                        </div> {:IF} IF('{CUSTOMFIELDS.type}'=="checkboxes"){ <div class="submit-field">
                                            <h5>{CUSTOMFIELDS.title}</h5> {CUSTOMFIELDS.checkbox}
                                        </div> {:IF} {/LOOP: CUSTOMFIELDS} </div>
                                    <div class="submit-field">
                                        <h5>{LANG_PHONE_NUMBER}</h5>
                                        <div class="row">
                                            <div class="col-xl-6 col-md-12">
                                                <div class="input-with-icon-left"> <i class="flag-img"><img
                                                            src="{SITE_URL}templates/{TPL_NAME}/images/flags/{USER_COUNTRY}.png"></i>
                                                    <input type="text" class="with-border phone-error-b"
                                                        id="phone-contact" name="phone" value="+{USER_PHONE_CODE}">
                                                </div> <small id="phone-error" style="color:red"></small>
                                            </div>
                                            <div class="col-xl-6 col-md-12">
                                                <div class="checkbox margin-top-12"> <input type="checkbox"
                                                        name="hide_phone" id="phone" value="1"> <label for="phone"><span
                                                            class="checkbox-icon"></span> {LANG_HIDE_FROM_USERS}
                                                    </label> </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--                                    <div class="submit-field">                                        <h5>{LANG_CITY} *</h5>                                        <div class="quick-error" id="error-jobcity">{LANG_CITY_REQ} </div>                                        <select id="jobcity" class="with-border errorr jobcity" name="city" data-size="50"                                                title="{LANG_SELECT} {LANG_CITY}">                                            <option value="0" selected="selected">{LANG_SELECT} {LANG_CITY}</option>                                        </select>                                    </div> -->
                                    <!-- CUstom Fields -->
                                    <div class="submit-field">
                                        <div class="row"> IF('{USER_COUNTRY}' == "us"){ <div class="col-xl-6 col-md-12">
                                                <h5>ZIP CODE * </h5>
                                                <div class="quick-error" id="error-zip">{LANG_INVALID_ZIP_CODE} </div>
                                                <input class="with-border" type="text" placeholder="ZIP CODE"
                                                    name="zip_code" pattern="[0-9]*">
                                            </div> {:IF} </div>
                                    </div> IF({POST_ADDRESS_MODE}){ <div class="submit-field">
                                        <h5>{LANG_ADDRESS}</h5>
                                        <div class="input-with-icon">
                                            <div id="autocomplete-container" data-autocomplete-tip="{LANG_TYPE_ENTER}">
                                                <input class="with-border" type="text" placeholder="{LANG_ADDRESS}"
                                                    name="location" id="address-autocomplete"> </div>
                                            <div class="geo-location"><i class="la la-crosshairs"></i></div>
                                        </div>
                                        <div class="map shadow" id="singleListingMap" data-latitude="{LATITUDE}"
                                            data-longitude="{LONGITUDE}" style="height: 200px"
                                            data-map-icon="map-marker"></div> <small>{LANG_DRAG_MAP_MARKER}</small>
                                        <input type="hidden" id="latitude" name="latitude" value="{LATITUDE}" /> <input
                                            type="hidden" id="longitude" name="longitude" value="{LONGITUDE}" />
                                    </div> {:IF} <div class="submit-field form-group">
                                        <h5>{LANG_APPLICATION_URL} <small>({LANG_OPTIONAL})</small></h5>
                                        <div class="quick-error" id="error-application_url">
                                            {LANG_APPLICATION_URL_INVALID} </div>
                                        <div class="input-with-icon"> <input class="with-border" type="text"
                                                placeholder="http://" name="application_url"> <i class="la la-link"></i>
                                        </div> <small>{LANG_APPLICATION_URL_HINT}</small>
                                    </div> IF("{POST_TAGS_MODE}"=="2"){ <div class="submit-field form-group">
                                        <h5>{LANG_TAGS}</h5> <input class="with-border" type="text" name="tags">
                                        <small>{LANG_TAGS_HINT}</small>
                                    </div> {:IF}
                                </div>
                            </div>
                        </div>
                    </div> IF(!{LOGGED_IN}){ <div class="dashboard-box"> <!-- Headline -->
                        <div class="headline">
                            <h3><i class="icon-feather-user"></i> {LANG_USER_DETAILS}</h3>
                        </div>
                        <div class="content with-padding padding-bottom-10">
                            <div class="row">
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_FULL_NAME} *</h5>
                                        <div class="input-with-icon-left"> <i class="la la-user"></i> <input type="text"
                                                id="full-name" class="with-border errorr full-name" name="user_name">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_EMAIL} *</h5>
                                        <div class="input-with-icon-left"> <i class="la la-envelope"></i> <input
                                                type="email" id="user-email" class="with-border errorr user-email"
                                                name="user_email"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> {:IF} <div class="dashboard-box margin-bottom-30"> <!-- Headline -->
                        <div class="headline">
                            <h3><i class="la la-building"></i> {LANG_COMMUNICATIONS}</h3>
                        </div>
                        <div class="content with-padding padding-bottom-10">
                            <div class="row">
                                <div class="submit-field form-group">
                                    <h5>{LANG_COMMUNICATION_EMAIL}</h5>
                                    <p>Send updates about this job application to </p>
                                    <br>
                                    <div class="input-with-icon"> <input class="with-border" type="email"
                                            placeholder="jhon@email.com" name="comm_email"> <i class="la la-link"></i>
                                    </div> <small>Allow people to contact you about their applications. Messages will be sent to the same email address you provided.</small>
                                </div>
                            </div>
                        </div>
                    </div> IF({POST_PREMIUM_LISTING}){ <div class="dashboard-box">
                        <div class="headline">
                            <h3><i class="icon-feather-zap"></i> Make your Job Standard <small>({LANG_OPTIONAL})</small>
                            </h3>
                        </div>
                        <div class="content with-padding">
                            <div class="payment">
                                <div class="payment-tab " style="display:block;">
                                    <div class="payment-tab-trigger"> <input id="free" name="make_premium" type="radio"
                                            value="0"> <label for="free">{LANG_FREE_JOB}</label> </div>
                                    <div class="payment-tab-content">
                                        <p>{LANG_CHECK_BY_TEAM}</p>
                                    </div>
                                </div>
                                <div class="payment-tab payment-tab-active">
                                    <div class="payment-tab-trigger"> <input checked type="radio" name="make_premium"
                                            id="make_premium" value="1"> <label for="make_premium">Standard</label> </div>
                                    <div class="row premium-plans" style="padding: 15px;">
                                        <div class="col-lg-9 premium-plans-text">
                                            <div class="row"> <span class="col-sm-5">
                                                    <h5>{LANG_ADD_VIEW}</h5> <select
                                                        class="form-control days with-border" id="edays" name="ad_days"
                                                        style="padding: 10px;">
                                                        <option value="" selected disabled>Select Ad Duration</option>
                                                        <option value="1">{LANG_RUN_CONTINUS}</option>
                                                        <option value="14">{LANG_14_DAYS}</option>
                                                        <option value="30">{LANG_30_DAYS}</option>
                                                        <option value="0">{LANG_CUSTOM_END_DATE}</option>
                                                    </select>
                                                </span> <span class="col-sm-4" style="display: none">
                                                    <h5> {LANG_DAYS}</h5> <input type="hidden"
                                                        class="form-control with-border" id="setDays"
                                                        placeholder="No. of Days" name="days" value="0">
                                                </span> <span class="col-sm-4" id="enddate" style="display: none">
                                                    <h5> {LANG_END_DATE}</h5> <input type="date"
                                                        class="form-control enddate with-border" placeholder="End Date"
                                                        min="<?php echo date('d/m/Y'); ?>" name="enddate"
                                                        style="min-width: 165px;">
                                                </span> <span class="col-sm-6" id="noE">
                                                    <h5> {LANG_CVS} </h5> <select class="form-control days with-border"
                                                        id="employees" name="employees"
                                                        onchange="$('#cvs').val($(this).find('option:selected').attr('value'))  ;"
                                                        style="padding: 10px;">
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
                                                    </select> <input type="hidden" class="form-control cvs with-border"
                                                        placeholder="Employees" id="cvs" name="cvs" value="0" min="0"
                                                        max="300"> <input type="hidden" id="customFee" name="customFee"
                                                        value="">
                                                </span> </div>
                                        </div>
                                        <div class="col-lg-3 premium-plans-price">
                                            <h5> {LANG_TOTAL_FEE} </h5> <span class="customFee"></span> {LANG_FOR} <span
                                                id="customDays"></span> {LANG_DAYS}
                                        </div>
                                    </div>
                                    <div class="payment-tab-content">
                                        <p><span
                                                class="badge green pull-right"> {LANG_RECOMMENDED} </span> {LANG_UPGRADE_TEXT_INFO} </p>
                                        <div class="row premium-plans"> 
                                            <div class="col-lg-3">
                                                <div class="checkbox"> <input type="checkbox" id="featured"
                                                        name="featured" value="1"
                                                        onchange="fillPrice(this,{FEATURED_FEE});"> <label
                                                        for="featured"><span class="checkbox-icon"></span> <span
                                                            class="badge blue">{LANG_FEATURED}</span></label> </div>
                                            </div>
                                            <div class="col-lg-6 premium-plans-text"> {LANG_FEATURED_AD_TEXT}  </div>
                                            <div class="col-lg-3 premium-plans-price"> $ {FEATURED_FEE} {LANG_FOR}
                                                {FEATURED_DURATION} {LANG_DAYS} </div>
                                        </div>
                                        <div class="row premium-plans" style="display:none;">
                                            <div class="col-lg-3">
                                                <div class="checkbox"> <input type="checkbox" id="urgent" name="urgent"
                                                        value="1" onchange="fillPrice(this,{URGENT_FEE});"> <label
                                                        for="urgent"><span class="checkbox-icon"></span> <span
                                                            class="badge yellow">{LANG_URGENT}</span></label> </div>
                                            </div>
                                            <div class="col-lg-6 premium-plans-text"> {LANG_URGENT_AD_TEXT} </div>
                                            <div class="col-lg-3 premium-plans-price"> $ {URGENT_FEE} {LANG_FOR}
                                                {URGENT_DURATION} {LANG_DAYS} </div>
                                        </div>
                                        <div class="row premium-plans" style="display:none;">
                                            <div class="col-lg-3">
                                                <div class="checkbox"> <input type="checkbox" id="highlight"
                                                        name="highlight" value="1"
                                                        onchange="fillPrice(this,{HIGHLIGHT_FEE});"> <label
                                                        for="highlight"><span class="checkbox-icon"></span> <span
                                                            class="badge red">{LANG_HIGHLIGHT}</span></label> </div>
                                            </div>
                                            <div class="col-lg-6 premium-plans-text"> {LANG_HIGHLIGHT_AD_TEXT} </div>
                                            <div class="col-lg-3 premium-plans-price"> $ {HIGHLIGHT_FEE} {LANG_FOR}
                                                {HIGHLIGHT_DURATION} {LANG_DAYS} </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> {:IF} <input type="hidden" name="submit">
                    <div class="row margin-top-30 margin-bottom-80" style="align-items: center;">
                        <div class="col-6"> <button type="submit" id="submit_job_button" name="Submit"
                                class="button ripple-effect big"> <i class="icon-feather-plus"></i> SAVE AND
                                CONTINUE</button> </div>
                        <div class="col-6">
                            <div id="ad_total_cost_container" class="text-right" style="display: none"> <strong>
                                    {LANG_TOTAL}: <!-- <span class="currency-sign">{USER_CURRENCY_SIGN}</span>--> <span
                                        id="totalPrice">0</span> <span class="currency-code">{CURRENCY_CODE}</span>
                                </strong> </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-xl-4 hide-under-992px">
                <div class="dashboard-box margin-top-0"> <!-- Headline -->
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
<link href="{SITE_URL}templates/{TPL_NAME}/css/select2.min.css" rel="stylesheet" />
<script src="{SITE_URL}templates/{TPL_NAME}/js/select2.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/i18n/{LANG_CODE}.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/owl.carousel-category.min.js"></script>
<script>
    var checkbox = document.getElementById("featured");
    const menu = document.getElementById('employees');
    var duration = document.getElementById("edays");
    var radio = document.getElementById("make_premium");
    var radio2 = document.getElementById("free");
var submitButton = document.getElementById("submit_job_button");
    
    
    menu.addEventListener('click', function () {
        if (checkbox.checked) {
            checkbox.checked = false;
        }
    });

// document.getElementById("submit_job_button").addEventListener("click", function(event) {

  
//   if (duration.value == "" || menu.value == "") {
//     event.preventDefault();
//     alert("Please select both Ad Duration and Number of Employees.");
//   }
// });




</script>
<script>    var ajaxurl = "{APP_URL}user-ajax.php"; var YOUR_KEY = 'AIzaSyAoQit3NTuyamEm_cyNsJWiEtVAoTM8oX4'; $.ajaxSetup({ cache: false }); $(".select2").select2({ tags: true, tokenSeparators: [' '] }).on('select2:close', function () {
        var el = $(this); var new_camp = $.trim(el.val());        //alert('Data Found: '+$('.select2').find("option[value='" + new_camp + "']").length);       // if ($('.select2').find("option[value='" + new_camp + "']").length==0) {        // //     $('.select2').val(new_camp.id).trigger('change');        // // }else {        // //     if (new_camp !=''){        //         $.ajax({        //             url: ajaxurl,        //             method:"POST",        //             data:{'action':'new_company',camp_name:new_camp},        //             success:function(result){        //                 el.append('<option value="'+result+'">'+ new_camp +'</option>').val(new_camp);        //             }        //         });        //     }        //}     });</script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.form.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/job_post.js"></script>
IF("{POST_DESC_EDITOR}"=="1"){<!-- CRUD FORM CONTENT - crud_fields_scripts stack -->
<link media="all" rel="stylesheet" type="text/css"
    href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/styles/simditor.css" />
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/mobilecheck.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/module.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/uploader.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/hotkeys.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/simditor.js"></script>
<script>    (function () { $(function () { var $preview, editor, mobileToolbar, toolbar, allowedTags; Simditor.locale = 'en-US'; toolbar = ['title', 'bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'table', 'link', '|', 'image', 'hr', 'indent', 'outdent', 'alignment']; mobileToolbar = ["bold", "italic", "underline", "ul", "ol"]; if (mobilecheck()) { toolbar = mobileToolbar; } allowedTags = ['br', 'span', 'a', 'img', 'b', 'strong', 'i', 'strike', 'u', 'font', 'p', 'ul', 'ol', 'li', 'blockquote', 'pre', 'h1', 'h2', 'h3', 'h4', 'hr', 'table']; editor = new Simditor({ textarea: $('.text-editor'), placeholder: '', toolbar: toolbar, pasteImage: false, toolbarFloat: false, defaultImage: '{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/images/image.png', upload: false, allowedTags: allowedTags }); $preview = $('#preview'); if ($preview.length > 0) { return editor.on('valuechanged', function (e) { return $preview.html(editor.getValue()); }); } }); }).call(this);</script>
{:IF}IF({POST_ADDRESS_MODE}){ IF("{MAP_TYPE}"=="google"){
<link href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript'
    src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>
<script>        var _latitude = '{LATITUDE}'; var _longitude = '{LONGITUDE}'; var element = "singleListingMap"; var color = '#9C27B0'; var zoom = '#9C27B0'; var getCity = false; var path = '{SITE_URL}templates/{TPL_NAME}/'; var Countries = '{USER_COUNTRY}'; if (Countries != "") { var str = Countries; var str_array = str.split(','); var getCountry = []; for (var i = 0; i < str_array.length; i++) { getCountry.push(str_array[i]); } } else { var getCountry = "all"; } simpleMap(_latitude, _longitude, element, true); $('#jobcity').on('change', function () { var data = $("#jobcity option:selected").val(); var custom_data = $("#jobcity").select2('data')[0]; var latitude = custom_data.latitude; var longitude = custom_data.longitude; var address = custom_data.text; $('#latitude').val(latitude); $('#longitude').val(longitude); simpleMap(latitude, longitude, element, true, address); });    </script>
{ELSE}
<script>    var openstreet_access_token = '{OPENSTREET_ACCESS_TOKEN}';</script>
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
<script>        $('#jobcity').on('change', function () { var data = $("#jobcity option:selected").val(); var custom_data = $("#jobcity").select2('data')[0]; var latitude = custom_data.latitude; var longitude = custom_data.longitude; var address = custom_data.text; $('#latitude').val(latitude); $('#longitude').val(longitude); if (document.getElementById("singleListingMap") !== null && singleListingMap) { $("#address-autocomplete").val(address); var newLatLng = new L.LatLng(latitude, longitude); singleListingMapMarker.setLatLng(newLatLng); singleListingMap.flyTo(newLatLng, 10); } });    </script>
{:IF}{:IF}<style>
    #post_job_form {
        color: black !important;
        font-weight: bolder !important;
    }
</style>
<script>!function (m, v, n) { "use strict"; var o = v.createElement("div"), e = v.createElement("ul"), t = v.createElement("li"), s = v.createElement("p"), a = v.createElement("section"), l = v.createElement("button"), c = v.createElement("canvas"), p = v.querySelector("body"), r = v.querySelector("#header"), i = v.querySelector("#footer"); Element.prototype.matches || (Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector), Element.prototype.closest || (Element.prototype.closest = function (e) { var t = this; do { if (t.matches(e)) return t } while (null !== (t = t.parentElement || t.parentNode) && 1 === t.nodeType); return null }); var g = function (e, t, o, s, n, a, l, c) { var r = new XMLHttpRequest, i; if ("get" == s && (e = e + (-1 !== e.indexOf("?") ? "&t=" : "?t=") + Math.round(+new Date / 1e3)), r.open(s, e), 0 < o.length) for (var u = 0, d = o.length; u < d; u++)r.setRequestHeader(o[u].name, o[u].value); r.onload = function () { var e = r.getResponseHeader("Content-Type"); 200 === r.status || 304 === r.status ? a(r.responseText, { contentType: e, responseURL: r.responseURL || t }) : l && l(r.responseText, { contentType: e, responseURL: r.responseURL || t }) }, r.timeout = 1e4, c && (i = r.getResponseHeader("Content-Type"), r.ontimeout = function () { c(r.responseText, { contentType: i, responseURL: r.responseURL || t }) }), "post" == s ? r.send(n) : r.send() }, h = function (e, t) { return e.dataset && e.dataset[t] ? e.dataset[t] : e.getAttribute("data-" + t) }, u, d = function () { var e = o.cloneNode(!1); e.classList.add("scroll-measure"), p.appendChild(e); var t = e.offsetWidth - e.clientWidth; return p.removeChild(e), t }(), f = p.offsetWidth === m.innerWidth, y = function (e) { return e && decodeURIComponent(document.cookie.replace(new RegExp("(?:(?:^|.*;)\\s*" + encodeURIComponent(e).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=\\s*([^;]*).*$)|^.*$"), "$1")) || null }, L = function (e, t, o, s, n, a) { if (!e || /^(?:expires|max\-age|path|domain|secure)$/i.test(e)) return !1; var l = ""; if (o) switch (o.constructor) { case Number: l = o === 1 / 0 ? "; expires=Fri, 31 Dec 9999 23:59:59 GMT" : "; max-age=" + o; break; case String: l = "; expires=" + o; break; case Date: l = "; expires=" + o.toUTCString() }return document.cookie = encodeURIComponent(e) + "=" + encodeURIComponent(t) + l + (n ? "; domain=" + n : "") + (s ? "; path=" + s : "") + (a ? "; secure" : ""), !0 }, b = function (e, t, o) { return !!this.hasItem(e) && (document.cookie = encodeURIComponent(e) + "=; expires=Thu, 01 Jan 1970 00:00:00 GMT" + (o ? "; domain=" + o : "") + (t ? "; path=" + t : ""), !0) }, S = function (e) { return !(!e || /^(?:expires|max\-age|path|domain|secure)$/i.test(e)) && new RegExp("(?:^|;\\s*)" + encodeURIComponent(e).replace(/[\-\.\+\*]/g, "\\$&") + "\\s*\\=").test(document.cookie) }, q = function () { for (var e = document.cookie.replace(/((?:^|\s*;)[^\=]+)(?=;|$)|^\s*|\s*(?:\=[^;]*)?(?:\1|$)/g, "").split(/\s*(?:\=[^;]*)?;\s*/), t = e.length, o = 0; o < t; o++)e[o] = decodeURIComponent(e[o]); return e }, w = function (e) { var e = e.querySelector("[autofocus]"); e && e.focus() }, x = function (n, a, l) { var c; return function () { var e = this, t = arguments, o = function () { c = null, l || n.apply(e, t) }, s = l && !c; m.clearTimeout(c), c = m.setTimeout(o, a), s && n.apply(e, t) } }, E = function () { for (var e = p.querySelectorAll(".acl"), t = 0, o = e.length; t < o; t++)e[t].parentNode.removeChild(e[t]) }, k = function () { }, A = function (c, r, e) { var i = c.value.trim(), t, u, u, d, f, t, t; c.setAttribute("data-value", i), "" != i && 0 != i.length ? (t = h(c, "lc") || "en_GB", u = 10, u = m.innerWidth <= 768 ? h(c, "mhm") : h(c, "mhd"), d = !1, f = h(c, "loctext"), h(c, "loc") && (d = !0), t = ["q=" + i, "lc=" + t], h(c, "ncc") && t.push("ncc=1"), t = t.join("&"), g(e + "?" + t, null, [], "get", null, function (e, t) { var o; if (0 < (o = JSON.parse(e)).length) { var s, o = o.slice(0, u), n = '<div class="acl">'; d && (n += '<button type="button" class="geocode" tabindex="-1" data-target="' + h(c, "target2") + '">', n += '<svg class="icon"><use xlink:href="#icon-visor"/></svg>', n += f, n += "</button>"), n += "<ul>"; for (var a = 0, l = o.length; a < l; a++)n += "<li>", n += '<button type="button" tabindex="-1" data-value="' + (s = o[a]) + '" data-target="' + h(c, "target2") + '" class="acv">', n += s.substr(0, i.length), n += "<b>" + s.substr(i.length, s.length) + "</b>", n += "</button>", n += "</li>"; n += "</ul>", n += "</div>", E(), r.insertAdjacentHTML("beforeend", n), r.querySelector(".acl").classList.add("acl-on") } else E() }, function (e, t) { E() })) : E() }, C = "function" == typeof v.createElement("form").checkValidity, T = function (e, t, o) { if (C) { var s = e.checkValidity(); e.classList.remove("invalid"), e.classList.remove("valid"); var n = e.querySelectorAll('[type="submit"]'); if (s) { e.classList.add("valid"); for (var a = 0, l = n.length; a < l; a++)n[a].removeAttribute("disabled"), n[a].disabled = !1; t && t(e) } else { e.classList.add("invalid"); for (var a = 0, l = n.length; a < l; a++)n[a].setAttribute("disabled", "disabled"), n[a].disabled = !0; o && o(e) } } }, _ = function (e, t, o) { e.form && e.form.classList.contains("validate") && e.closest(".validate") && T(e.form || e.closest(".validate"), t, o) }, N = null, R = null, H = function () { for (var e = p.querySelectorAll("form.validate"), t = 0, o = e.length; t < o; t++)T(e[t]) }, M = !0, M = "geolocation" in n, j = function (o, t) { n.geolocation.getCurrentPosition(function (e) { g(h(p, "reverse-geocode") + "?lat=" + e.coords.latitude + "&lon=" + e.coords.longitude, null, [{ name: "X-Requested-With", value: "XMLHttpRequest" }], "get", null, function (e, t) { var e = JSON.parse(e); o && o(e) }, function (e, t) { o && o(data) }) }, function (e) { e.code == e.PERMISSION_DENIED ? t && t() : D(o) }, { enableHighAccuracy: !0, timeout: 5e3, maximumAge: 500 }) }, D = function (o) { g(h(p, "reverse-geocode"), null, [{ name: "X-Requested-With", value: "XMLHttpRequest" }], "get", null, function (e, t) { var e = JSON.parse(e); o && o(e) }, function (e, t) { o && o({}) }) }, O = function (t, e) { e.preventDefault(), t.closest(".geocode") && (t = t.closest(".geocode")); var o = v.querySelector(h(t, "target")), s, e; o ? (M = "geolocation" in n, t.classList.add("geocode-wait"), s = function (e) { e.l && (o.value = e.l), o.classList.remove("wait"), t.classList.remove("geocode-wait"), _(o), o.focus(); var e = o.closest(".find-location"), e; !e || (e = e.parentNode.querySelector(".location-suggestions")) && (e.closest(".alert").remove(), o.classList.remove("fce")) }, e = function () { o.classList.remove("wait"), t.classList.remove("geocode-wait"), o.focus(); var e = 2 * o.value.length; o.setSelectionRange(e, e) }, o.classList.add("wait"), M ? j(s, e) : D(s)) : t.classList.remove("geocode-wait") }, U = o.cloneNode(!1); U.id = "modal-mask"; var I = v.createElementNS("http://www.w3.org/2000/svg", "svg"), W = v.createElementNS("http://www.w3.org/2000/svg", "use"); W.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", "#icon-wait"), I.appendChild(W), U.appendChild(I); var X = o.cloneNode(!1); X.id = "modal"; var I = o.cloneNode(!1); I.id = "modal-inner"; var $ = a.cloneNode(!1); $.id = "modal-dialog", $.role = "document"; var a = h(p, "modal-close-title") || "Close"; I.appendChild($), I.insertAdjacentHTML("beforeend", '<button id="modal-close" class="modal-close"><svg class="icon"><use xlink:href="#icon-cross"/></svg><span class="sr">' + a + "</span></button>"), X.appendChild(I), p.appendChild(U), p.appendChild(X); var z = function () { return v.documentElement.classList.contains("modal-in") }, J = function (e, t) { t = t || [], U.classList.add("wait"), X.className = "", 0 == t.length && (t = ["modal-std"]); for (var o = 0, s = t.length; o < s; o++)X.classList.add(t[o]); p.clientHeight > m.innerHeight && !f && (p.style.paddingRight = d + "px", p.querySelector("#header").style.width = "calc(100% - " + d + "px)"), v.documentElement.classList.add("modal-in"), B(e), v.querySelector("#modal-dialog > .modal-content") && v.querySelector("#modal-dialog > .modal-content").classList.remove("sr") }, B = function (e) { G(), $.insertAdjacentHTML("afterbegin", e); var e = $.querySelector(".tab-panel .fc.fce"); e && openTab($.querySelector('a[href="#' + e.closest(".tab-panel").getAttribute("id") + '"]')); for (var t = $.querySelectorAll(".tabs li a"), o = 0, s = t.length; o < s; o++)$.querySelector(t[o].getAttribute("href") + " .fc.fce") && t[o].classList.add("error"); m.setTimeout(function () { w($) }, 250) }, F = function () { U.classList.remove("wait") }, G = function () { var e = $.querySelector(".modal-content"); e && $.removeChild(e) }, P = function () { m.setTimeout(function () { G(), v.documentElement.classList.remove("modal-in"), v.documentElement.style.height = "", p.style.height = "", U.classList.remove("wait"), p.style.paddingRight = "", p.querySelector("#header").style.width = "", X.className = "" }, 100) }, V = function () { var e = new Date(Date.now() + 31536e6).toUTCString(); L("cookie_consent", 1, e, "/"); var e = v.querySelector("#cookie-consent"); e && e.parentNode.removeChild(e) }, Y = function () { v.documentElement.classList.toggle("nav-on") }, K = function (e) { for (var t = (e = e || p).querySelectorAll("img.lazy:not(.lazy-done):not(.lazy-err)"), o = function () { var e, t, l, e; p.classList.contains("rpk-done") || (e = "http://www.w3.org/2000/svg", t = "http://www.w3.org/1999/xlink", l = v.createElementNS(e, "svg"), (e = v.createElementNS(e, "use")).setAttributeNS(t, "xlink:href", "#icon-user2"), l.appendChild(e), g(h(p, "rpk"), null, [], "get", null, function (e, t) { for (var o = JSON.parse(e), s = p.querySelectorAll("img.photo"), n = 0, a = s.length; n < a; n++)o.src ? s[n].src = o.src : s[n].parentNode.replaceChild(l, s[n]); p.classList.add("rpk-done") }, function (e, t) { })) }, s, n, a, l = 0, c = t.length; l < c; l++)s = t[l], (n = h(s, "src")) ? (s.onerror = function (e) { this.classList.contains("photo") ? o() : this.classList.add("lazy-err") }, s.onload = function () { this.classList.add("lazy-done"), this.removeAttribute("data-src") }, s.src = n) : s.classList.add("lazy-err") }, Q = function (e, t, o, s) { var n = JSON.parse(t); if (n.r) m.location.href = n.r; else { if (1 == n.modal ? (J(n.m, []), K(v.querySelector("#modal-dialog")), "function" == typeof upload_file_init && upload_file_init(v.querySelector("#modal-dialog")), "function" == typeof upload_photo_init && upload_photo_init(v.querySelector("#modal-dialog")), H()) : 0 == n.modal && P(), n.xht) { var a = p.querySelector(n.xht); if (a) { var t = p.querySelectorAll(n.xht + " > *:not(h2)").length; n.x ? a.outerHTML = n.x : a.outerHTML = n.m, w(a); for (var l = a.querySelectorAll("form.validate"), c = 0, r = l.length; c < r; c++)T(l[c]); n.completeness && (p.querySelector("#completeness").outerHTML = n.completeness), "undefined" != typeof cv_builder_sections_drag_drop && -1 != cv_builder_sections_drag_drop.indexOf(n.xht) && cv_builder([n.xht]), v.querySelector("#cv-builder") && n.add_section && v.querySelector("#add-section") && (v.querySelector("#add-section").outerHTML = n.add_section, 0 == t && setTimeout(function () { m.scrollTo({ behavior: "smooth", top: v.querySelector(n.xht).offsetTop - v.getElementById("header").offsetHeight - 20 }) }, 300)), K(v.querySelector(n.xht)) } } n.modal || n.xht || (e.outerHTML = n.m), n.utn && (v.querySelector("#nav").outerHTML = n.utn, K(v.querySelector("#nav"))), F(), s && s() } }, Z = function (o, s) { o.classList.add("wait"), o.disabled = !0; var n = o.getAttribute("href"); h(o, "modal") && (n += -1 !== n.indexOf("?") ? "&mod=" + h(o, "modal") : "?mod=" + h(o, "modal")), g(n, null, [{ name: "X-Requested-With", value: "XMLHttpRequest" }], "get", null, function (e, t) { o.classList.remove("wait"), o.disabled = !1, Q(o, e, t, s), te(n) }, function (e, t) { o.classList.remove("wait"), o.disabled = !1, Q(o, e, t, s), te(n) }, function (e, t) { o.classList.remove("wait"), o.disabled = !1, te(n) }) }, ee = function (s, n) { n && (n.classList.add("wait"), n.disabled = !0); var a = s.getAttribute("action"), l = s.getAttribute("method"), c = null, e = function () { if ("post" === l.toLowerCase()) { for (var e = s.querySelectorAll('input[type="file"]:not([disabled])'), t = 0, o = e.length; t < o; t++)0 == e[t].files.length && (e[t].setAttribute("disabled", ""), e[t].disabled = !0); c = new FormData(s), n && n.getAttribute("name") && n.getAttribute("value") && c.append(n.getAttribute("name"), n.getAttribute("value")), h(s, "modal") && c.append("mod", h(s, "modal")) } else "get" === l.toLowerCase() && (n && n.getAttribute("name") && n.getAttribute("value") && (a = a + (-1 !== a.indexOf("?") ? "&" : "?") + n.getAttribute("name") + "=" + n.getAttribute("value")), h(s, "modal") && (a = a + (-1 !== a.indexOf("?") ? "&mod=" : "?mod=") + h(s, "modal"))); g(a, null, [{ name: "X-Requested-With", value: "XMLHttpRequest" }], l, c, function (e, t) { n && (n.classList.remove("wait"), n.disabled = !1), Q(s, e, t, null), te(a) }, function (e, t) { n && (n.classList.remove("wait"), n.disabled = !1), Q(s, e, t, null), te(a) }, function (e, t) { n && (n.classList.remove("wait"), n.disabled = !1), te(a) }) }; s.classList.contains("gcpc3") ? gcpc3_init(s, function () { s.classList.contains("cjbc") ? bot_challenge_get_token(s, function () { e() }) : e() }) : s.classList.contains("cjbc") ? bot_challenge_get_token(s, function () { e() }) : e() }, te = function (e) { var t; m.ga && (/^((http|https):\/\/)/.test(e) || (e = "https://" + window.location.host + e), ga("send", { hitType: "pageview", page: e })) }, a = function () { var e = v.querySelector("#evf"); e && m.setTimeout(function () { e.click(), e.parentNode.removeChild(e) }, 500) }, I = function () { var e, t, e; n.sendBeacon && m.cjut && (!(e = v.querySelector("#cjut")) || (t = h(e, "url")) && ((e = new FormData).append("d", m.cjut), n.sendBeacon(t, e))) }, oe = function (e) { var t, o; e && h(e, "cjutd") && h(e, "cjuturl") && n.sendBeacon && (t = h(e, "cjuturl"), (o = new FormData).append("d", h(e, "cjutd")), n.sendBeacon(t, o)) }, se = function (e) { }, ne; !function (e) { var t; try { var o = Object.defineProperty({}, "passive", { get: function () { t = !0 } }); e.addEventListener("test", null, o), e.removeEventListener("test", null, o) } catch (e) { } return t }(m) || v.addEventListener("touchstart", function () { }, { capture: !0, passive: !0 }); var ae = function (e) { !0 === e ? p.addEventListener("touchmove", function (e) { e.preventDefault() }, !1) : p.removeEventListener("touchmove", function (e) { e.preventDefault() }, !1) }, le; (function () { var l = p.querySelectorAll(".recent-search-count"); if (0 != l.length) { for (var e = h(p, "recent-search-b"), t, o = ["s", "l", "lid", "cmp", "ct", "cp", "radius"], s, n, a = [], c = 0, r = l.length; c < r; c++)t = l[c], a.push(h(t, "d")); e = e + "?p=" + a.join("."); var i = new XMLHttpRequest, e = e + (-1 !== e.indexOf("?") ? "&t=" : "?t=") + Math.round(+new Date / 1e3); i.open("get", e), i.onload = function () { var e, t = JSON.parse(i.responseText).c; if (t.length == l.length) for (var o, s, o, n = 0, a = l.length; n < a; n++)s = (o = t[n]).c, o = o.m, 0 != s && s ? l[n].classList.add("nonzero-count") : l[n].closest("a").href = h(l[n].closest("a"), "urlall"), l[n].closest("a").querySelector(".new .badge").innerHTML = o; else for (var n = 0, a = l.length; n < a; n++)l[n].classList.remove("nonzero-count") }, i.send() } })(), K(p), a(), I(), p.querySelector("#search-main > .row").classList.add("focus"), v.documentElement.addEventListener("click", function (e) { var t = e.target, o, s, o, o; if ("nav-toggle" == t.id || t.closest("#nav-toggle")) Y(); else if (t.classList.contains("toggle") || t.closest(".toggle")) { t.classList.contains("toggle") || (t = t.closest(".toggle")), (o = v.querySelector(h(t, "target"))) && (t.classList.toggle("on"), o.classList.toggle("sr")) } else if (t.classList.contains("confirm") || t.closest(".confirm")) { e.preventDefault(), t.classList.contains("confirm") || (t = t.closest(".confirm")); var s = h(t, "confirm"); if (!s) return !1; if (!m.confirm(s)) return !1; "a" === t.nodeName.toLowerCase() && (t.classList.contains("nav-xhr") ? Z(t) : m.location.href = t.href) } else if (t.closest(".nav-xhr") || t.classList.contains("nav-xhr")) e.preventDefault(), t.closest(".nav-xhr") && (t = t.closest(".nav-xhr")), Z(t); else if ("cookie-consent-ok" == t.id) V(); else if (t.classList.contains("geocode") || t.closest(".geocode")) O(t, e); else if ("modal" == t.id || "modal-mask" == t.id || "modal-close" == t.id || (t.classList.contains("modal-close") || t.closest(".modal-close")) && t.closest("#modal")) e.preventDefault(), P(); else if (t.closest(".ac") || !t.closest(".fc-clear") && !t.classList.contains("fc-clear")) { t.closest(".submit-xhr") && ("button" == t.nodeName.toLowerCase() && "submit" == t.type || t.closest('[type="submit"]')) && (e.preventDefault(), s = t.closest('[type="submit"]'), t.closest(".submit-xhr") && (t = t.closest(".submit-xhr")), ee(t, s)) } else { t.classList.contains("fc-clear") || (t = t.closest(".fc-clear")); var n = p.querySelector(h(t, "target")); if (!n) return; n.value = "", n.focus() } if (t.classList.contains("aci")) { if (!(o = h(t, "target")) || !p.querySelector(o)) return; var n = h(t, "ac"); if (!n) return; A(t, p.querySelector(o), n) } t.closest(".acl") && ("acv" === t.classList.contains || t.closest(".acv")) && (e.preventDefault(), t.closest(".acv") && (t = t.closest(".acv")), (o = p.querySelector(h(t, "target"))) && (o.value = h(t, "value"))), E(), (h(t, "cjutd") && h(t, "cjuturl") || t.closest("[data-cjutd]") && t.closest("[data-cjuturl]")) && (t.closest("[data-cjutd]") && t.closest("[data-cjuturl]") && (t = t.closest("[data-cjutd]")), oe(t)) }, !1); var ce = function (e) { e.classList.contains("fc-clear") || (e = e.closest(".fc-clear")); var t = p.querySelector(h(e, "target")); if (t) { for (var o = v.querySelectorAll(".ac-geocode"), s = 0, n = o.length; s < n; s++)o[s].disabled = !0; m.setTimeout(function () { t.value = "", t.focus() }, 100), m.setTimeout(function () { for (var e = 0, t = o.length; e < t; e++)o[e].disabled = !1 }, 200) } }; v.documentElement.addEventListener("mousedown", function (e) { var t = e.target, o; t.closest(".ac") && (t.closest(".fc-clear") || t.classList.contains("fc-clear")) ? (e.preventDefault(), ce(t)) : t.closest(".ac") && (t.closest('button[type="submit"]') || "button" === t.nodeName.toLowerCase() && "submit" == t.type) && t.closest("form").submit() }, !1), "ontouchstart" in v.documentElement && v.documentElement.addEventListener("touchstart", function (e) { var t = e.target, o; t.closest(".ac") && (t.closest(".fc-clear") || t.classList.contains("fc-clear")) ? (e.preventDefault(), ce(t)) : t.closest(".ac") && (t.closest('button[type="submit"]') || "button" === t.nodeName.toLowerCase() && "submit" == t.type) && t.closest("form").submit() }, !1), v.documentElement.addEventListener("change", function (e) { var t = e.target, o, s, n, a, n, a; if (t.classList.contains("fc-as")) (o = t.closest("form")).classList.contains("submit-xhr") ? ee(o, t) : o.submit(); else if (t.closest(".list-interact") && "checkbox" == t.type) { if ("toggle-all" == t.id) for (var o, l = (o = t.closest(".list-interact")).querySelectorAll('input[type="checkbox"]'), c = 0, r = l.length; c < r; c++)l[c].checked = t.checked; else var o = t.closest(".list-interact"); list_interact_process_checkboxes(o) } else if ("cover-letter-template" == t.id) { "" != (s = t.querySelector("option:checked")).value ? (n = h(s, "title") || "", a = h(s, "text") || "", (n || a) && (p.querySelector("#title").value = n, p.querySelector("#text").value = a)) : (n = p.querySelector("#title"), a = p.querySelector("#text"), n.value = h(n, "original"), a.value = h(a, "original")), _(t) } else if (t.closest("#contact-us-form") && "select" === t.nodeName.toLowerCase()) { for (var i = v.querySelectorAll("#contact-us-form-displays > p"), c = 0, r = i.length; c < r; c++)i[c].classList.add("sr"); var a = v.querySelector("#contact-us-form-fields"), s, u, s; if (a.classList.add("sr"), "topic" == t.name) { for (var d = v.querySelectorAll("#contact-us-form .subtopic"), c = 0, r = d.length; c < r; c++)d[c].classList.add("sr"), d[c].querySelector("select").name = "subtopic-wait"; var s = t.options[t.selectedIndex], u = v.querySelector(h(s, "subtopic")); u && (u.classList.remove("sr"), u.querySelector("select").name = "subtopic") } else { "subtopic" == t.name && (s = t.options[t.selectedIndex], u = h(s, "display-help"), s = h(s, "display-fields"), u && v.querySelector(u) && v.querySelector(u).classList.remove("sr"), 1 == s && a.classList.remove("sr")) } } else if (h(t, "disable") && "input" === t.nodeName.toLowerCase()) { var f = p.querySelectorAll(h(t, "disable")); if (r = f.length) for (var c = 0; c < r; c++)t.checked ? f[c].disabled = !0 : f[c].disabled = !1 } else t.closest(".validate") && _(t) }, !1), m.screen.width < 992 && v.querySelectorAll(".aci").forEach(function (e, t) { e.addEventListener("blur", function (e) { setTimeout(function () { E() }, 10) }) }), v.onkeydown = function (e) { var t = e.target, o = !1, s, n, e, a, e, o; (o = "key" in (e = e || m.event) ? "Escape" === e.key || "Esc" === e.key : 27 === e.keyCode) && P(), t.classList.contains("aci") && 768 < m.innerWidth && (38 != e.keyCode && 40 != e.keyCode || (n = t.closest(t.getAttribute("data-target")).querySelector(".acl ul")) && ((e = (a = n.querySelector(".current")) ? (a.classList.remove("current"), 40 == e.keyCode ? a.nextSibling : a.previousSibling) : n.querySelector(40 == e.keyCode ? "li:first-child" : "li:last-child")) ? (e.classList.add("current"), t.value = e.querySelector("button").getAttribute("data-value")) : t.value = t.getAttribute("data-value"))) }, v.onkeyup = function (e) { var t = e.target, o, e; !t.classList.contains("aci") || h(t, "value") == t.value || 38 == e.keyCode || 40 == e.keyCode || 13 == e.keyCode || (o = h(t, "target")) && p.querySelector(o) && ((e = h(t, "ac")) && A(t, p.querySelector(o), e)) }, v.documentElement.addEventListener("input", function (e) { var e = e.target; e.closest("form.validate") && _(e) }, !1), v.documentElement.addEventListener("input", x(function (e) { var t = e.target, e; h(t, "radiitarget") && h(t, "radiioutput") && ("" != (e = t.value.trim()) && location_radii_get(e, h(t, "radiioutput"), function (e) { alert_radii_handle(e, h(t, "radiitarget")) })) }, 500), !1); var re = !1; m.addEventListener("scroll", function () { re || (re = !0, m.requestAnimationFrame(function () { 100 < m.pageYOffset ? r.classList.remove("nb") : r.classList.add("nb"), re = !1 })) }, !1), v.documentElement.addEventListener("focus", function (e) { var e = e.target; e.closest("#search-main") && ("s" == e.id || "l" == e.id) && 1025 <= m.innerWidth && e.closest(".row").classList.add("focus") }, !0), v.documentElement.addEventListener("blur", function (e) { var e = e.target; !e.closest("#search-main") || "s" != e.id && "l" != e.id || e.closest(".row").classList.remove("focus") }, !0) }(window, document, navigator);</script>
{OVERALL_FOOTER}