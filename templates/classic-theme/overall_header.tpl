<!DOCTYPE html>
<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">

<head>
  <title>IF("{PAGE_TITLE}"!=""){ {PAGE_TITLE} - {:IF}{SITE_TITLE}</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="author" content="{SITE_TITLE}">
  <meta name="keywords" content="{PAGE_META_KEYWORDS}">
  <meta name="description" content="{PAGE_META_DESCRIPTION}">
  <link rel="dns-prefetch" href="//fonts.googleapis.com">
  <link rel="dns-prefetch" href="//google.com">
  <link rel="dns-prefetch" href="//apis.google.com">
  <link rel="dns-prefetch" href="//ajax.googleapis.com">
  <link rel="dns-prefetch" href="//www.google-analytics.com">
  <link rel="dns-prefetch" href="//pagead2.googlesyndication.com">
  <link rel="dns-prefetch" href="//gstatic.com">
  <link rel="dns-prefetch" href="//oss.maxcdn.com">
  <meta property="fb:app_id" content="{FACEBOOK_APP_ID}" />
  <meta property="og:site_name" content="{SITE_TITLE}" />
  <meta property="og:locale" content="en_US" />
  <meta property="og:url" content="{PAGE_LINK}" />
  <meta property="og:title" content="IF(" {PAGE_TITLE}"!="" ){ {PAGE_TITLE} - {:IF}{SITE_TITLE}" />
  <meta property="og:description" content="{PAGE_META_DESCRIPTION}" />
  <meta property="og:type" content="{META_CONTENT}" /> IF("{META_CONTENT}"=="article"){
  <meta property="article:author" content="#" />
  <meta property="article:publisher" content="#" />
  <meta property="og:image" content="{META_IMAGE}" /> {:IF} IF("{META_CONTENT}"=="website"){
  <meta property="og:image" content="{META_IMAGE}" /> {:IF}
  <meta property="twitter:card" content="summary">
  <meta property="twitter:title" content="{PAGE_TITLE} - {SITE_TITLE}">
  <meta property="twitter:description" content="{PAGE_META_DESCRIPTION}">
  <meta property="twitter:domain" content="{SITE_URL}">
  <meta name="twitter:image:src" content="{META_IMAGE}" />
  <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">
  <script
    async>        var themecolor = '{THEME_COLOR}'; var mapcolor = '{MAP_COLOR}'; var siteurl = '{SITE_URL}'; var template_name = '{TPL_NAME}';    </script>
  <style>
    :root {
        {
        LOOP: COLORS
      }

      --theme-color- {
        COLORS.id
      }

      : {
        COLORS.value
      }

      ;

        {
        /LOOP: COLORS
      }
    }
  </style>
  <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/flags/flags.min.css?ver={VERSION}">
  <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/slick.css">
  <link rel="stylesheet" href="{SITE_URL}includes/assets/css/icons.css">
  <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/style.css?ver={VERSION}">
  <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/color.css?ver={VERSION}">
  <script src="{SITE_URL}templates/{TPL_NAME}/js/jquery-3.4.1.min.js"></script> IF("{LANGUAGE_DIRECTION}"=="rtl"){
  <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/rtl.css?ver={VERSION}"> {:IF}
  <script async>var ajaxurl = "{APP_URL}user-ajax.php";</script>
  <script async type="text/javascript">        $(document).ready(function () {
      $('.resend').click(function (e) { 				/*************		// Button which will activate our modal                var the_id = $(this).attr('id');						//get the id                // show the spinner                $(this).html("<i class='fa fa-spinner fa-pulse'></i>");                $.ajax({											//the main ajax request                    type: "POST",                    data: "action=email_verify&id="+$(this).attr("id"),                    url: ajaxurl,                    success: function(data)                    {                        $("span#resend_count"+the_id).html(data);                        //fadein the vote count                        $("span#resend_count"+the_id).fadeIn();                        //remove the spinner                        $("a.resend_buttons"+the_id).remove();                    }                });                return false;    */
      });
    });    </script> <!-- ===External Code=== --> {EXTERNAL_CODE} <!-- ===/External Code=== -->
</head>

<body data-role="page" class="{LANGUAGE_DIRECTION}" id="page" data-ipapi="{LIVE_LOCATION_API}"
  data-showlocationicon="{LOCATION_TRACK_ICON}">
  <!--[if lt IE 9]><p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade    your browser</a> to improve your experience.</p><![endif]--><!-- Wrapper -->
  <div id="wrapper">
    <header id="header-container" class="transparent"> <!-- Header -->
      <div id="header">
        <div class="container">
          <div class="left-side">
            <div id="logo"> <a href="{LINK_INDEX}"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt="{SITE_TITLE}"></a>
            </div>
            <nav class="navigation">
              <ul> IF('{COUNTRY_TYPE}'=="multi"){ <li> <a href="#countryModal" class="country-flag popup-with-zoom-anim"
                    title="{LANG_CHANGE_COUNTRY}" data-tippy-placement="right"> <img
                      src="{SITE_URL}templates/{TPL_NAME}/images/flags/{USER_COUNTRY}.png" /> </a> </li> {:IF} <li
                  class="d-none d-lg-block test12323"> <a href="{LINK_LISTING}"><i class="icon-feather-list"></i>
                    {LANG_BROWSE_JOBS}</a> </li> IF({JOB_SEEKER_ENABLE}){ <li class="d-none d-lg-block"> <a
                    href="{LINK_JOB_SEEKERS}">{LANG_JOB_SEEKERS}</a> </li> {:IF} IF({COMPANY_ENABLE}){ <li
                  class="d-none d-lg-block"> <a href="{LINK_COMPANIES}">{LANG_COMPANIES}</a> </li> {:IF} </ul>
            </nav>
            <div class="clearfix"></div> <!-- Mobile Navigation -->
            <nav class="mmenu-init">
              <ul class="mm-listview">
                <li><a href="{LINK_LISTING}">{LANG_BROWSE_JOBS}</a></li> IF({JOB_SEEKER_ENABLE}){ <li><a
                    href="{LINK_JOB_SEEKERS}">{LANG_JOB_SEEKERS}</a></li> {:IF} IF({COMPANY_ENABLE}){ <li><a
                    href="{LINK_COMPANIES}">{LANG_COMPANIES}</a></li> {:IF} IF({LOGGED_IN}){ <li><a
                    href="{LINK_DASHBOARD}">{LANG_DASHBOARD}</a></li> IF('{USERTYPE}' == "user"){ IF({RESUME_ENABLE}){
                <li><a href="{LINK_RESUMES}">{LANG_MY_RESUMES}</a></li> {:IF} <li><a
                    href="{LINK_APPLIED_JOBS}">{LANG_APPLIED_JOBS}</a></li>
                <li><a href="{LINK_FAVJOBS}">{LANG_FAV_JOBS}</a></li>
                <li><a href="{LINK_JOBALERT}">{LANG_JOB_ALERT}</a></li> ELSEIF('{USERTYPE}' == "employer"){ <li><a
                    href="{LINK_POST-JOB}">{LANG_POST_JOB}</a></li> IF({COMPANY_ENABLE}){ <li><a
                    href="{LINK_MYCOMPANIES}">{LANG_MY_COMPANIES}</a></li> {:IF} <li><a
                    href="{LINK_MYJOBS}">{LANG_MY_JOBS}</a></li>
                <li><a href="{LINK_SAVEDJOBS}">{LANG_SAVED_JOBS}</a></li>
                <li><a href="{LINK_PENDINGJOBS}">{LANG_PENDING_JOBS}</a></li>
                <li><a href="{LINK_TRANSACTION}">{LANG_TRANSACTIONS}</a></li> {:IF} IF('{WCHAT}'=='on'){ <li><a
                    href="{LINK_MESSAGE}">{LANG_MESSAGE}</a></li> {:IF} <li><a href="{LINK_LOGOUT}">{LANG_LOGOUT}</a>
                </li> {ELSE} <li><a href="{LINK_LOGIN}">{LANG_LOGIN}</a></li>
                <li><a href="{LINK_SIGNUP}">{LANG_REGISTER}</a></li>
                <li><a href="{LINK_POST-JOB}" class="button ripple-effect">{LANG_POST_JOB}</a></li> {:IF}
              </ul>
            </nav>
          </div>
          <div class="right-side"> IF({LOGGED_IN}){ <div class="header-widget padding-right-0 d-none d-lg-block 0">
              <div class="header-notifications user-menu">
                <div class="header-notifications-trigger"> <a href="#"><i class="icon-feather-user"></i> {USERNAME}<i
                      class="icon-feather-chevron-down"></i></a> </div>
                <div class="header-notifications-dropdown">
                  <ul class="user-menu-small-nav">
                    <li><a href="{LINK_DASHBOARD}"><i class="icon-feather-grid"></i> {LANG_DASHBOARD} </a></li>
                    IF('{USERTYPE}' == "user"){ IF({RESUME_ENABLE}){ <li><a href="{LINK_RESUMES}"><i
                          class="icon-feather-paperclip"></i> {LANG_MY_RESUMES}</a></li> {:IF} <li><a
                        href="{LINK_APPLIED_JOBS}"><i class="icon-feather-briefcase"></i> {LANG_APPLIED_JOBS}</a> </li>
                    <li><a href="{LINK_FAVJOBS}"><i class="icon-feather-heart"></i> {LANG_FAV_JOBS}</a> </li>
                    <li><a href="{LINK_JOBALERT}"><i class="icon-feather-bell"></i> {LANG_JOB_ALERT}</a> </li>
                    ELSEIF('{USERTYPE}' == "employer"){ IF({COMPANY_ENABLE}){ <li><a href="{LINK_MYCOMPANIES}"><i
                          class="icon-feather-box"></i> {LANG_MY_COMPANIES}</a></li> {:IF} <li><a
                        href="{LINK_MYJOBS}"><i class="icon-feather-briefcase"></i> {LANG_MY_JOBS} </a></li>
                    <li><a href="{LINK_SAVEDJOBS}"><i class="icon-feather-clock"></i> {LANG_SAVED_JOBS}</a></li>
                    <li><a href="{LINK_PENDINGJOBS}"><i class="icon-feather-clock"></i> {LANG_PENDING_JOBS}</a></li>
                    <li><a href="{LINK_TRANSACTION}"><i class="icon-feather-file-text"></i> {LANG_TRANSACTIONS}</a></li>
                    {:IF} IF('{WCHAT}'=='on'){ <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i>
                        {LANG_MESSAGE}</a></li> {:IF} <li><a href="{LINK_LOGOUT}"><i class="icon-feather-log-out"></i>
                        {LANG_LOGOUT}</a> </li>
                  </ul>
                </div>
              </div>
            </div> {:IF} <div class="header-widget d-none d-lg-block">
              <nav class="navigation">
                <ul> IF(!{LOGGED_IN}){ <li> <a href="#sign-in-dialog" class="popup-with-zoom-anim"><i
                        class="icon-feather-log-in"></i> {LANG_LOGIN}</a> </li>
                  <li><a href="{LINK_SIGNUP}">{LANG_REGISTER}</a></li>
                  <li><a href="{LINK_POST-JOB}" class="button ripple-effect post-job">{LANG_POST_JOB}</a> </li> {:IF}
                  IF('{USERTYPE}' == "employer"){ <li><a href="{LINK_POST-JOB}"
                      class="button ripple-effect post-job">{LANG_POST_JOB}</a> </li> {:IF}
                </ul>
              </nav>
            </div> IF({LANG_SEL}){ <div class="header-widget">
              <div class="btn-group bootstrap-select language-switcher"> <button type="button"
                  class="btn dropdown-toggle btn-default" data-toggle="dropdown" title="English"> <span
                    class="filter-option pull-left" id="selected_lang">EN</span>&nbsp; <span class="caret"></span>
                </button>
                <div class="dropdown-menu scrollable-menu open">
                  <ul class="dropdown-menu inner"> {LOOP: LANGS} <li data-lang="{LANGS.name}"> <a role="menuitem"
                        tabindex="-1" rel="alternate" href="{LINK_HOME}/{LANGS.code}">{LANGS.name}</a> </li> {/LOOP:
                    LANGS} </ul>
                </div>
              </div>
            </div> {:IF} <span class="mmenu-trigger"> <button class="hamburger hamburger--collapse" type="button"> <span
                  class="hamburger-box"> <span class="hamburger-inner"></span> </span> </button> </span> </div>
        </div>
      </div>
    </header>
    <div class="clearfix"></div> IF("{USERSTATUS}"=="0" && "{NON_ACTIVE_MSG}"=="1"){ <div class="user-status-message">
      <div class="container">
        <div class="row">
          <div class="col-lg-8"> <i class="icon-lock text-18"></i> <span>{LANG_WELCOME} <strong>{USERNAME}</strong>,
              {LANG_GOTO_UR_EMAIL} <strong>{USEREMAIL}</strong> {LANG_VERIFY_EMAIL_ADDRESS}</span> </div>
          <div class="col-lg-4">
            <!--<a class="button ripple-effect" rel="nofollow" target="_blank" role="button" href="http://{EMAILDOMAIN}/">{LANG_GOTO_UR_EMAIL}</a>-->
            <a class="button ripple-effect gray resend_buttons{USER_ID} resend" href='javascript:void(0);'
              id="{USER_ID}">{LANG_RESEND_EMAIL}</a> <span class='resend_count' id='resend_count{USER_ID}'></span>
          </div>
        </div>
      </div>
    </div> {:IF} <!-- Country Picker -->
    <div class="zoom-anim-dialog mfp-hide dialog-with-tabs popup-dialog big-dialog" id="countryModal">
      <ul class="popup-tabs-nav">
        <li><a href="#country"><i class="icon-feather-map-pin"></i> {LANG_SELECT_YOUR_COUNTRY}</a></li>
      </ul>
      <div class="popup-tabs-container">
        <div class="popup-tab-content" id="country">
          <div class="row">
            <div class="col-md-6">
              <div class="input-with-icon margin-bottom-30"> <input class="with-border" type="text"
                  placeholder="{LANG_SEARCH}..." id="country-modal-search"> <i class="icon-feather-search"></i> </div>
            </div>
            <ul id="countries" class="column col-md-12 col-sm-12 cities"> {LOOP: COUNTRYLIST} <li
                data-name="{COUNTRYLIST.name}"><span class="flag flag-{COUNTRYLIST.lowercase_code}"></span> <a
                  href="{LINK_HOME}/{COUNTRYLIST.lang}/{COUNTRYLIST.lowercase_code}" data-id="{COUNTRYLIST.id}"
                  data-name="{COUNTRYLIST.name}"> {COUNTRYLIST.name}</a></li> {/LOOP: COUNTRYLIST} </ul>
          </div>
        </div>
      </div>
    </div>