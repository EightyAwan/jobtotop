{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_FAV_JOBS}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_FAV_JOBS}</li>
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
                                    IF({RESUME_ENABLE}){
                                    <li><a href="{LINK_RESUMES}"><i
                                                    class="icon-feather-paperclip"></i> {LANG_MY_RESUMES} <span
                                                    class="nav-tag">{RESUMES}</span></a></li>
                                    {:IF}
                                    <li class="active"><a href="{LINK_FAVJOBS}"><i class="icon-feather-heart"></i> {LANG_FAV_JOBS} <span class="nav-tag fav-ad-count">{FAVORITEADS}</span></a></li>
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
                    <h3><i class="icon-feather-heart"></i> {LANG_FAV_JOBS}</h3>
                </div>
                IF(!{TOTALITEM}){
                <div class="content with-padding text-center">
                    {LANG_NO_FAV_JOB}
                </div>
                {:IF}
            </div>
            <div class="listings-container margin-top-30">
                {LOOP: ITEM}
                <div class="job-listing fav-listing">
                    <div class="job-listing-details">
                        <div class="job-listing-company-logo">
                            <img src="{SITE_URL}storage/products/{ITEM.image}" alt="{ITEM.product_name}">
                        </div>
                        <div class="job-listing-description">
                            IF({COMPANY_ENABLE}){
                            <h4 class="job-listing-company">{ITEM.company_name}</h4>
                            {:IF}
                            <h3 class="job-listing-title"><a href="{ITEM.link}">{ITEM.product_name}</a></h3>
                            <p class="job-listing-text">{ITEM.desc}</p>
                        </div>
                        <span class="job-type">{ITEM.product_type}</span>
                    </div>
                    <div class="job-listing-footer with-icon">
                        <ul>
                            <li><i class="la la-map-marker"></i> {ITEM.location}</li>
                            IF("{ITEM.salary_min}"!="0"){
                            <li><i class="la la-credit-card"></i> {ITEM.salary_min}-{ITEM.salary_max} {LANG_PER} {ITEM.salary_type}</li>
                            {:IF}
                            <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                        </ul>
                        <span class="fav-icon added set-item-fav" data-item-id="{ITEM.id}" data-userid="{USER_ID}" data-action="removeFavAd"></span>
                    </div>
                </div>
                {/LOOP: ITEM}

                <!-- Pagination -->
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12">
                        <!-- Pagination -->
                        <div class="pagination-container margin-top-20">
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
            </div>
        </div>
    </div>
</div>
</div>
{OVERALL_FOOTER}
