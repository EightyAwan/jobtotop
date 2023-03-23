{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_APPLIED_USERS}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_APPLIED_USERS}</li>
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
                                <span class="hamburger hamburger--collapse">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </span>
                                <span class="trigger-title">{LANG_DASH_NAVIGATION}</span>
                            </a>

                            <div class="dashboard-nav">
                                <div class="dashboard-nav-inner">
                                    <ul data-submenu-title="{LANG_MY_ACCOUNT}">
                                        <li><a href="{LINK_DASHBOARD}"><i
                                                        class="icon-feather-grid"></i> {LANG_DASHBOARD}</a></li>
                                        <li><a href="{LINK_PROFILE}/{USERNAME}"><i
                                                        class="icon-feather-user"></i> {LANG_PROFILE_PUBLIC}</a></li>
                                    </ul>
                                    <ul data-submenu-title="{LANG_MY_JOBS}">
                                        IF({COMPANY_ENABLE}){
                                        <li><a href="{LINK_MYCOMPANIES}"><i
                                                        class="icon-feather-box"></i> {LANG_MY_COMPANIES} <span
                                                        class="nav-tag">{COMPANIES}</span></a></li>
                                        {:IF}
                                        <li class="active"><a href="{LINK_MYJOBS}"><i
                                                        class="icon-feather-briefcase"></i> {LANG_MY_JOBS} <span
                                                        class="nav-tag">{MYADS}</span></a></li>
                                        <li><a href="{LINK_SAVEDJOBS}"><i
                                                        class="icon-feather-clock"></i> {LANG_SAVED_JOBS} <span
                                                        class="nav-tag">{SAVEDADS}</span></a></li>
                                        <li><a href="{LINK_PENDINGJOBS}"><i
                                                        class="icon-feather-clock"></i> {LANG_PENDING_JOBS} <span
                                                        class="nav-tag">{PENDINGADS}</span></a></li>
                                        <li><a href="{LINK_HIDDENJOBS}"><i
                                                        class="icon-feather-eye-off"></i> {LANG_HIDDEN_JOBS} <span
                                                        class="nav-tag">{HIDDENADS}</span></a></li>
                                        <li><a href="{LINK_EXPIREJOBS}"><i
                                                        class="icon-feather-alert-octagon"></i> {LANG_EXPIRED_JOBS}
                                                <span class="nav-tag">{EXPIREADS}</span></a></li>
                                        <li><a href="{LINK_RESUBMITJOBS}"><i
                                                        class="icon-feather-rotate-cw"></i> {LANG_RESUBMITTED_JOBS}
                                                <span class="nav-tag">{RESUBMITADS}</span></a></li>
                                        <li><a href="{LINK_FAVUSERS}"><i
                                                        class="icon-feather-heart"></i> {LANG_FAV_USERS}
                                                <span class="nav-tag">{FAVORITEUSERSS}</span></a></li>
                                    </ul>

                                    <ul data-submenu-title="{LANG_ACCOUNT}">
                                        IF('{WCHAT}'=='on'){
                                        <li><a href="{LINK_MESSAGE}"><i
                                                        class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                        {:IF}
                                        <li><a href="{LINK_TRANSACTION}"><i
                                                        class="icon-feather-file-text"></i> {LANG_TRANSACTIONS}</a></li>
                                        <li><a href="{LINK_LOGOUT}"><i class="icon-feather-log-out"></i> {LANG_LOGOUT}
                                            </a></li>
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
                        <h3><i class="icon-feather-users"></i> {LANG_APPLIED_USERS} &ndash; {PRODUCT_NAME}</h3>
                    </div>
                    IF(!{TOTALITEM}){
                    <div class="content with-padding text-center">
                        {LANG_NO_USERS_FOUND}
                    </div>
                    {:IF}
                </div>
                <div class="listings-container margin-top-35">
                    {LOOP: ITEM}
                    IF('{ITEM.selected}' == 0){
                        <div class="job-listing">
                    {ELSE}
                        <div class="job-listing" style="border: 1px solid green !important;">
                    {:IF}
                            <div class="job-listing-details">
                                <div class="job-listing-company-logo">
                                    <a href="{LINK_PROFILE}/{ITEM.username}">
                                        <img src="{SITE_URL}storage/profile/{ITEM.image}" alt="{ITEM.name}">
                                    </a>
                                </div>
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title"><a
                                                href="{LINK_PROFILE}/{ITEM.username}">{ITEM.name}</a>
                                        IF('{ITEM.sex}' == 'Male'){
                                        <span class="gender-badge male" title="{LANG_GENDER_MALE}"
                                              data-tippy-placement="top"><i class="la la-mars"></i></span>
                                        ELSEIF('{ITEM.sex}' == 'Female'){
                                        <span class="gender-badge female" title="{LANG_GENDER_FEMALE}"
                                              data-tippy-placement="top"><i class="la la-venus"></i></span>
                                        ELSEIF('{ITEM.sex}' == 'Other'){
                                        <span class="gender-badge other" title="{LANG_GENDER_OTHER}"
                                              data-tippy-placement="top"><i class="la la-transgender"></i></span>
                                        {:IF}
                                    </h3>

                                    <p class="job-listing-text read-more-toggle" data-read-more="{LANG_READ_MORE}" data-read-less="{LANG_READ_LESS}">{ITEM.description}</p>
                                </div>
                                 IF('{ITEM.selected}' == 1){
                                    IF('{ITEM.resume}' != ''){
                                    <a href="{ITEM.resume}" class="job-type" download="" style="background-color: #1da34a; color: white; border: 1px solid white;"><i
                                                class="icon-feather-download"></i> {LANG_RESUME}</a>
                                    {:IF}
                                {ELSE}
                                   <div onclick="selectCVs({ITEM.id},{ITEM.job_id})" data-action="ajax_selectCV" class="job-type"> {LANG_SELECT}</div>
                                {:IF}
                            </div>
                            IF('{ITEM.selected}' == 0){
                            <div class="job-listing-footer with-icon">
                            {ELSE}
                            <div class="job-listing-footer with-icon green" style="background-color: #1da34a;">
                            {:IF}
                                <ul>
                                    IF('{ITEM.city}' != ''){
                                    <li style="color: black !important"><i class="la la-map-marker" style="color: black !important"></i> {ITEM.city}</li>
                                    {:IF}
                                    IF('{ITEM.category}' != ''){
                                    <li style="color: black !important"><i class="icon-feather-folder" style="color: black !important"></i> {ITEM.category}
                                        IF('{ITEM.subcategory}' != ''){
                                        / {ITEM.subcategory}
                                        {:IF}</li>
                                    {:IF}
                                    IF("{ITEM.salary_min}"!="0"){
                                    <li style="color: black !important" data-tippy-placement="top" title="{LANG_SALARY_PER_MONTH}"><i
                                                class="la la-credit-card" style="color: black !important"></i> {ITEM.salary_min}
                                        IF('{ITEM.salary_max}' != ''){
                                        - {ITEM.salary_max}
                                        {:IF}</li>
                                    {:IF}
                                </ul>
                                <span class="fav-icon set-user-fav IF('{ITEM.favorite}' == '1'){ added {:IF}"
                                      data-favuser-id="{ITEM.user_id}" data-userid="{USER_ID}"
                                      data-action="setFavUser"></span>
                            </div>
                        </div>
                    {/LOOP: ITEM}
                    <div class="clearfix"></div>
                    IF("{TOTALITEM}"!="0"){
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
</div>
{OVERALL_FOOTER}