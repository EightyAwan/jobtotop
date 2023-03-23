{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_EXPIRED_JOBS}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_EXPIRED_JOBS}</li>
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
                                  IF({COMPANY_ENABLE}){
                                <li><a href="{LINK_MYCOMPANIES}"><i class="icon-feather-box"></i> {LANG_MY_COMPANIES} <span class="nav-tag">{COMPANIES}</span></a></li>
                                  {:IF}
                                <li><a href="{LINK_MYJOBS}"><i class="icon-feather-briefcase"></i> {LANG_MY_JOBS} <span class="nav-tag">{MYADS}</span></a></li>
                                    <li><a href="{LINK_SAVEDJOBS}"><i class="icon-feather-clock"></i> {LANG_SAVED_JOBS} <span class="nav-tag">{SAVEDADS}</span></a></li> <!-- Custom Fields -->
                                <li><a href="{LINK_PENDINGJOBS}"><i class="icon-feather-clock"></i> {LANG_PENDING_JOBS} <span class="nav-tag">{PENDINGADS}</span></a></li>
                                <li><a href="{LINK_HIDDENJOBS}"><i class="icon-feather-eye-off"></i> {LANG_HIDDEN_JOBS} <span class="nav-tag">{HIDDENADS}</span></a></li>
                                <li class="active"><a href="{LINK_EXPIREJOBS}"><i class="icon-feather-alert-octagon"></i> {LANG_EXPIRED_JOBS} <span class="nav-tag">{EXPIREADS}</span></a></li>
                                <li><a href="{LINK_RESUBMITJOBS}"><i class="icon-feather-rotate-cw"></i> {LANG_RESUBMITTED_JOBS} <span class="nav-tag">{RESUBMITADS}</span></a></li>
                                  <li><a href="{LINK_FAVUSERS}"><i class="icon-feather-heart"></i> {LANG_FAV_USERS}
                                          <span class="nav-tag">{FAVORITEUSERSS}</span></a></li>
                              </ul>

                              <ul data-submenu-title="{LANG_ACCOUNT}">
                                IF('{WCHAT}'=='on'){
                                <li><a href="{LINK_MESSAGE}"><i class="icon-feather-message-circle"></i> {LANG_MESSAGE}</a></li>
                                {:IF}
                                <li><a href="{LINK_TRANSACTION}"><i class="icon-feather-file-text"></i> {LANG_TRANSACTIONS}</a></li>
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
                        <h3><i class="icon-feather-alert-octagon"></i> {LANG_EXPIRED_JOBS}</h3>
                    </div>
                    <div class="content with-padding">
                        <div class="table-responsive">
                            <table id="js-table-list" class="basic-table dashboard-box-list">
                                <tr>
                                    <th class="big-width">{LANG_JOBS}</th>
                                    <th class="small-width">{LANG_STATUS}</th>
                                    <th class="small-width">{LANG_ACTIONS}</th>
                                </tr>
                                IF({TOTALITEM}){
                                {LOOP: ITEM}
                                <tr class="ajax-item-listing" data-item-id="{ITEM.id}">
                                    <td>
                                        <div class="job-listing">
                                            <div class="job-listing-details">
                                                <div class="job-listing-description">
                                                    IF({COMPANY_ENABLE}){
                                                    <h4 class="job-listing-company">{ITEM.company_name}</h4>
                                                    {:IF}
                                                    <h3 class="job-listing-title margin-bottom-5">
                                                        <a href="{ITEM.link}">{ITEM.product_name}</a>
                                                            IF("{ITEM.featured}"=="1"){ <span class="badge blue"> {LANG_FEATURED}</span> {:IF}
                                                            IF("{ITEM.urgent}"=="1"){ <span class="badge yellow"> {LANG_URGENT}</span> {:IF}
                                                            IF("{ITEM.highlight}"=="1"){ <span class="badge red"> {LANG_HIGHLIGHT}</span> {:IF}
                                                    </h3>
                                                    <div class="job-listing-footer">
                                                        <ul>
                                                            <li><i class="la la-map-marker"></i> {ITEM.location}</li>
                                                            IF("{ITEM.salary_min}"!="0"){
                                                            <li><i class="la la-credit-card"></i> {ITEM.salary_min}-{ITEM.salary_max}</li>
                                                            {:IF}
                                                            <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                                                            <li><i class="la la-suitcase"></i> {ITEM.product_type}</li>
                                                            <li><i class="la la-calendar-times-o"></i> {LANG_EXPIRING}: {ITEM.expire_date}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        IF("{ITEM.status}"=="active"){ <span class="badge green">{ITEM.status}</span>{:IF}
                                        IF("{ITEM.status}"=="pending"){ <span class="badge blue">{ITEM.status}</span> {:IF}
                                        IF("{ITEM.status}"=="expire"){ <span class="badge yellow">{ITEM.status}</span> {:IF}
                                    </td>
                                    <td>
                                        <a href="{LINK_APPLIED_USERS}/{ITEM.id}" class="button gray ripple-effect ico" data-tippy-placement="top" title="{LANG_APPLIED_USERS}"><i class="icon-feather-users"></i></a>
                                        <a href="{LINK_EDIT-JOB}/{ITEM.id}" class="button gray ripple-effect ico" data-tippy-placement="top" title="{LANG_RENEW}"><i class="icon-feather-edit"></i></a>
                                        <a href="#" data-ajax-action="deleteMyAd" class="button gray ripple-effect ico item-js-delete" data-tippy-placement="top" title="{LANG_DELETE}"><i class="icon-feather-trash-2"></i></a>
                                    </td>
                                </tr>
                                {/LOOP: ITEM}
                                {ELSE}
                                <tr>
                                    <td colspan="3" class="text-center">{LANG_NO_EXPIRE_JOB}</td>
                                </tr>
                                {:IF}
                            </table>
                        </div>
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
</div>
{OVERALL_FOOTER}
