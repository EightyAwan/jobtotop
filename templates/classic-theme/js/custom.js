(function ($) {
    $(document).ready(function () {
        // Mobile menu
        $(function () {
            function mmenuInit() {
                $(".mmenu-init").mmenu({"counters": true}, {offCanvas: {pageNodetype: "#wrapper"}});
                var mmenuAPI = $(".mmenu-init").data("mmenu");
                var $icon = $(".mmenu-trigger .hamburger");
                $(".mmenu-trigger").on('click', function () {
                    mmenuAPI.open();
                });
                $(".mm-next").addClass("mm-fullsubopen");
            }

            mmenuInit();
        });

        // Back to top
        function backToTop() {
            $('body').append('<div id="backtotop"><a href="#"></a></div>');
        }

        backToTop();
        var pxShow = 600;
        var scrollSpeed = 500;
        $(window).scroll(function () {
            if ($(window).scrollTop() >= pxShow) {
                $("#backtotop").addClass('visible');
            } else {
                $("#backtotop").removeClass('visible');
            }
        });
        $('#backtotop a').on('click', function () {
            $('html, body').animate({scrollTop: 0}, scrollSpeed);
            return false;
        });

        // Ripple effect
        $('.ripple-effect, .ripple-effect-dark').on('click', function (e) {
            var rippleDiv = $('<span class="ripple-overlay">'), rippleOffset = $(this).offset(), rippleY = e.pageY - rippleOffset.top, rippleX = e.pageX - rippleOffset.left;
            rippleDiv.css({
                top: rippleY - (rippleDiv.height() / 2),
                left: rippleX - (rippleDiv.width() / 2),
            }).appendTo($(this));
            window.setTimeout(function () {
                rippleDiv.remove();
            }, 800);
        });

        $(".switch, .radio").each(function () {
            var intElem = $(this);
            intElem.on('click', function () {
                intElem.addClass('interactive-effect');
                setTimeout(function () {
                    intElem.removeClass('interactive-effect');
                }, 400);
            });
        });

        tippy('[data-tippy-placement]', {
            delay: 100,
            arrow: true,
            arrowType: 'sharp',
            size: 'regular',
            duration: 200,
            animation: 'shift-away',
            animateFill: true,
            theme: 'dark',
            distance: 10,
            dynamicTitle: true
        });

        $(window).on('load', function () {
            $(".button.button-sliding-icon").each(function () {
                var buttonWidth = $(this).outerWidth() + 30;
                $(this).css('width', buttonWidth);
            });
        });



        $("a.close").removeAttr("href").on('click', function () {
            function slideFade(elem) {
                var fadeOut = {opacity: 0, transition: 'opacity 0.5s'};
                elem.css(fadeOut).slideUp();
            }
            slideFade($(this).parent());
        });

        $(".header-notifications").each(function () {
            var userMenu = $(this);
            var userMenuTrigger = $(this).find('.header-notifications-trigger a');
            $(userMenuTrigger).on('click', function (event) {
                event.preventDefault();
                if ($(this).closest(".header-notifications").is(".active")) {
                    close_user_dropdown();
                } else {
                    close_user_dropdown();
                    userMenu.addClass('active');
                }
            });
        });
        function close_user_dropdown() {
            $('.header-notifications').removeClass("active");
        }

        var mouse_is_inside = false;
        $(".header-notifications").on("mouseenter", function () {
            mouse_is_inside = true;
        });
        $(".header-notifications").on("mouseleave", function () {
            mouse_is_inside = false;
        });
        $("body").mouseup(function () {
            if (!mouse_is_inside) close_user_dropdown();
        });
        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                close_user_dropdown();
            }
        });

        // advance search toggle
        $('.enable-filters-button').on('change', function () {
            $('.sidebar-container').slideToggle();
            $(this).toggleClass("active");
        });

        function avatarSwitcher() {
            var readURL = function (input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('.profile-pic').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            };
            $(".file-upload").on('change', function () {
                readURL(this);
            });
            $(".upload-button").on('click', function () {
                $(".file-upload").click();
            });
        }
        avatarSwitcher();

        $('.dashboard-nav ul li a').on('click', function (e) {
            if ($(this).closest("li").children("ul").length) {
                if ($(this).closest("li").is(".active-submenu")) {
                    $('.dashboard-nav ul li').removeClass('active-submenu');
                } else {
                    $('.dashboard-nav ul li').removeClass('active-submenu');
                    $(this).parent('li').addClass('active-submenu');
                }
                e.preventDefault();
            }
        });
        $('.dashboard-responsive-nav-trigger').on('click', function (e) {
            e.preventDefault();
            $(this).toggleClass('active');
            var dashboardNavContainer = $('body').find(".dashboard-nav");
            if ($(this).hasClass('active')) {
                $(dashboardNavContainer).addClass('active');
            } else {
                $(dashboardNavContainer).removeClass('active');
            }
            $('.dashboard-responsive-nav-trigger .hamburger').toggleClass('is-active');
        });


        function starRating(ratingElem) {
            $(ratingElem).each(function () {
                var dataRating = $(this).attr('data-rating');

                function starsOutput(firstStar, secondStar, thirdStar, fourthStar, fifthStar) {
                    return ('' +
                    '<span class="' + firstStar + '"></span>' +
                    '<span class="' + secondStar + '"></span>' +
                    '<span class="' + thirdStar + '"></span>' +
                    '<span class="' + fourthStar + '"></span>' +
                    '<span class="' + fifthStar + '"></span>');
                }

                var fiveStars = starsOutput('star', 'star', 'star', 'star', 'star');
                var fourHalfStars = starsOutput('star', 'star', 'star', 'star', 'star half');
                var fourStars = starsOutput('star', 'star', 'star', 'star', 'star empty');
                var threeHalfStars = starsOutput('star', 'star', 'star', 'star half', 'star empty');
                var threeStars = starsOutput('star', 'star', 'star', 'star empty', 'star empty');
                var twoHalfStars = starsOutput('star', 'star', 'star half', 'star empty', 'star empty');
                var twoStars = starsOutput('star', 'star', 'star empty', 'star empty', 'star empty');
                var oneHalfStar = starsOutput('star', 'star half', 'star empty', 'star empty', 'star empty');
                var oneStar = starsOutput('star', 'star empty', 'star empty', 'star empty', 'star empty');
                if (dataRating >= 4.75) {
                    $(this).append(fiveStars);
                } else if (dataRating >= 4.25) {
                    $(this).append(fourHalfStars);
                } else if (dataRating >= 3.75) {
                    $(this).append(fourStars);
                } else if (dataRating >= 3.25) {
                    $(this).append(threeHalfStars);
                } else if (dataRating >= 2.75) {
                    $(this).append(threeStars);
                } else if (dataRating >= 2.25) {
                    $(this).append(twoHalfStars);
                } else if (dataRating >= 1.75) {
                    $(this).append(twoStars);
                } else if (dataRating >= 1.25) {
                    $(this).append(oneHalfStar);
                } else if (dataRating < 1.25) {
                    $(this).append(oneStar);
                }
            });
        }
        starRating('.star-rating');

        if ($("body").hasClass("rtl")) var rtl = true;
        else rtl = false;

        // testimonial carousel
        $('.single-carousel').slick({
            centerMode: true,
            centerPadding: '0',
            slidesToShow: 1,
            dots: true,
            arrows: false,
            adaptiveHeight: true,
            autoplay: true,
            rtl: rtl
        });
        $('.testimonial-carousel').slick({
            centerMode: true,
            centerPadding: '30%',
            slidesToShow: 1,
            dots: false,
            arrows: true,
            adaptiveHeight: true,
            autoplay: true,
            rtl: rtl,
            responsive: [{breakpoint: 1600, settings: {centerPadding: '21%', slidesToShow: 1,}}, {
                breakpoint: 993,
                settings: {centerPadding: '15%', slidesToShow: 1,}
            }, {breakpoint: 769, settings: {centerPadding: '5%', dots: true, arrows: false}}]
        });

        var accordion = (function () {
            var $accordion = $('.js-accordion');
            var $accordion_header = $accordion.find('.js-accordion-header');
            var settings = {speed: 400, oneOpen: false};
            return {
                init: function ($settings) {
                    $accordion_header.on('click', function () {
                        accordion.toggle($(this));
                    });
                    $.extend(settings, $settings);
                    if (settings.oneOpen && $('.js-accordion-item.active').length > 1) {
                        $('.js-accordion-item.active:not(:first)').removeClass('active');
                    }
                    $('.js-accordion-item.active').find('> .js-accordion-body').show();
                }, toggle: function ($this) {
                    if (settings.oneOpen && $this[0] != $this.closest('.js-accordion').find('> .js-accordion-item.active > .js-accordion-header')[0]) {
                        $this.closest('.js-accordion').find('> .js-accordion-item').removeClass('active').find('.js-accordion-body').slideUp();
                    }
                    $this.closest('.js-accordion-item').toggleClass('active');
                    $this.next().stop().slideToggle(settings.speed);
                }
            };
        })();
        accordion.init({speed: 400, oneOpen: true});

        $(window).on('load resize', function () {
            if ($(".tabs")[0]) {
                $('.tabs').each(function () {
                    var thisTab = $(this);
                    var activePos = thisTab.find('.tabs-header .active').position();

                    function changePos() {
                        activePos = thisTab.find('.tabs-header .active').position();
                        thisTab.find('.tab-hover').stop().css({
                            left: activePos.left,
                            width: thisTab.find('.tabs-header .active').width()
                        });
                    }

                    changePos();
                    var tabHeight = thisTab.find('.tab.active').outerHeight();

                    function animateTabHeight() {
                        tabHeight = thisTab.find('.tab.active').outerHeight();
                        thisTab.find('.tabs-content').stop().css({height: tabHeight + 'px'});
                    }

                    animateTabHeight();
                    function changeTab() {
                        var getTabId = thisTab.find('.tabs-header .active a').attr('data-tab-id');
                        thisTab.find('.tab').stop().fadeOut(300, function () {
                            $(this).removeClass('active');
                        }).hide();
                        thisTab.find('.tab[data-tab-id=' + getTabId + ']').stop().fadeIn(300, function () {
                            $(this).addClass('active');
                            animateTabHeight();
                        });
                    }

                    thisTab.find('.tabs-header a').on('click', function (e) {
                        e.preventDefault();
                        var tabId = $(this).attr('data-tab-id');
                        thisTab.find('.tabs-header a').stop().parent().removeClass('active');
                        $(this).stop().parent().addClass('active');
                        changePos();
                        tabCurrentItem = tabItems.filter('.active');
                        thisTab.find('.tab').stop().fadeOut(300, function () {
                            $(this).removeClass('active');
                        }).hide();
                        thisTab.find('.tab[data-tab-id="' + tabId + '"]').stop().fadeIn(300, function () {
                            $(this).addClass('active');
                            animateTabHeight();
                        });
                    });
                    var tabItems = thisTab.find('.tabs-header ul li');
                    var tabCurrentItem = tabItems.filter('.active');
                    thisTab.find('.tab-next').on('click', function (e) {
                        e.preventDefault();
                        var nextItem = tabCurrentItem.next();
                        tabCurrentItem.removeClass('active');
                        if (nextItem.length) {
                            tabCurrentItem = nextItem.addClass('active');
                        } else {
                            tabCurrentItem = tabItems.first().addClass('active');
                        }
                        changePos();
                        changeTab();
                    });
                    thisTab.find('.tab-prev').on('click', function (e) {
                        e.preventDefault();
                        var prevItem = tabCurrentItem.prev();
                        tabCurrentItem.removeClass('active');
                        if (prevItem.length) {
                            tabCurrentItem = prevItem.addClass('active');
                        } else {
                            tabCurrentItem = tabItems.last().addClass('active');
                        }
                        changePos();
                        changeTab();
                    });
                });
            }
        });

        var radios = document.querySelectorAll('.payment-tab-trigger > input');
        for (var i = 0; i < radios.length; i++) {
            radios[i].addEventListener('change', expandAccordion);
        }
        function expandAccordion(event) {
            var tabber = this.closest('.payment');
            var allTabs = tabber.querySelectorAll('.payment-tab');
            for (var i = 0; i < allTabs.length; i++) {
                allTabs[i].classList.remove('payment-tab-active');
            }
            event.target.parentNode.parentNode.classList.add('payment-tab-active');
        }

        $('.billing-cycle-radios').on("click", function () {
            if ($('.billed-yearly-radio input').is(':checked')) {
                $('.pricing-plans-container').addClass('billed-yearly');
            }
            if ($('.billed-monthly-radio input').is(':checked')) {
                $('.pricing-plans-container').removeClass('billed-yearly');
            }
        });
        function qtySum() {
            var arr = document.getElementsByName('qtyInput');
            var tot = 0;
            for (var i = 0; i < arr.length; i++) {
                if (parseInt(arr[i].value))
                    tot += parseInt(arr[i].value);
            }
        }

        qtySum();
        $(".qtyDec, .qtyInc").on("click", function () {
            var $button = $(this);
            var oldValue = $button.parent().find("input").val();
            if ($button.hasClass('qtyInc')) {
                $button.parent().find("input").val(parseFloat(oldValue) + 1);
            } else {
                if (oldValue > 1) {
                    $button.parent().find("input").val(parseFloat(oldValue) - 1);
                } else {
                    $button.parent().find("input").val(1);
                }
            }
            qtySum();
            $(".qtyTotal").addClass("rotate-x");
        });

        function inlineBG() {
            $(".single-page-header, .intro-banner").each(function () {
                var attrImageBG = $(this).attr('data-background-image');
                if (attrImageBG !== undefined) {
                    $(this).append('<div class="background-image-container"></div>');
                    $('.background-image-container').css('background-image', 'url(' + attrImageBG + ')');
                }
            });
        }
        inlineBG();

        $(".intro-search-field").each(function () {
            var bannerLabel = $(this).children("label").length;
            if (bannerLabel > 0) {
                $(this).addClass("with-label");
            }
        });
        $(".photo-box, .photo-section, .video-container").each(function () {
            var photoBox = $(this);
            var photoBoxBG = $(this).attr('data-background-image');
            if (photoBox !== undefined) {
                $(this).css('background-image', 'url(' + photoBoxBG + ')');
            }
        });

        $(".share-buttons-icons a").each(function () {
            var buttonBG = $(this).attr("data-button-color");
            if (buttonBG !== undefined) {
                $(this).css('background-color', buttonBG);
            }
        });
        var $tabsNav = $('.popup-tabs-nav'), $tabsNavLis = $tabsNav.children('li');
        $tabsNav.each(function () {
            var $this = $(this);
            $this.next().children('.popup-tab-content').stop(true, true).hide().first().show();
            $this.children('li').first().addClass('active').stop(true, true).show();
        });
        $tabsNavLis.on('click', function (e) {
            var $this = $(this);
            $this.siblings().removeClass('active').end().addClass('active');
            $this.parent().next().children('.popup-tab-content').stop(true, true).hide().siblings($this.find('a').attr('href')).fadeIn();
            e.preventDefault();
        });

        var hash = window.location.hash;
        var anchor = $('.tabs-nav a[href="' + hash + '"]');
        if (anchor.length === 0) {
            $(".popup-tabs-nav li:first").addClass("active").show();
            $(".popup-tab-content:first").show();
        } else {
            anchor.parent('li').click();
        }
        $('.popup-tabs-nav').each(function () {
            var listCount = $(this).find("li").length;
            if (listCount < 2) {
                $(this).css({'pointer-events': 'none'});
            }
        });
        $('.indicator-bar').each(function () {
            var indicatorLenght = $(this).attr('data-indicator-percentage');
            $(this).find("span").css({width: indicatorLenght + "%"});
        });


        var uploadButton = {$button: $('.uploadButton-input'), $nameField: $('.uploadButton-file-name')};
        uploadButton.$button.on('change', function () {
            _populateFileField($(this));
        });
        function _populateFileField($button) {
            var selectedFile = [];
            for (var i = 0; i < $button.get(0).files.length; ++i) {
                selectedFile.push($button.get(0).files[i].name + '<br>');
            }
            uploadButton.$nameField.html(selectedFile);
        }

        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

        $('.mfp-image').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            mainClass: 'mfp-fade',
            image: {verticalFit: true}
        });

        $(document).on('click', '[data-toggle="tab"]', function (e) {
            e.preventDefault();
            var id = $(this).attr('href');
            id = id.replace('#', '');
            var parent = $(this).parents('.smiley-panel');
            $(parent).find('.tab-content .tab-pane').removeClass('active in');
            $(parent).find('.tab-content .tab-pane#' + id).addClass('active in');
            $(parent).find('.menu-item').removeClass('active');
            $(this).parents('li').addClass('active');
        });
    });

    $(document).on('keyup', '#country-modal-search', function () {
        var searchTerm = $(this).val().toLowerCase();
            $('#countries').find('li').each(function () {
                if ($(this).filter(function() {
                        return $(this).attr('data-name').toLowerCase().indexOf(searchTerm) > -1;
                    }).length > 0 || searchTerm.length < 1) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
    });

    // hide long paragraph and add read more link
    $(".read-more-toggle").each(function () {
        if (($(this).innerHeight() - 90) > 20) {
            $(this).addClass('read-more-hidden');
            $(this).parent().append('<a href="javascript:void(0);" class="read-more-text">'+$(this).data('read-more')+'</a>');
        }
    });
    $(".read-more-text").on('click', function () {
        var $item = $(this).parent().find('.read-more-toggle');
        if ($item.hasClass('is-expanded')) {
            $(this).html($item.data('read-more'));
            $item.removeClass('is-expanded');
        } else {
            $(this).html($item.data('read-less'));
            $item.addClass('is-expanded');
        }
    });


    // cookie consent
    if (localStorage.getItem('Quick-cookie') != '1') {
        $('.cookieConsentContainer').delay(2000).fadeIn();
    }
    $('.cookieAcceptButton').on('click',function() {
        localStorage.setItem('Quick-cookie','1');
        $('.cookieConsentContainer').fadeOut();
    });




})(this.jQuery);

var w = screen.width - (screen.width*25/100);
var h = screen.height - (screen.height*25/100);
var left = (screen.width / 2) - (w / 2);
var top = (screen.height / 2) - (h / 2);


function fblogin(RequestType = 1) {
    var userType = parseInt($("input:radio.user-type-rd:checked").val());
    if(isNaN(userType)){
        userType = null;
    }
    console.log('RequestType',RequestType, userType);
    var newWin = window.open(siteurl + "includes/social_login/facebook/index.php?request_type="+RequestType+"&userType="+userType, "fblogin", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no,display=popup, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
}

function gmlogin(RequestType = 1) {
    var userType = parseInt($("input:radio.user-type-rd:checked").val());
    if(isNaN(userType)){
        userType = null;
    }
    var newWin = window.open(siteurl + "includes/social_login/google/index.php?request_type="+RequestType+"&userType="+userType, "gmlogin", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
    
}
