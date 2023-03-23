{OVERALL_HEADER}
<div class="margin-bottom-0" id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    {LANG_MY_EXPERIENCES}
                </h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li>
                            <a href="{LINK_INDEX}">
                                {LANG_HOME}
                            </a>
                        </li>
                        <li>
                            {LANG_MY_EXPERIENCES}
                        </li>
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
                            <a class="dashboard-responsive-nav-trigger" href="#">
                                <span class="hamburger hamburger--collapse">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner">
                                        </span>
                                    </span>
                                </span>
                                <span class="trigger-title">
                                    {LANG_DASH_NAVIGATION}
                                </span>
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
                    <div class="headline">
                        <h3><i class="icon-feather-award"></i> {LANG_MY_EXPERIENCES} &ndash; <a href="{LINK_ADD_EXPERIENCE}">{LANG_ADD_EXPERIENCE}</a></h3>
                    </div>
                    IF(!{TOTALITEM}){
                    <div class="content with-padding text-center">
                        {LANG_NO_DATA_FOUND}
                    </div>
                    {:IF}
                </div>
                <div class="listings-container margin-top-35">
                    {LOOP: ITEM}
                    <div class="job-listing experience-row" data-item-id="{ITEM.id}">
                        <div class="job-listing-details">
                            <div class="job-listing-description">
                                <h4 class="job-listing-company">{ITEM.company}</h4>
                                <h3 class="job-listing-title">{ITEM.title}</h3>
                                <p class="job-listing-text read-more-toggle" data-read-more="{LANG_READ_MORE}" data-read-less="{LANG_READ_LESS}">{ITEM.description}</p>
                            </div>
                            <a href="{LINK_EDIT_EXPERIENCE}/{ITEM.id}" class="" data-tippy-placement="top" title="{LANG_EDIT}"><i class="icon-feather-edit"></i></a>
                            <a href="#" class="margin-left-10 ajax-delete-experience" data-tippy-placement="top" title="{LANG_DELETE}"><i class="icon-feather-trash-2"></i></a>
                        </div>
                        <div class="job-listing-footer with-icon">
                            <ul>
                                <li><i class="la la-clock-o"></i> {ITEM.start_date} - {ITEM.end_date}</li>
                                <li><i class="la la-map-marker"></i> {ITEM.city}</li>
                            </ul>
                        </div>
                    </div>
                    {/LOOP: ITEM}
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>
{OVERALL_FOOTER}