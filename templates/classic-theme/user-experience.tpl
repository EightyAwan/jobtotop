{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_ADD_EXPERIENCE}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_ADD_EXPERIENCE}</li>
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
                                        <li><a href="{LINK_RESUMES}"><i class="icon-feather-paperclip"></i> {LANG_MY_RESUMES}<span class="nav-tag">{RESUMES}</span></a></li>
                                        <li class="active"><a href="{LINK_EXPERIENCES}"><i class="icon-feather-award"></i> {LANG_MY_EXPERIENCES}</a></li>
                                        <li><a href="{LINK_APPLIED_JOBS}"><i class="icon-feather-briefcase"></i> {LANG_APPLIED_JOBS}
                                                <span class="nav-tag">{APPLIEDJOBS}</span></a></li>
                                        <li><a href="{LINK_FAVJOBS}"><i class="icon-feather-heart"></i> {LANG_FAV_JOBS}<span class="nav-tag">{FAVORITEADS}</span></a></li>
                                        <li><a href="{LINK_JOBALERT}"><i class="icon-feather-bell"></i> {LANG_JOB_ALERT}</a></li>
                                    </ul>
                                    <ul data-submenu-title="{LANG_ACCOUNT}">
                                        IF('{WCHAT}'=='on'){
                                        <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                        {:IF}
                                        <li><a href="{LINK_LOGOUT}"><i class="icon-feather-log-out"></i>{LANG_LOGOUT}</a></li>
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
                        <h3><i class="icon-feather-award"></i> {LANG_ADD_EXPERIENCE}</h3>
                    </div>
                    <div class="content with-padding">
                        IF('{ERROR}' != ''){
                        <span class="status-not-available">{ERROR}</span>
                        {:IF}
                        <form method="post" accept-charset="UTF-8">
                            <div class="submit-field">
                                <h5>{LANG_TITLE} *</h5>
                                <input type="text" class="with-border" id="title" name="title" value="{TITLE}" required="">
                            </div>
                            <div class="submit-field">
                                <h5>{LANG_COMPANY} *</h5>
                                <input type="text" class="with-border" id="company" name="company" value="{COMPANY}" required="">
                            </div>
                            <div class="submit-field">
                                <h5>{LANG_CITY} *</h5>
                                <input type="text" class="with-border" id="city" name="city" value="{CITY}">
                            </div>
                            <div class="submit-field">
                                <h5>{LANG_DESCRIPTION} *</h5>
                                <textarea rows="3" class="with-border" name="description" required="" style="white-space: pre-line;">{DESCRIPTION}</textarea>
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_START_DATE} *</h5>
                                        <input type="text" class="with-border margin-bottom-0" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true" data-date-language="{LANG_CODE}" data-date-end-date="0d" name="start_date" value="{START_DATE}" IF('{LANGUAGE_DIRECTION}'=='rtl'){ data-date-rtl="true" {:IF} required>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-md-12">
                                    <div class="submit-field">
                                        <h5>{LANG_END_DATE}</h5>
                                        <input type="text" class="with-border margin-bottom-0" data-provide="datepicker" data-date-format="yyyy-mm-dd" data-date-autoclose="true" data-date-language="{LANG_CODE}" data-date-end-date="0d" name="end_date" value="{END_DATE}" IF('{LANGUAGE_DIRECTION}'=='rtl'){ data-date-rtl="true" {:IF}>
                                    </div>
                                </div>
                            </div>
                            <div class="submit-field">
                                <h5>{LANG_CURRENTLY_WORKING?}</h5>
                                <div class="radio margin-right-20">
                                    <input class="with-gap" type="radio" name="currently_working" id="1" value="1" checked />
                                    <label for="1"><span class="radio-label"></span>{LANG_YES}</label>
                                </div>
                                <div class="radio margin-right-20">
                                    <input class="with-gap" type="radio" name="currently_working" id="0" value="0" IF('{CURRENTLY_WORKING}'=='0'){ checked{:IF}/>
                                    <label for="0"><span class="radio-label"></span>{LANG_NO}</label>
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
<link href="{SITE_URL}templates/{TPL_NAME}/css/bootstrap-datepicker3.min.css" rel="stylesheet"/>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap-datepicker.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.{LANG_CODE}.min.js" charset="UTF-8"></script>
{OVERALL_FOOTER}
