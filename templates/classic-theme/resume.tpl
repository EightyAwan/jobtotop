{OVERALL_HEADER}
<div class="margin-bottom-0" id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>
                    {LANG_ADD_RESUME}
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
                            {LANG_ADD_RESUME}
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
                                        <li>
                                            <a href="{LINK_DASHBOARD}">
                                                <i class="icon-feather-grid">
                                                </i>
                                                {LANG_DASHBOARD}
                                            </a>
                                        </li>
                                        <li><a href="{LINK_PROFILE}/{USERNAME}"><i
                                                        class="icon-feather-user"></i> {LANG_PROFILE_PUBLIC}</a></li>
                                    </ul>
                                    <ul data-submenu-title="{LANG_MY_JOBS}">
                                        <li class="active">
                                            <a href="{LINK_RESUMES}">
                                                <i class="icon-feather-paperclip">
                                                </i>
                                                {LANG_MY_RESUMES}
                                                <span class="nav-tag">
                                                    {RESUMES}
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{LINK_FAVJOBS}">
                                                <i class="icon-feather-heart">
                                                </i>
                                                {LANG_FAV_JOBS}
                                                <span class="nav-tag">
                                                    {FAVORITEADS}
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="{LINK_JOBALERT}">
                                                <i class="icon-feather-bell">
                                                </i>
                                                {LANG_JOB_ALERT}
                                            </a>
                                        </li>
                                    </ul>
                                    <ul data-submenu-title="{LANG_ACCOUNT}">
                                        IF('{WCHAT}'=='on'){
                                        <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                        {:IF}
                                        <li>
                                            <a href="{LINK_LOGOUT}">
                                                <i class="icon-feather-log-out">
                                                </i>
                                                {LANG_LOGOUT}
                                            </a>
                                        </li>
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
                            {LANG_ADD_RESUME}
                        </h3>
                    </div>
                    <div class="content with-padding">
                        IF('{ERROR}' != ''){
                        <span class="status-not-available">{ERROR}</span>
                        {:IF}
                        <form method="post" accept-charset="UTF-8" enctype="multipart/form-data">
                            <div class="submit-field" style="display: none;">
                              <h5>{LANG_NAME}</h5>
                                <input type="text" class="with-border" id="name" name="name" value="{NAME}">
                            </div>
                            <div class="submit-field">
                              <h5>{LANG_FILE} *</h5>
                              <div class="uploadButton">
                                  <input class="uploadButton-input" type="file" id="resume" name="resume"/>
                                  <label class="uploadButton-button ripple-effect" for="resume">{LANG_UPLOAD_RESUME}</label>
                                  <span class="uploadButton-file-name">{LANG_RESUME_FILE_TYPE}</span>
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
{OVERALL_FOOTER}
