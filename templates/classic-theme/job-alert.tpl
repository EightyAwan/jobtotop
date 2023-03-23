{OVERALL_HEADER}
<div id="titlebar" class="margin-bottom-0">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_JOB_ALERT}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_JOB_ALERT}</li>
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
                                </ul>
                                <ul data-submenu-title="{LANG_MY_JOBS}">
                                    IF({RESUME_ENABLE}){
                                    <li><a href="{LINK_RESUMES}"><i
                                                    class="icon-feather-paperclip"></i> {LANG_MY_RESUMES} <span
                                                    class="nav-tag">{RESUMES}</span></a></li>
                                    {:IF}
                                    <li><a href="{LINK_APPLIED_JOBS}"><i class="icon-feather-briefcase"></i> {LANG_APPLIED_JOBS}
                                            <span class="nav-tag">{APPLIEDJOBS}</span></a></li>
                                    <li><a href="{LINK_FAVJOBS}"><i class="icon-feather-heart"></i> {LANG_FAV_JOBS} <span class="nav-tag">{FAVORITEADS}</span></a></li>
                                    <li class="active"><a href="{LINK_JOBALERT}"><i class="icon-feather-bell"></i> {LANG_JOB_ALERT}</a></li>
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
                    <h3><i class="icon-feather-bell"></i> {LANG_JOB_ALERT}</h3>
                </div>
                <div class="content with-padding">
                    <!--
                    <form method="post">
                        <div class="form-group">
                            <div class="checkbox">
                            <input type="checkbox" id="notify" name="notify" value="1" onchange="NotifyValueChanged()" IF({NOTIFY}){ checked {:IF}>
                            <label for="notify"><span class="checkbox-icon"></span> {LANG_NOTIFYEMAIL}</label>
                            </div>
                            <ul class="skills margin-left-20">
                                {LOOP: CATEGORY}
                                    <li>
                                        <div class="checkbox">
                                            <input type="checkbox" id="{CATEGORY.id}" name="choice[{CATEGORY.id}]" value="{CATEGORY.id}" {CATEGORY.selected}>
                                            <label for="{CATEGORY.id}"><span class="checkbox-icon"></span> {CATEGORY.name}</label>
                                        </div>
                                    </li>
                                {/LOOP: CATEGORY}
                            </ul>
                        </div>
                        <button type="submit" name="submit" class="button ripple-effect">{LANG_SAVE_CHANGES}</button>
                    </form>
                    -->
                    <form method="post" id="jobAlertTags">
                    <div class="row">
                        <div class="col-9">
                            <div class="ac ac-what form-group" id="ac-s">
                                <input id="s"  name="add" value="" class="fc aci select2" type="search" placeholder="Job title, keywords" autofocus="" data-ac="//ac.careerjet.net/ns" data-target="#ac-s" data-target2="#s" data-lc="en_US" data-mhd="10" data-mhm="3">
                                <button type="button" tabindex="-1" class="fc-clear ac-clear" data-target="#s">
                                <svg><use xlink:href="#icon-cross-circle-filled"></use></svg>
                                </button>
                            </div>
                        </div>
                        <div class="col-3">
                            <input type="hidden" name="addTag">
                            <button type="submit" name="submit" class="button ripple-effect">{LANG_SAVE_CHANGES}</button>
                        </div>
                    </div>
                    </form>
                    <div id="savedAlertTags" class="row">
                                {LOOP: FINAL}
                                        <span class='badge blue'>{FINAL.tag}<a href="{LINK}/?removeTag=&remove={FINAL.tag}"><i class="fa fa-times-circle"></i></a></span>
                                {/LOOP: FINAL}
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">

   

    function NotifyValueChanged()
    {
        if($('#notify').is(":checked"))
            $(".skills").slideDown();
        else
            $(".skills").slideUp();
    }
    NotifyValueChanged();
</script>
{OVERALL_FOOTER}
