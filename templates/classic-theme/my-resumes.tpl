{OVERALL_HEADER}
<div class="margin-bottom-0" id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    {LANG_MY_RESUMES}
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
                            {LANG_MY_RESUMES}
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
                                        <li class="active"><a href="{LINK_RESUMES}"><i class="icon-feather-paperclip"></i> {LANG_MY_RESUMES}<span class="nav-tag">{RESUMES}</span></a></li>
                                        <li><a href="{LINK_APPLIED_JOBS}"><i class="icon-feather-briefcase"></i> {LANG_APPLIED_JOBS}
                                                <span class="nav-tag">{APPLIEDJOBS}</span></a></li>
                                        <li><a href="{LINK_FAVJOBS}"><i class="icon-feather-heart"></i> {LANG_FAV_JOBS}<span class="nav-tag">{FAVORITEADS}</span></a></li>
                                        <li><a href="{LINK_JOBALERT}"><i class="icon-feather-bell"></i> {LANG_JOB_ALERT}</a></li>
                                    </ul>
                                    <ul data-submenu-title="{LANG_ACCOUNT}">
                                        IF('{WCHAT}'=='on'){
                                        <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                        {:IF}
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
                        <h3>
                            <i class="icon-feather-paperclip">
                            </i>
                            {LANG_MY_RESUMES}
                        </h3>
                    </div>
                    <div class="content with-padding">
                        <div class="row">
                            <div class="col-xl-4">
                                <form method="get" action="">
                                <div class="input-with-icon">
                                    <input class="with-border" type="text" name="keywords" value="{KEYWORDS}" placeholder="{LANG_SEARCH}...">
                                    <i class="icon-feather-search"></i>
                                </div>
                                </form>
                            </div>
                            <div class="col-xl-8 text-right">
                                <a href="{LINK_ADD-RESUME}" class="button ripple-effect">{LANG_ADD_RESUME}</a>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="basic-table dashboard-box-list">
                                <tr>
                                    <th>{LANG_FILE}</th>
                                    <th class="big-width">{LANG_NAME}</th>
                                    <th class="small-width">{LANG_ACTIONS}</th>
                                </tr>
                                IF({RESUMES}){
                                {LOOP: ITEM}
                                <tr class="resume-row" data-item-id="{ITEM.id}">
                                    <td>
                                        <a href="{SITE_URL}storage/resumes/{ITEM.filename}" title="{ITEM.filename}" class="button ripple-effect" download>
                                            <i class="icon-feather-download"></i> {LANG_DOWNLOAD}
                                        </a>
                                    </td>
                                    <td>{ITEM.name}</td>
                                    <td>
                                        <a href="{LINK_EDIT-RESUME}/{ITEM.id}" class="button gray ripple-effect ico" data-tippy-placement="top" title="{LANG_EDIT}"><i class="icon-feather-edit"></i></a>
                                        <a href="#" class="button gray ripple-effect ico ajax-delete-resume" data-tippy-placement="top" title="{LANG_DELETE}"><i class="icon-feather-trash-2"></i></a>
                                    </td>
                                </tr>
                                {/LOOP: ITEM}
                                {ELSE}
                                <tr>
                                    <td colspan="3" class="text-center">{LANG_NO_RESULT_FOUND}</td>
                                </tr>
                                {:IF}
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{OVERALL_FOOTER}
