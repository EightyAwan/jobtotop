{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_CURRENT_PLAN}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_MEMBERSHIP}</li>
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
                                <li class="active"><a href="{LINK_MEMBERSHIP}"><i class="icon-feather-gift"></i> {LANG_MEMBERSHIP}</a></li>
                              </ul>
                              <ul data-submenu-title="{LANG_MY_JOBS}">
                                  IF({COMPANY_ENABLE}){
                                  <li><a href="{LINK_MYCOMPANIES}"><i class="icon-feather-box"></i> {LANG_MY_COMPANIES} <span class="nav-tag">{COMPANIES}</span></a></li>
                                  {:IF}
                                <li><a href="{LINK_MYJOBS}"><i class="icon-feather-briefcase"></i> {LANG_MY_JOBS} <span class="nav-tag">{MYADS}</span></a></li>
                                    <li><a href="{LINK_SAVEDJOBS}"><i class="icon-feather-clock"></i> {LANG_SAVED_JOBS} <span class="nav-tag">{SAVEDADS}</span></a></li> <!-- Custom Fields -->
                                <li><a href="{LINK_PENDINGJOBS}"><i class="icon-feather-clock"></i> {LANG_PENDING_JOBS} <span class="nav-tag">{PENDINGADS}</span></a></li>
                                <li><a href="{LINK_HIDDENJOBS}"><i class="icon-feather-eye-off"></i> {LANG_HIDDEN_JOBS} <span class="nav-tag">{HIDDENADS}</span></a></li>
                                <li><a href="{LINK_EXPIREJOBS}"><i class="icon-feather-alert-octagon"></i> {LANG_EXPIRED_JOBS} <span class="nav-tag">{EXPIREADS}</span></a></li>
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
                        <h3><i class="icon-feather-gift"></i> {LANG_CURRENT_PLAN}</h3>
                    </div>
                    <div class="content with-padding">
                        <div class="table-responsive">
                            <table id="js-table-list" class="basic-table dashboard-box-list">
                                <tr>
                                    <th>{LANG_MEMBERSHIP}</th>
                                    <th class="small-width">{LANG_COST}</th>
                                    <th>{LANG_TERM}</th>
                                    <th>{LANG_STATUS}</th>
                                    <th>{LANG_START_DATE}</th>
                                    <th>{LANG_EXPIRY_DATE}</th>
                                    IF("{SHOW_CANCEL_BUTTON}"=="1"){ <th>{LANG_CANCEL}</th>{:IF}
                                </tr>
                                <tr>
                                    <td>{UPGRADE_TITLE}</td>
                                    <td>{CURRENCY_SIGN}{UPGRADE_COST}</td>
                                    <td>{UPGRADE_TERM}</td>
                                    <td>{UPGRADE_STATUS}</td>
                                    <td>{UPGRADE_START_DATE}</td>
                                    <td>{UPGRADE_EXPIRY_DATE}</td>
                                    IF("{SHOW_CANCEL_BUTTON}"=="1"){
                                    <td><a href="{LINK_MEMBERSHIP}/?action=cancel_auto_renew"><i class="fa fa-remove"></i> {LANG_CANCEL}</a></td>
                                    {:IF}
                                </tr>
                                <tr>
                                    <td align="right" colspan="7"><button type="button" class="button" onClick="window.location.href='{LINK_MEMBERSHIP}/changeplan'">{LANG_CHANGE_PLAN}</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{OVERALL_FOOTER}
