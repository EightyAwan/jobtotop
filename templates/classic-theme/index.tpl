{OVERALL_HEADER} <style>
    .mbi {
        margin-bottom: 0px !important;
    }

    .mts {
        margin-top: 16px !important;
    }
    
</style><a class="popup-with-zoom-anim hidden" href="#citiesModal" id="change-city">city</a>
<div class="zoom-anim-dialog mfp-hide popup-dialog big-dialog" id="citiesModal">
    <div class="popup-tab-content padding-0">
        <div class="quick-states" id="country-popup" data-country-id="{DEFAULT_COUNTRY_ID}" style="display: block;">
            <div id="regionSearchBox" class="title clr">
                <div class="clr">
                    <div class="locationrequest smallBox br5 col-sm-4">
                        <div class="rel input-container">
                            <div class="input-with-icon"> <input id="inputStateCity" class="with-border" type="text"
                                    placeholder="{LANG_TYPE_YOUR_CITY}"> <i class="la la-map-marker"></i> </div>
                            <div id="searchDisplay"></div>
                            <div class="suggest bottom abs small br3 error hidden"><span class="target abs icon"></span>
                                <p></p>
                            </div>
                        </div>
                        <div id="lastUsedCities" class="last-used binded" style="display: none;">{LANG_LAST_VISITED} <ul
                                id="last-locations-ul"> </ul>
                        </div>
                    </div> IF("{COUNTRY_TYPE}"=="multi"){ <span style="line-height: 30px;"> <span
                            class="flag flag-{USER_COUNTRY}"></span> <a href="#countryModal"
                            class="popup-with-zoom-anim">{LANG_CHANGE_COUNTRY}</a> </span> {:IF}
                </div>
            </div>
            <div class="popular-cities clr">
                <p>{LANG_POPULAR_CITIES}</p>
                <div class="list row">
                    <ul class="col-lg-12 col-md-12 popularcity"> {LOOP: POPULARCITY} {POPULARCITY.tpl} {/LOOP:
                        POPULARCITY} </ul>
                </div>
            </div>
            <div class="viewport">
                <div class="full" id="getCities">
                    <div class="col-sm-12 col-md-12 loader" style="display: none"></div>
                    <div id="results" class="animate-bottom">
                        <ul class="column cities"> {LOOP: STATELIST} {STATELIST.tpl} {/LOOP: STATELIST} </ul>
                    </div>
                </div>
                <div class="table full subregionslinks hidden" id="subregionslinks"></div>
            </div>
        </div>
    </div>
</div>

<h1 style="display:none;">JOBTOTOP</h1>

<div class="container" id="home">
    <form autocomplete="off" method="get" action="{LINK_LISTING}" accept-charset="UTF-8" role="search" id="search-main">
        <div class="row">
            <div class="col-12 col-md-5"> <label for="s"> <svg class="icon">
                        <use xlink:href="#icon-suitcase"></use>
                    </svg> {LANG_WHAT} </label>
                <div class="ac ac-what" id="ac-s"> <input id="s" style="" name="keywords" value="" class="fc aci mts"
                        type="search" placeholder="{LANG_SEARCH_FIELD}" autofocus="" data-ac="//ac.careerjet.net/ns"
                        data-target="#ac-s" data-target2="#s" data-lc="en_US" data-mhd="10" data-mhm="3"> <button
                        type="button" tabindex="-1" class="fc-clear ac-clear" data-target="#s"> <svg>
                            <use xlink:href="#icon-cross-circle-filled"></use>
                        </svg> </button> </div>
            </div>
            <div class="col-12 col-md-5"> <label for="l"> <svg class="icon">
                        <use xlink:href="#icon-location"></use>
                    </svg> {LANG_WHERE} </label>
                <div class="ac ac-where" id="ac-l"> <input id="l" name="city" value="" class="fc aci mts" type="text"
                        placeholder="{LANG_TOWN_REGION}" data-ac="//www.jobtotop.com/autocomplete" data-target="#ac-l"
                        data-target2="#l" data-loc="1" data-loctext="Use my current location"
                        data-lc="{USER_COUNTRY_LOCAL}" data-mhd="10" data-mhm="3"> <button type="button"
                        class="ac-geocode geocode" title="Use my current location" tabindex="-1" data-target="#l"> <svg
                            class="icon">
                            <use xlink:href="#icon-visor"></use>
                        </svg> <svg class="icon wait">
                            <use xlink:href="#icon-wait"></use>
                        </svg> </button> <button type="button" tabindex="-1" class="fc-clear ac-clear" data-target="#l">
                        <svg>
                            <use xlink:href="#icon-cross-circle-filled"></use>
                        </svg> </button> </div>
            </div>
            <p class="col-12 col-md-2"> <button type="submit" class="btn btn-primary btn-l"> {LANG_SEARCH} </button>
            </p>
        </div>
    </form><!--  <p class="nb hide-s hide-xs">        <strong>7,422</strong> jobs published in Pakistan   </p>  -->
    <section id="deviceWidth" class="cta row">
        <div class="col col-xs-12 col-m-6"> <a href="{LINK_RESUMES}">
                <div class="inner">
                    <h2> <!--{LANG_MY_RESUMES}-->Upload your Resume </h2>
                    <p class='mbi'>{LANG_FIND_YOUR_DREAM_JOB_WITH_JOBTOTOP}</p>
                </div> <img src="https://www.jobtotop.com/newImage/ezgif.com-gif-maker.png" class="newone" />
            </a> </div>
        <div class="col col-xs-12 col-m-6"> <a href="{LINK_POST-JOB}">
                <div class="inner">
                    <h2> {LANG_POST_JOB} </h2>
                    <p class='mbi'>{LANG_FIND_THE_PERFECT_CANDIDATE}</p>
                </div> <img src="https://www.jobtotop.com/newImage/472-4724948_post-unlimited-job-openings-icon.png"
                    class="newone secondIcon" />
            </a> </div>
    </section> IF({SHOW_FEATURED_JOBS_HOME}){<!-- Features Jobs -->
    <div class="section gray padding-top-55 padding-bottom-10 featured-section">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section-headline margin-top-0 margin-bottom-35">
                        <h3>{LANG_FEATURED_JOBS}</h3> <a href="{LINK_LISTING}"
                            class="headline-link">{LANG_BROWSE_ALL_JOBS}</a>
                    </div>
                    <div class="listings-container grid-layout margin-top-20"> {LOOP: ITEM} IF("{ITEM.featured}"=="1" && "{ITEM.urgent}"=="0"){
                   
                        <div class="job-listing IF({ITEM.highlight}){ highlight {:IF}"> <a href="{ITEM.link}">
                                <div class="job-listing-details">
                                    <div class="job-listing-description">
                                        <h3 class="job-listing-title">{ITEM.product_name}</h3> IF({COMPANY_ENABLE}){ <h4
                                            class="job-listing-company">{ITEM.company_name} </h4> {:IF} <div
                                            class="job-location"> <i class="la la-map-marker"></i> {ITEM.location}
                                        </div>
                                        <div class="job-type-buttons">
                                            <div class="job-type"><i class="la la-suitcase"></i>{ITEM.product_type}
                                            </div> IF("{ITEM.salary_min}"!="0"){ <div class="salary"><i
                                                    class="la la-credit-card"></i> {ITEM.salary_min} - {ITEM.salary_max}
                                                {LANG_PER} {ITEM.salary_type}</div> {ELSE} {:IF}
                                        </div>
                                        <div class="job-listing-title-buttons"> IF("{ITEM.featured}"=="1"){ <div
                                                class="badge custom-badge-success"><i class="la la-hand-o-right"></i>
                                                {LANG_FEATURED}</div> {:IF} IF("{ITEM.urgent}"=="1"){ <div
                                                class="badge custom-badge-danger"><i class="la la-dashboard"></i>
                                                {LANG_URGENT}</div> {:IF} IF("{ITEM.new_status}" <= "3" ){ <div
                                                class="badge"><i class="la la-bell-o"></i> {LANG_NEW}</div> {:IF}
                                    </div>
                                    <p class="job-listing-text">{ITEM.description}</p>
                                </div>
                        </div>
                        <div class="job-listing-footer">
                            <ul>
                                <li style="margin-left: 0px;"><i class="la la-clock-o"></i> {ITEM.created_at} </li>
                                <li> <span><i class="la la-send-o"></i>{LANG_APPLY_NOW}</span> </li>
                            </ul>
                        </div> </a>
                    </div> {:IF} {/LOOP: ITEM}
                </div>
            </div>
        </div>
    </div>
</div><!-- Featured Jobs / End -->{:IF}IF({SHOW_LATEST_JOBS_HOME}){<!-- Latest Jobs -->
<div class="section padding-top-65 padding-bottom-25">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section-headline margin-top-0 margin-bottom-35">
                    <h3>{LANG_LATEST_JOBS}</h3> <a href="{LINK_LISTING}"
                        class="headline-link">{LANG_BROWSE_ALL_JOBS}</a>
                </div>
                <div class="listings-container compact-list-layout margin-top-35"> {LOOP: ITEM2} <div
                        class="job-listing IF({ITEM2.highlight}){ highlight {:IF}">
                        <div class="job-listing-details">
                            <div class="job-listing-company-logo"> <img src="{SITE_URL}storage/products/{ITEM2.image}"
                                    alt="{ITEM2.product_name}"> </div>
                            <div class="job-listing-description">
                                <h3 class="job-listing-title"><a href="{ITEM2.link}">{ITEM2.product_name}</a>
                                    IF("{ITEM2.featured}"=="1"){ <div class="badge blue"> {LANG_FEATURED}</div> {:IF}
                                    IF("{ITEM2.urgent}"=="1"){ <div class="badge yellow"> {LANG_URGENT}</div> {:IF}
                                </h3>
                                <div class="job-listing-footer">
                                    <ul> IF({COMPANY_ENABLE}){ <li><i class="la la-building"></i> {ITEM2.company_name}
                                        </li> {:IF} <li><i class="la la-map-marker"></i> {ITEM2.location}</li>
                                        IF("{ITEM2.salary_min}"!="0"){ <li><i class="la la-credit-card"></i>
                                            {ITEM2.salary_min} -{ITEM2.salary_max} {LANG_PER} {ITEM2.salary_type}</li>
                                        {:IF} <li><i class="la la-clock-o"></i> {ITEM2.created_at}</li>
                                    </ul>
                                </div>
                            </div> <span class="job-type">{ITEM2.product_type}</span>
                        </div>
                    </div> {/LOOP: ITEM2} </div>
            </div>
        </div>
    </div>
</div><!-- Latest Jobs / End -->{:IF}IF({TESTIMONIALS_ENABLE} && {SHOW_TESTIMONIALS_HOME}){<div
    class="section gray padding-top-55 padding-bottom-55">
    <div class="container">
        <div class="row">
            <div class="col-xl-12"> <!-- Section Headline -->
                <div class="section-headline centered margin-top-0 margin-bottom-25">
                    <h3>{LANG_TESTIMONIALS}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="fullwidth-carousel-container margin-top-20">
        <div class="testimonial-carousel testimonials"> {LOOP: TESTIMONIALS} <div class="single-testimonial">
                <div class="single-inner style-2">
                    <div class="testimonial-content"> {TESTIMONIALS.content} </div>
                    <div class="author-info">
                        <div class="image"><img src="{SITE_URL}storage/testimonials/{TESTIMONIALS.image}"
                                alt="{TESTIMONIALS.name}"></div>
                        <h5 class="name">{TESTIMONIALS.name}</h5> <span
                            class="designation">{TESTIMONIALS.designation}</span>
                    </div>
                </div>
            </div> {/LOOP: TESTIMONIALS} </div>
    </div>
</div>{:IF}<div class="section gray padding-top-55 padding-bottom-0" style="display: none;">
    <div class="container home-companies">
        <div class="row">
            <div class="col-xl-12"> <!-- Section Headline -->
                <div class="section-headline left-side margin-top-0 margin-bottom-25">
                    <h3>{LANG_TOP_EMPLOYERS}</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="owl-carousel owl-theme">
                    <div class="item"> <a href="https://www.emiratesgroupcareers.com/" target="_blank"><img
                                src="{SITE_URL}storage/logo/companies/emirates.png" /></a> </div>
                    <div class="item"> <a
                            href="https://jobs.dubaicareers.ae/careersection/eyov4z5qhfjnsykw9q149t4es7/jobsearch.ftl?lang=en"
                            target="_blank"> <img src="{SITE_URL}storage/logo/companies/dubaimetro.png" /></a> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/alwasal.png" /> </div>
                    <div class="item"> <a href="https://careers.dubaiairports.ae/en/" target="_blank"><img
                                src="{SITE_URL}storage/logo/companies/dubaiairport.png" /></a> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/Dubaiislamicbank.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/eithad.png" /> </div>
                    <div class="item"> <a href="https://careers.flydubai.com/" target="_blank"><img
                                src="{SITE_URL}storage/logo/companies/flydubai.png" /></a> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/honda.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/jumaal.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/kfc.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/majidalfuttaim.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/mashreq.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/movenpick.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/nbd.jpg" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/rta.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/theindianschool.png" /> </div>
                    <div class="item"> <img src="{SITE_URL}storage/logo/companies/Toyta.png" /> </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</main>
<script>    var loginurl = "{LINK_LOGIN}?ref=index.php";</script>
<script type='text/javascript'
    src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/owl.carousel-category.min.js"></script>
<link href="{SITE_URL}templates/{TPL_NAME}/css/owl.post.carousel.css" type="text/css" rel="stylesheet">
IF('{COUNTRY_TYPE}'=="multi"){
<!-- <div align="right" style="position: absolute; bottom: 55px;right: 15px;">		<a href="#countryModal" class="popup-with-zoom-anim" title="{LANG_CHANGE_COUNTRY}">			<img src="{SITE_URL}templates/{TPL_NAME}/images/flags/{USER_COUNTRY}.png"/>&nbsp; {DEFAULT_COUNTRY}		</a>	</div> -->{:IF}

<script>
    $(document).ready(function () {
        $(".mmenu-trigger").click(function () {
            if ($('#mm-0').is(':visible')) {
                $('#mm-0').toggle();
            }
        });
    });
</script>
<script>
    $(document).on('submit', 'form.remember', function () {
        $("#s").attr('id', 'input-keywords').attr('name', 'keywords');
    });
    $(document).ready(function () {
        var owl = $('.owl-carousel');
        owl.owlCarousel({
            items: 8,
            loop: true,
            nav: false,
            dots: false,
            margin: 10,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplayHoverPause: false,
            responsive: {
                0: { items: 2 },
                600: { items: 4 },
                1000: { items: 8 }
            }
        });
    });

</script>
{MAIN_FOOTER}