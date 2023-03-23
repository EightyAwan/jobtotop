{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{FULLNAME}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">
                                {LANG_HOME}
                            </a></li>
                        <li>{FULLNAME}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <!-- Content -->
        <div class="col-xl-8 col-lg-8">
            <div class="single-page-section">
                <div class="single-page-inner">
                    <div class="single-page-image"><img src="{SITE_URL}storage/profile/{USERIMAGE}" alt="{FULLNAME}"></div>
                    
                    <div class="single-page-details">
                        <h3>{FULLNAME}</h3>
                        
                        <ul>
                            <li>
                                <i class="icon-feather-map-pin"></i>
                                <span>{CITYNAME}{STATENAME}</span>
                            </li>
                            IF('{CATEGORY}' != ''){
                            <li>
                                <i class="icon-feather-folder"></i>
                                <span>{CATEGORY}
                                    IF('{SUBCATEGORY}' != ''){
                                    / {SUBCATEGORY}
                                    {:IF}
                                </span>
                            </li>
                            {:IF}
                            <li>
                                <i class="icon-feather-clock"></i>
                                <span>{LANG_MEMBER_SINCE} {CREATED}</span>
                            </li>
                        </ul>
                        <ul class="social-icons">
                            IF('{FACEBOOK}' != ''){
                            <li><a href="{FACEBOOK}" title="{LANG_FACEBOOK}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            {:IF}
                            IF('{TWITTER}' != ''){
                            <li><a href="{TWITTER}" title="{LANG_TWITTER}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-twitter"></i></a></li>
                            {:IF}
                            IF('{LINKEDIN}' != ''){
                            <li><a href="{LINKEDIN}" title="{LANG_LINKEDIN}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                            {:IF}
                            IF('{INSTAGRAM}' != ''){
                            <li><a href="{INSTAGRAM}" title="{LANG_INSTAGRAM}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-instagram"></i></a></li>
                            {:IF}
                            IF('{YOUTUBE}' != ''){
                            <li><a href="{YOUTUBE}" title="{LANG_YOUTUBE}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
                            {:IF}
                        </ul>
                    </div>
                    
                </div>
               
            </div>
            <div class="single-page-section">
                {ABOUT}
            </div>
            
            <hr>
            IF("{resume}" != ""){
            <div class="row ali_download">
                <div class=" col-6 d-flex align-items-center"> <h3>CV</h3></div>
                 <div class=" col-6 d-flex justify-content-end">
                     <a href="https://www.jobtotop.com/storage/resumes/167325551263bbda58666f3.pdf" target="_blank"  class="btn btn btn-primary btn-l">Download</a>
                 </div>
            </div>
            <iframe class="doc ali_cv" src="https://docs.google.com/gview?url={SITE_URL}storage/resumes/{resume}&embedded=true"></iframe>
            
            {:IF}
            IF({TOTALITEM}){
            <div class="boxed-list margin-bottom-60" id="all-jobs">
                <div class="boxed-list-headline">
                    <h3><i class="icon-feather-briefcase"></i> {LANG_ALL_JOBS}</h3>
                </div>
                <div class="listings-container compact-list-layout margin-top-30">
                    {LOOP: ITEM}
                        <a href="{ITEM.link}" class="job-listing">
                            <div class="job-listing-details">
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title">{ITEM.name}
                                        IF("{ITEM.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                                        IF("{ITEM.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                                        IF("{ITEM.highlight}"=="1"){ <div class="badge red"> {LANG_HIGHLIGHT}</div> {:IF}
                                    </h3>
                                    <div class="job-listing-footer">
                                        <ul>
                                            <li><i class="la la-map-marker"></i> {ITEM.city}</li>
                                            IF("{ITEM.salary_min}"!="0"){
                                            <li><i class="la la-credit-card"></i> {ITEM.salary_min}-{ITEM.salary_max}</li>
                                            {:IF}
                                            <li><i class="la la-clock-o"></i> {ITEM.created_at}</li>
                                        </ul>
                                    </div>
                                </div>
                                <span class="job-type">{ITEM.product_type}</span>
                            </div>
                        </a>
                    {/LOOP: ITEM}
                </div>
                IF({SHOW_PAGING}){
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
                {:IF}
            </div>
            {:IF}

            IF({TOTAL_EXPERIENCES}){
            <div class="boxed-list margin-bottom-60" id="all-jobs">
                <div class="boxed-list-headline">
                    <h3><i class="icon-feather-award"></i> {LANG_EXPERIENCES}</h3>
                </div>
                <div class="listings-container compact-list-layout margin-top-30">
                    {LOOP: EXPERIENCES}
                        <div class="job-listing">
                            <div class="job-listing-details">
                                <div class="job-listing-description">
                                    <h4 class="job-listing-company">{EXPERIENCES.company}</h4>
                                    <h3 class="job-listing-title">{EXPERIENCES.title}</h3>
                                    <p class="job-listing-text read-more-toggle" data-read-more="{LANG_READ_MORE}" data-read-less="{LANG_READ_LESS}">{EXPERIENCES.description}</p>
                                </div>
                            </div>
                            <div class="job-listing-footer margin-top-10">
                                <ul>
                                    <li><i class="la la-clock-o"></i> {EXPERIENCES.start_date} - {EXPERIENCES.end_date}</li>
                                    <li><i class="la la-map-marker"></i> {EXPERIENCES.city}</li>
                                </ul>
                            </div>
                        </div>
                    {/LOOP: EXPERIENCES}
                </div>
            </div>
            {:IF}
        </div>
        <!-- Sidebar -->
        <div class="col-xl-4 col-lg-4">
            <div class="dashboard-box small-box margin-top-0 margin-bottom-30">
                <!-- Headline -->
                <div class="headline">
                    <h3><i class="icon-feather-alert-circle"></i> {LANG_DETAILS}</h3>
                </div>
                <div class="content with-padding">
                    <table>
                        IF(!{HIDE_CONTACT}){
                        IF('{PHONE}' != ''){
                        <tr>
                            <td>{LANG_PHONE}</td>
                            <td><a href="tel:{PHONE}" rel="nofollow">{PHONE}</a></td>
                        </tr>
                        {:IF}
                        IF('{EMAIL}' != ''){
                        <tr>
                            <td>{LANG_EMAIL}</td>
                            <td><a href="mailto:{EMAIL}" rel="nofollow">{EMAIL}</a></td>
                        </tr>
                        {:IF}
                        {:IF}
                        IF('{WEBSITE}' != ''){
                        <tr>
                            <td>{LANG_WEBSITE}</td>
                            <td><a href="{WEBSITE}" rel="nofollow">{WEBSITE}</a></td>
                        </tr>
                        {:IF}
                        IF('{GENDER}' != ''){
                        <tr>
                            <td>{LANG_GENDER}</td>
                            <td>
                                IF('{GENDER}' == 'Male'){
                                {LANG_GENDER_MALE}
                                ELSEIF('{GENDER}' == 'Female'){
                                {LANG_GENDER_FEMALE}
                                ELSEIF('{ITEM.sex}' == 'Other'){
                                {LANG_GENDER_OTHER}
                                {ELSE}
                                -
                                {:IF}
                            </td>
                        </tr>
                        {:IF}
                        IF('{AGE}' != ''){
                        <tr>
                            <td>{LANG_AGE}</td>
                            <td>{AGE}</td>
                        </tr>
                        {:IF}
                        IF('{SALARY_MIN}' != '0'){
                        <tr>
                            <td>{LANG_SALARY}</td>
                            <td data-tippy-placement="top" title="{LANG_SALARY_PER_MONTH}">{SALARY_MIN}
                                IF('{SALARY_MAX}' != ''){
                                - {SALARY_MAX}
                                {:IF}
                            </td>
                        </tr>
                        {:IF}
                        IF('{ADDRESS}' != ''){
                        <tr>
                            <td>{LANG_ADDRESS}</td>
                            <td>{ADDRESS}</td>
                        </tr>
                        {:IF}
                    </table>
                </div>
            </div>
            <div class="sidebar-container">
                <div class="sidebar-widget">
                    <h3>{LANG_BOOKMARK_SHARE}</h3>
                    IF('{USERTYPE}' == 'employer'){
                    IF('{USER_TYPE}' == 'user'){
                    <button class="fav-button margin-bottom-20 set-user-fav IF('{USER_FAVORITE}' == '1'){ added {:IF}" data-favuser-id="{USERID}" data-userid="{USER_ID}" data-action="setFavUser">
                        <span class="fav-icon"></span>
                        <span class="fav-text">{LANG_ADD_TO_FAV}</span>
                        <span class="added-text">{LANG_ADDED}</span>
                    </button>
                    {:IF}
                    {:IF}

                    <!-- Share Buttons -->
                    <ul class="share-buttons-icons">
                        <li><a href="mailto:?subject={FULLNAME}&body={LINK_PROFILE}/{USERNAME}" data-button-color="#dd4b39" title="{LANG_SHARE_EMAIL}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-envelope"></i></a></li>
                        <li><a href="https://facebook.com/sharer/sharer.php?u={LINK_PROFILE}/{USERNAME}" data-button-color="#3b5998" title="{LANG_SHARE_FACEBOOK}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/share?url={LINK_PROFILE}/{USERNAME}&text={FULLNAME}" data-button-color="#1da1f2" title="{LANG_SHARE_TWITTER}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.linkedin.com/shareArticle?mini=true&url={LINK_PROFILE}/{USERNAME}" data-button-color="#0077b5" title="{LANG_SHARE_LINKEDIN}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="https://pinterest.com/pin/create/bookmarklet/?&url={LINK_PROFILE}/{USERNAME}&description={FULLNAME}" data-button-color="#bd081c" title="{LANG_SHARE_PINTEREST}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-pinterest-p"></i></a></li>
                        <li><a href="https://web.whatsapp.com/send?text={LINK_PROFILE}/{USERNAME}" data-button-color="#25d366" title="{LANG_SHARE_WHATSAPP}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="margin-top-15"></div>
{OVERALL_FOOTER}