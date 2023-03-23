{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-sm-12">
                <h1>{ITEM_TITLE} </h1>

                <!-- Breadcrumbs
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li><a href="{ITEM_CATLINK}">{ITEM_CATEGORY}</a></li>
                        IF('{ITEM_SUB_CATEGORY}'){
                        <li><a href="{ITEM_SUBCATLINK}">{ITEM_SUB_CATEGORY}</a></li>
                        {:IF}
                    </ul>
                </nav>-->
            </div>
            <div class="col-md-5 col-sm-12">
                IF('{Payment_url}' != ''){
                <a href="{Payment_url}" class="btn btn-large btn-primary" >Payment</a>
                {:IF}
                
                <a href="{LINK_EDIT-JOB}/{ITEM_ID}" class="btn btn-large btn-primary" >Edit Job</a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">

        <!-- Content -->
        <div class="col-xl-8 col-lg-8 content-right-offset">
            IF('{ITEM_IMAGE}'){
            <div class="job-header">
                <div class="header-image"><img src="{SITE_URL}storage/products/{ITEM_IMAGE}" alt="{ITEM_TITLE}"></div>
                <div class="header-details">
                    <h3>{ITEM_TITLE}</h3>-->
                    IF("{ITEM_FEATURED}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                    IF("{ITEM_URGENT}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                    IF("{ITEM_HIGHLIGHT}"=="1"){ <div class="badge red"> {LANG_HIGHLIGHT}</div> {:IF}
                </div>
            </div>
            {:IF}
            <div class="single-page-section">
                <h3>{LANG_JOB_OVERVIEW} </h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="job-type-buttons">
                            <div class="job-location">
                                <i class="la la-map-marker"></i> {ITEM_CITY}
                            </div>
                            <div class="job-type"><i class="la la-suitcase padding-right-5"></i>{ITEM_PRODUCT_TYPE}</div>
                            IF('{ITEM_SALARY_MIN}' != '0'){
                            <div class="salary"><i class="la la-credit-card"></i> {ITEM_SALARY_MIN} - {ITEM_SALARY_MAX} {LANG_PER} {ITEM_SALARY_TYPE}
                                IF('{ITEM_NEGOTIATE}' != ''){
                                <div class="badge green">{ITEM_NEGOTIATE}</div>
                                {:IF}
                            </div>
                            {ELSE}
                            {:IF}
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="job-listing-title-buttons">
                            IF("{ITEM_FEATURED}"=="1"){ <div class="badge"><i class="la la-hand-o-right"></i> {LANG_FEATURED}</div> {:IF}
                            IF("{ITEM_URGENT}"=="1"){ <div class="badge"><i class="la la-dashboard"></i> {LANG_URGENT}</div> {:IF}
                            IF("{ITEM_HIGHLIGHT}" <= "3"){ <div class="badge"><i class="la la-bell-o"></i> {LANG_NEW}</div> {:IF}
                        </div>
                    </div>
                </div>
            </div>

            <div class="single-page-section" style="display:none;">
                <h3>{LANG_ADDITIONAL_DETAILS}</h3>
                <div class="row">
                    IF("{ITEM_HIDE_PHONE}"=="no" && '{ITEM_PHONE}'){
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="la la-phone"></i>
                            <span>{LANG_PHONE_NUMBER}</span>
                            <h5>{ITEM_PHONE}</h5>
                        </div>
                    </div>
                    {:IF}
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="icon-feather-hash"></i>
                            <span>{LANG_JOB_ID}</span>
                            <h5>{ITEM_ID}</h5>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="job-property">
                            <i class="icon-feather-eye"></i>
                            <span>{LANG_JOB_VIEWS}</span>
                            <h5>{ITEM_VIEW}</h5>
                        </div>
                    </div>
                    IF("{ITEM_CUSTOMFIELD}"!="0"){

                    {LOOP: ITEM_CUSTOM}
                        <div class="col-md-6">
                            <div class="job-property">
                                <i class="icon-feather-chevron-right"></i>
                                <span>{ITEM_CUSTOM.title}</span>
                                <h5>{ITEM_CUSTOM.value}</h5>
                            </div>
                        </div>
                    {/LOOP: ITEM_CUSTOM}
                    {:IF}

                    {LOOP: ITEM_CUSTOM_CHECKBOX}
                        <div class="col-md-6">
                            <div class="job-property">
                                <i class="icon-feather-chevron-right"></i>
                                <span>{ITEM_CUSTOM_CHECKBOX.title}</span>
                                <h5 class="row">{ITEM_CUSTOM_CHECKBOX.value}</h5>
                            </div>
                        </div>
                    {/LOOP: ITEM_CUSTOM_CHECKBOX}
                </div>
                {LOOP: ITEM_CUSTOM_TEXTAREA}
                    <div class="job-property">
                        <i class="icon-feather-chevron-right"></i>
                        <span>{ITEM_CUSTOM_TEXTAREA.title}</span>
                        <h5>{ITEM_CUSTOM_TEXTAREA.value}</h5>
                    </div>
                {/LOOP: ITEM_CUSTOM_TEXTAREA}

            </div>

            <div class="single-page-section">
                <h3>{LANG_JOB_DESCRIPTION}</h3>
                <div class="user-html">{ITEM_DESC}</div>
            </div>
            IF({SHOW_TAG}){
            <div class="single-page-section">
                <h3>{LANG_TAGS}</h3>
                <div class="job-tags">
                    {ITEM_TAG}
                </div>
            </div>
            {:IF}
            <div class="single-page-section">
                <h3>{LANG_LOCATION}</h3>
                <div id="single-job-map-container">
                   <div class="map-widget map" id="singleListingMap" data-latitude="{ITEM_LAT}" data-longitude="{ITEM_LONG}">{ITEM_LONG} , {ITEM_LAT} </div>
                    IF('{ITEM_LOCATION}' != ''){
                    <br><span><a href="https://maps.google.com/?q={ITEM_LOCATION}" target="_blank" rel="nofollow">{ITEM_LOCATION}</a></span>
                    {:IF}
                </div>
            </div>
        </div>
        <!-- Sidebar -->
        <div class="col-xl-4 col-lg-4">
            <div class="sidebar-container">
                <!-- Sidebar Widget -->
                <div class="sidebar-widget" style="display:none;">
                    <div class="job-detail-box">
                        <div class="job-detail-box-headline text-center">
                            IF({COMPANY_ENABLE}){
                            {LANG_COMPANY_DETAILS}
                            {ELSE}
                            {LANG_EMPLOYER_DETAILS}
                            {:IF}
                        </div>
                        <div class="job-detail-box-inner">
                            <div class="job-company-logo">
                                <a href="{COMPANY_LINK}">
                                    <img src="{COMPANY_IMAGE}" alt="{COMPANY_NAME}">
                                </a>
                            </div>
                            <h2><a href="{COMPANY_LINK}">{COMPANY_NAME}</a></h2>
                            <ul>
                                IF('{COMPANY_CITY}' != ''){
                                <li>
                                    <i class="la la-map-marker"></i>
                                    <span>{COMPANY_CITY}, {COMPANY_STATE}</span>
                                </li>
                                {:IF}
                                IF(!{HIDE_CONTACT}){
                                IF('{COMPANY_EMAIL}' != ''){
                                <li>
                                    <i class="la la-envelope"></i>
                                    <span><a href="mailto:{COMPANY_EMAIL}" rel="nofollow">{COMPANY_EMAIL}</a></span>
                                </li>
                                {:IF}
                                IF('{COMPANY_PHONE}' != ''){
                                <li>
                                    <i class="icon-feather-phone-call"></i>
                                    <span><a href="tel:{COMPANY_PHONE}" rel="nofollow">{COMPANY_PHONE}</a></span>
                                </li>
                                {:IF}
                                {:IF}
                                IF('{COMPANY_WEBSITE}' != ''){
                                <li>
                                    <i class="icon-feather-link"></i>
                                    <span><a href="{COMPANY_WEBSITE}" target="_blank" rel="nofollow">{COMPANY_WEBSITE}</a></span>
                                </li>
                                {:IF}
                            </ul>
                            IF('{EMAIL_INTERVIEW}' == 'email'){
                            IF({LOGGED_IN}){
                            IF('{USERTYPE}' == 'user'){
                            IF('{ITEM_APPLICATION_URL}' != ''){
                            <a href="{ITEM_APPLICATION_URL}" class="button ripple-effect full-width" target="_blank" rel="nofollow">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></a>
                            {ELSE}
                            IF('{ALREADY_APPLIED}' == '1'){
                            <button class="button full-width green disabled" disabled><i class="icon-feather-check"></i> {LANG_ALREADY_APPLIED}</button>
                            {ELSE}
                            <a href="#apply-now-dialog" class="button ripple-effect popup-with-zoom-anim apply-dialog-button full-width">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></a>
                            {:IF}
                            {:IF}
                            IF('{ZECHAT_ON_OFF}'=='on' || '{QUICKCHAT_SOCKET_ON_OFF}'=='on' || '{QUICKCHAT_AJAX_ON_OFF}'=='on'){
                            <button type="button" class="button ripple-effect full-width margin-top-10 start_zechat zechat-hide-under-768px"
                                    data-chatid="{ITEM_AUTHORID}_{ITEM_ID}"
                                    data-postid="{ITEM_ID}"
                                    data-userid="{ITEM_AUTHORID}"
                                    data-username="{ITEM_AUTHORUNAME}"
                                    data-fullname="{ITEM_AUTHORNAME}"
                                    data-userimage="{ITEM_AUTHORIMG}"
                                    data-userstatus="{ITEM_AUTHORONLINE}"
                                    data-posttitle="{ITEM_TITLE}"
                                    data-postlink="{ITEM_LINK}">{LANG_CHAT_NOW} <i class="icon-feather-message-circle"></i></button>
                            <a href="{QUICKCHAT_URL}" class="button ripple-effect full-width margin-top-10 zechat-show-under-768px">{LANG_CHAT_NOW} <i class="icon-feather-message-circle"></i></a>
                            {:IF}
                            {:IF}
                            {ELSE}
                            <a href="#sign-in-dialog" class="button ripple-effect popup-with-zoom-anim full-width">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></a>
                            <!--<a href="#sign-in-dialog" class="button ripple-effect popup-with-zoom-anim full-width margin-top-10">{LANG_LOGIN_CHAT} <i class="icon-feather-message-circle"></i></a> -->
                            {:IF}
                            {ELSE}
                            <a href="#" class="button ripple-effect ">Please Visit for Walk-In Interview<i class="icon-feather-arrow-right"></i></a>
                            {:IF}
                        </div>
                    </div>
                </div>

                <!-- Sidebar Widget -->
                <div class="sidebar-widget">
                    <div class="right-side">
                        IF('{EMAIL_INTERVIEW}' == 'email'){
                        IF({LOGGED_IN}){
                        IF('{USERTYPE}' == 'user'){
                        IF('{ITEM_APPLICATION_URL}' != ''){
                        <a href="{ITEM_APPLICATION_URL}" class="button ripple-effect" target="_blank" rel="nofollow">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></a>
                        {ELSE}
                        IF('{ALREADY_APPLIED}' == '1'){
                        <button class="button green disabled" disabled><i class="icon-feather-check"></i> {LANG_ALREADY_APPLIED}</button>
                        {ELSE}
                        <a href="#apply-now-dialog" class="button ripple-effect popup-with-zoom-anim">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></a>
                        {:IF}
                        {:IF}
                        {:IF}
                        {ELSE}
                        <a href="#sign-in-dialog" class="button ripple-effect popup-with-zoom-anim">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></a>
                        {:IF}
                        {ELSE}
                        <a href="#" class="button ripple-effect ">Please Visit for Walk-In Interview<i class="icon-feather-arrow-right"></i></a>
                        {:IF}
                    </div>

                    IF('{USERTYPE}' == 'employer'){
                    <h3>{LANG_BOOKMARK_SHARE_EMPLOYER}</h3>
                    {:IF}
                    IF('{USERTYPE}' != 'employer'){
                    <h3>{LANG_BOOKMARK_SHARE_USER}</h3>
                    {:IF}
                    IF('{USERTYPE}' == 'user'){
                    <button class="fav-button margin-bottom-20 set-item-fav IF('{ITEM_FAVORITE}' == '1'){ added {:IF}" data-item-id="{ITEM_ID}" data-userid="{USER_ID}" data-action="setFavAd">
                        <span class="fav-icon"></span>
                        <span class="fav-text">{LANG_SAVE_THIS_JOB}</span>
                        <span class="added-text">{LANG_JOB_SAVED}</span>
                    </button>
                    <button class="fav-button sharebtn margin-bottom-20 set-item-fav" id="answer-example-share-button">
                        <span class="icon-feather-log-in"></span>
                        <span class="fav-text" style="margin-left: -20px;">Share this job</span>
                    </button>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                    {:IF}

                    <!-- Share Buttons -->
                    <ul class="share-buttons-icons">
                        <li><a href="mailto:?subject={ITEM_TITLE}&body={ITEM_LINK}" data-button-color="#dd4b39" title="{LANG_SHARE_EMAIL}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-envelope"></i></a></li>
                        <li><a href="https://facebook.com/sharer/sharer.php?u={ITEM_LINK}" data-button-color="#3b5998" title="{LANG_SHARE_FACEBOOK}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="https://twitter.com/share?url={ITEM_LINK}&text={ITEM_TITLE}" data-button-color="#1da1f2" title="{LANG_SHARE_TWITTER}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="https://www.linkedin.com/shareArticle?mini=true&url={ITEM_LINK}" data-button-color="#0077b5" title="{LANG_SHARE_LINKEDIN}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="https://pinterest.com/pin/create/bookmarklet/?&url={ITEM_LINK}&description={ITEM_TITLE}" data-button-color="#bd081c" title="{LANG_SHARE_PINTEREST}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-pinterest-p"></i></a></li>
                        <li><a href="https://web.whatsapp.com/send?text={ITEM_LINK}" data-button-color="#25d366" title="{LANG_SHARE_WHATSAPP}" data-tippy-placement="top" rel="nofollow" target="_blank"><i class="fa fa-whatsapp"></i></a></li>
                    </ul>
                </div>
                <div class="sidebar-widget">
                    <h3>{LANG_MORE_INFO}</h3>
                    <ul class="related-links">
                        IF({COMPANY_ENABLE}){
                        <li>
                            <a href="{COMPANY_LINK}#all-jobs"><i class="la la-suitcase"></i> {LANG_MORE_JOBS_BY} {COMPANY_NAME}</a>
                        </li>
                        {:IF}
                        <li>
                            <a href="{USER_LINK}#all-jobs"><i class="fa fa-user-circle-o"></i> {LANG_MORE_JOBS_BY} {USER_NAME}</a>
                        </li>
                        <li>
                            <a href="{LINK_REPORT}"><i class="la la-exclamation-triangle"></i> {LANG_REPORT_THIS_JOB}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        IF({TOTAL_ITEMS}!=0){
        <div class="col-md-12 margin-top-30">
            <div class="single-page-section">
                <h3 class="margin-bottom-25">{LANG_SIMILAR_JOBS}</h3>
                <div class="listings-container grid-layout">
                    {LOOP: ITEM}
                        <div class="job-listing">
                            <div class="job-listing-details">
                                <div class="job-listing-description">
                                    <h3 class="job-listing-title">
                                        <a href="{ITEM.link}">{ITEM.product_name}</a>
                                        IF('{USERTYPE}' == 'user'){
                                        <span style="" class="fav-icon set-item-fav IF('{ITEM.favorite}'){ added {:IF}" data-item-id="{ITEM.id}" data-userid="{USER_ID}" data-action="setFavAd"></span>
                                        {:IF}
                                    </h3>
                                    IF({COMPANY_ENABLE}){
                                    <h4 class="job-listing-company">{ITEM.company_name}</h4>
                                    {:IF}
                                    <div class="job-location">
                                        <i class="la la-map-marker"></i> {ITEM.cityname}
                                    </div>
                                    <div class="job-type-buttons">
                                        <div class="job-type"><i class="la la-suitcase"></i>{ITEM.product_type}</div>
                                        IF("{ITEM.salary_min}"!="0"){
                                        <div class="salary"><i class="la la-credit-card"></i> {ITEM.salary_min} - {ITEM.salary_max} {LANG_PER} {ITEM.salary_type}</div>
                                        {ELSE}
                                        {:IF}
                                    </div>
                                    <div class="job-listing-title-buttons">
                                        IF("{ITEM.featured}"=="1"){ <div class="badge"><i class="la la-hand-o-right"></i> {LANG_FEATURED}</div> {:IF}
                                        IF("{ITEM.urgent}"=="1"){ <div class="badge"><i class="la la-dashboard"></i> {LANG_URGENT}</div> {:IF}
                                        IF("{ITEM.new_status}" <= "3"){ <div class="badge"><i class="la la-bell-o"></i> {LANG_NEW}</div> {:IF}
                                    </div>
                                    <p class="job-listing-text">{ITEM.description}</p>
                                </div>
                            </div>
                            <div class="job-listing-footer">
                                <ul>
                                    <li style="margin-left: 0px;"><i class="la la-clock-o"></i> {ITEM.created_at} </li>
                                    <li>
                                        <span><i class="la la-send-o"></i><a href="{ITEM.link}">{LANG_APPLY_NOW}</a></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    {/LOOP: ITEM}
                </div>
            </div>
        </div>
        {:IF}
    </div>
</div>

<div id="apply-now-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs popup-dialog">
    <ul class="popup-tabs-nav">
        <li><a href="#tab">{LANG_APPLY_NOW}</a></li>
    </ul>
    <div class="popup-tabs-container">
        <div class="popup-tab-content" id="tab">
            IF({SHOW_APPLY_FORM}){
            <form method="post" action="" accept-charset="UTF-8" enctype="multipart/form-data">
                IF("{ERROR}"!=""){
                <span class="status-not-available">{ERROR}</span>
                {:IF}
                <div class="submit-field">
                    <h5>{LANG_MESSAGE} *</h5>
                    <textarea cols="30" rows="3" class="with-border" name="message" required=""></textarea>
                </div>
                IF({RESUME_ENABLE}){
                <div class="submit-field">
                    <h5>{LANG_RESUMES} *</h5>
                    <ul>
                        {LOOP: RESUMES}

                            <li>
                                <div class="radio">
                                    IF({NEW_RESUME} == 0){
                                    <input id="resume-{RESUMES.id}" name="resume" class="resume-file resumeUploaded" type="radio" value="{RESUMES.id}" required>
                                    <label for="resume-{RESUMES.id}"><span class="radio-label"></span> {RESUMES.name} - <a href="{SITE_URL}storage/resumes/{RESUMES.filename}" download="">{LANG_DOWNLOAD}</a></label>
                                    {ELSE}
                                    <input id="resume-{RESUMES.id}" name="resume" class="resume-file resumeUploaded" type="radio" value="{RESUMES.id}">
                                    <label for="resume-{RESUMES.id}"><span class="radio-label"></span> {RESUMES.name} - <a href="{SITE_URL}storage/resumes/{RESUMES.filename}" download="">{LANG_DOWNLOAD}</a></label>
                                    {:IF}
                                </div>
                            </li>
                        {/LOOP: RESUMES}
                        <li>
                            <div class="radio">
                                IF({NEW_RESUME} == 0){
                                <input id="resume-0" name="resume" class="new-resume resume-file" type="radio" value="0">
                                <label for="resume-0"><span class="radio-label"></span> {LANG_ADD_RESUME} </label>
                                {ELSE}
                                <input id="resume-0" name="resume" class="new-resume resume-file" type="radio" value="0" required>
                                <label for="resume-0"><span class="radio-label"></span> {LANG_ADD_RESUME} </label>
                                {:IF}
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="uploadButton resume-upload-button">
                    IF({NEW_RESUME} == 0){
                    <input class="uploadButton-input newUpload" type="file" id="resume" name="resume_file" accept=".doc,.docx,.rtf,.rtx,.pdf"  style="max-width: 300px!important" />
                    {ELSE}
                    <input class="uploadButton-input newUpload" type="file" id="resume" required name="resume_file" accept=".doc,.docx,.rtf,.rtx,.pdf" style="max-width: 300px!important" />
                    {:IF}
                    <label class="uploadButton-button ripple-effect" for="resume">{LANG_UPLOAD_RESUME}</label>
                    <span class="uploadButton-file-name">{LANG_RESUME_FILE_TYPE}</span>
                </div>
                {:IF}
                <button class="button margin-top-35 full-width button-sliding-icon ripple-effect applynow" name="submit" type="submit">{LANG_APPLY_NOW} <i class="icon-feather-arrow-right"></i></button>
            </form>
            {ELSE}
            <h2 class="margin-bottom-20">{LANG_NOTIFY}</h2>
            <p>{LANG_EMAIL_VERIFY_MSG}</p>
            {:IF}
        </div>
    </div>
</div>
<script>


    const files = await window.showOpenFilePicker({

        types: [
            {
                description: 'Upload Resume Related Files Only',
                accept: {
                    'documents/*': ['.doc','.docx','.rtf','.rtx','.pdf'],//Extensions you want to allow
                },
            },
        ],
        excludeAcceptAllOption: true, // this hides all files option
        multiple: false,
    });

    $('#resume-0').prop('checked', false);

    $('.resume-file').on('change',function(){
        if($('.new-resume').is(':checked')){
            $('#resumeUploaded').attr('required',false);
            $('#resume').attr('required',true);
            $('.resume-upload-button').slideDown('fast');
        }else{
            $('#resumeUploaded').attr('required',true);
            $('#resume').attr('required',false);
            $('.resume-upload-button').slideUp('fast');
        }
    });
    $('.resume-file').trigger('change');

    IF("{ERROR}"!=""){
        $(window).on('load',function () {
            $('.apply-dialog-button').trigger('click');
        });
    {:IF}
</script>

IF("{MAP_TYPE}"=="google"){
<link href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
<script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2Tmayfj85C0-rYfZuzxFPVmCx4_VAwiM"></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
<script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>
<script>
    var _latitude = '{ITEM_LAT}';
    var _longitude = '{ITEM_LONG}';
    var element = "singleListingMap";
    var path = '{SITE_URL}templates/{TPL_NAME}/';
    var getCity = false;
    var color = '{MAP_COLOR}';
    var site_url = '{SITE_URL}';
    simpleMap(_latitude, _longitude, element);
    //Share from Mobile view
    $('#answer-example-share-button').on('click', () => {
        if (navigator.share) {
            navigator.share({
                title: '{ITEM_TITLE}',
                text: '{LANG_JOB_OVERVIEW}',
                url: '{ITEM.link}',
            })
                .then(() => console.log('Successful share'))
                .catch((error) => console.log('Error sharing', error));
        } else {
            console.log('Share not supported on this browser, do it the old way.');
        }
    });

    
    
    
    
//     function initMap() {
//   var myLatLng = {
//     lat: 43.6222102,
//     lng: -79.6694881
//   };

//   var map = new google.maps.Map(document.getElementById('singleListingMap'), {
//     zoom: 15,
//     center: myLatLng
//   });

//   var marker = new google.maps.Marker({
//     position: myLatLng,
//     map: map,
//   });
// }
// google.maps.event.addDomListener(window, 'load', initMap);



// function dummy() {}
// window.dummy=dummy;
</script>

{ELSE}
<script>
    var openstreet_access_token = '{OPENSTREET_ACCESS_TOKEN}';
</script>
<link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/css/style.css">
<!-- Leaflet // Docs: https://leafletjs.com/ -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet.min.js"></script>
<!-- Leaflet Maps Scripts (locations are stored in leaflet-quick.js) -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-markercluster.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-gesture-handling.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-quick.js"></script>
<!-- Leaflet Geocoder + Search Autocomplete // Docs: https://github.com/perliedman/leaflet-control-geocoder -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-autocomplete.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/map/openstreet/leaflet-control-geocoder.js"></script>
{:IF}
{OVERALL_FOOTER}
