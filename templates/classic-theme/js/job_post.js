$(document).ready(function () {
    // -------------------------------------------------------------
    //  prepare the form when the DOM is ready
    // -------------------------------------------------------------
    $('#post_job_form').on('submit', function (e) {
        e.stopPropagation();
        e.preventDefault();

        var error = 0;

        $('.quick-error').hide();
        var phone = $('#phone-contact').val();
        if(typeof(phone) !== 'undefined' && phone !== null){
            phone = $('#phone-contact').val();
        } else{
            phone = $('#phone').val();
        }
        
        if($('#company-select').val() === '' && $('#new-company').val() === ''){
            $('#comp-error').html('Please Select a Company');
            $(".comp-error-b").addClass("errorState");
            $(".new-company-error-b").addClass("errorState");
            
        }else if ($('#company-select').val() !== '' && $('#new-company').val() === ''){
            $('#comp-error').html('');
            $(".comp-error-b").removeClass("errorState");
            
        }else if ($('#company-select').val() === '' && $('#new-company').val() !== ''){
            $('#comp-error').html('Please Select a Company');
            $(".new-company-error-b").addClass("errorState");
            
        }else{
            $('#comp-error').html('');
            $(".comp-error-b").removeClass("errorState");
            $(".new-company-error-b").removeClass("errorState");
        }
        
        if($('#company-employees').val() == ''){
            $('#emp-error').html('Please Select a Employees');
            $(".emp-error-b").addClass("errorState");
            
        }else{
            $('#emp-error').html('');
            $(".emp-error-b").removeClass("errorState");
        }
        
        if($('#company-hiring-process').val() == ''){
            $('#hir-error').html('Please Select a Hiring Process');
            $(".hir-error-b").addClass("errorState");
            
        }else{
            $('#hir-error').html('');
            $(".hir-error-b").removeClass("errorState");
        }if($('#hear-about-us').val() == ''){
            $('#hear-error').html('Please Select How you hear about us?');
            $(".hear-error-b").addClass("errorState");
            
        }else{
            $('#hear-error').html('');
            $(".hear-error-b").removeClass("errorState");
        }if($('#s').val() == ''){
            $('#title-error').html('Please Select a Title');
            $(".title-error-b").addClass("errorState");
            
        }else{
            $('#title-error').html('');
            $(".title-error-b").removeClass("errorState");
        }if($('#p-desc').val() == ''){
            $('#desc-error').html('Please Type Description at least 150 Words.');
            $(".simditor").addClass("errorState");
            
        }else{
            $('#desc-error').html('');
            $(".simditor").removeClass("errorState");
        }if($('#job-type').val() == ''){
            $('#jtype-error').html('Please Select a Job type');
            $(".jtype-error-b").addClass("errorState");
            
        }else{
            $('#jtype-error').html('');
            $(".jtype-error-b").removeClass("errorState");
        }if($('#salary').val() == ''){
            $('#salary-error').html('Please Select a salary');
            $(".salary-error-b").addClass("errorState");
            
        }else{
            $('#salary-error').html('');
            $(".salary-error-b").removeClass("errorState");
        }if(phone.length < 5){
            $('#phone-error').html('Please type a phone number');
            $(".phone-error-b").addClass("errorState");
            
        }else{
            $('#phone-error').html('');
            $(".phone-error-b").removeClass("errorState");
        }if($('#jobstate').val() == 0){
            $('#state-error').html('Please Select a State');
            $(".select2 ").addClass("errorState");
            $('#city-error').html('Please Select a City');
            
        }else{
            $('#state-error').html('');
            $(".select2").removeClass("errorState");
            $('#city-error').html('');
        }
        
        
        $('.quick-custom-field').each(function() {
            var $value = $(this).val().trim();
            if($(this).data('req') && $value.length === 0){
                error = 1;
                $(this).parents('.submit-field').find('.quick-error').show();
            }
        });

        $('.quick-radioCheck').each(function() {
            var $name = $(this).data('name');
            var $value = $('[data-name="'+$name+'"]:checked').map(function () {
                return $(this).val().trim();
            }).get();
            if($(this).data('req') && $value.length === 0){
                error = 1;
                $(this).siblings('.quick-error').show();
            }
        });

        if(!error){
            post_advertise();
        }else{
            $('html, body').animate({
                scrollTop: $(".quick-error:visible:first").parents('.submit-field').offset().top
            }, 2000);
        }
        return false;
    });
});
var payment_uri = '';

function post_advertise() {
    $('#post_error').html('');
    $('#submit_job_button').addClass('button-progress').prop('disabled', true);

    // submit the form
    $('#post_job_form').ajaxSubmit(function (data) {
        data = JSON.parse(data);

        if (data.status == "error") {
            if (data["errors"].length > 0) {
                for (var i = 0; i < data["errors"].length; i++) {
                    var $message = data["errors"][i]["message"];
                    // if (i == 0) {
                    //     //$('#post_error').html('<div class="notification error">! ' + $message + '</div>');
                    //     $($message).css('outline', '2px solid red');
                    //     //alert($message);
                    // } else {
                    //     //$('#post_error .notification').append('<br>! ' + $message);
                        
                    //     $($message).css('outline', '2px solid red');
                    //     var c = $($message).css('outline', '2px solid red');
                    //     console.log(c);
                    // }
                    //'#' + 
                    
                    if($message == 'comp-name'){
                        $('#' + $message).css('border', '2px solid red');
                        $('#' + $message).css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'comp-desc'){
                        
                        $('.simditor.comp-desc').css('border', '2px solid red');
                        $('.simditor.comp-desc').css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'p-title'){
                        $('#' + $message).css('border', '2px solid red');
                        $('#' + $message).css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'p-desc'){
                        
                        $('.simditor.p-desc' + $message).css('border', '2px solid red');
                        $('.simditor.p-desc' + $message).css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'job-type'){
                        $('.' + $message).css('border', '2px solid red');
                        $('.' + $message).css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'jobcity'){
                        $('.' + $message).css('border', '2px solid red');
                        $('.' + $message).css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'full-name'){
                        $('#' + $message).css('border', '2px solid red');
                        $('#' + $message).css('border-radius', '5px');
                        console.log($message);
                    } if($message == 'user-email'){
                        $('#' + $message).css('border', '2px solid red');
                        $('#' + $message).css('border-radius', '5px');
                        console.log($message);
                    }
                }
                $('html, body').animate({
                    scrollTop: $("#post_error").offset().top
                }, 2000);
            }
            $('#submit_job_button').removeClass('button-progress').prop('disabled', false);
             //$('.errorr').addClass('errorStyle');
             
             
             
             
             
             
        }
        else if (data.status == "success") {
            $('#submit_job_button').removeClass('button-progress').prop('disabled', false);
            $('#post_ad_email_exist').fadeOut();
            $('#post_job_form').fadeOut();
            console.log(data.ad_type);
            if(data.ad_type == "package"){
                //$(".payment-confirmation-page").html(data.tpl);
            }
            //$('.payment-confirmation-page').fadeIn();
            $('html, body').animate({
                scrollTop: $(".payment-confirmation-page").offset().top
            }, 100);
            var delay = 2000;
            setTimeout(function () {
                window.location = data.redirect;
            }, delay);
        }
        else if (data.status == "email-exist") {
            if (data.user_type == "user") {
                $('#email_exists_user').show();
                $('#email_exists_login').hide();
            } else {
                $('#email_exists_user').hide();
                $('#email_exists_login').show();

                $('#post_ad_email_exist #quickad_email_already_linked').html(data.errors);
                $('#post_ad_email_exist #quickad_username_display').html(data.username);
                $('#post_ad_email_exist #quickad_email_display').html(data.email);
                $('#post_ad_email_exist #username').val(data.username);
                $('#post_ad_email_exist #email').val(data.email);
            }

            $('#post_ad_email_exist').fadeIn();
            $('#submit_job_button').removeClass('button-progress').prop('disabled', false);

        }

    });
    // return false to prevent normal browser submit and page navigation
    return false;
}

$('#post_ad_email_exist .mfp-close, #post_ad_email_exist #change-email').on('click', function (e) {
    $('#post_ad_email_exist').fadeOut();
});

$("#post_ad_email_exist #link_account").on('click', function (event) {
    $('#link_account').addClass('button-progress').prop('disabled', true);
    var action = "ajaxlogin";
    var $formData = {
        action: action,
        username: $("#username").val(),
        password: $("#password").val(),
        is_ajax: 1
    };

    $.ajax({
        type: "POST",
        url: ajaxurl,
        data: $formData,
        success: function (response) {
            if (response == "success") {
                $('#post_ad_email_exist #email_exists_success').fadeIn();
                $('#post_ad_email_exist #email_exists_error').html('').fadeOut();

                post_advertise();
            } else {
                $('#post_ad_email_exist #email_exists_error').html('<span class="status-not-available">' + response + '</span>').fadeIn();
                post_advertise();
            }
            $('#link_account').removeClass('button-progress').prop('disabled', false);
        }
    });
    return false;
});

// /* Get and Bind cities */
// $('#jobcity').select2({
//     ajax: {
//         url: ajaxurl + '?action=searchCityFromCountry',
//         dataType: 'json',
//         delay: 50,
//         data: function (params) {
//             var query = {
//                 q: params.term, /* search term */
//                 page: params.page
//             };

//             return query;
//         },
//         processResults: function (data, params) {
//             /*
//              // parse the results into the format expected by Select2
//              // since we are using custom formatting functions we do not need to
//              // alter the remote JSON data, except to indicate that infinite
//              // scrolling can be used
//              */
//             params.page = params.page || 1;

//             return {
//                 results: data.items,
//                 pagination: {
//                     more: (params.page * 10) < data.totalEntries
//                 }
//             };
//         },
//         cache: true
//     },
//     escapeMarkup: function (markup) {
//         return markup;
//     }, /* let our custom formatter work */
//     minimumInputLength: 2,
//     templateResult: function (data) {
//         return data.text;
//     },
//     templateSelection: function (data, container) {
//         return data.text;
//     }
// });

$('#jobcity').select2({
    ajax: {
        url: ajaxurl + '?action=searchCityFromCountry',
        dataType: 'json',
        delay: 50,
        data: function (params) {
            var query = {
                q: params.term, /* search term */
                state: $('#jobstate').val(),
                page: params.page
            };

            return query;
        },
        processResults: function (data, params) {

             // parse the results into the format expected by Select2
             // since we are using custom formatting functions we do not need to
             // alter the remote JSON data, except to indicate that infinite
             // scrolling can be used
             
            params.page = params.page || 1;

            return {
                results: data.items,
                pagination: {
                    more: (params.page * 10) < data.totalEntries
                }
            };
        },
        cache: true
    },
    escapeMarkup: function (markup) {
        return markup;
    }, /* let our custom formatter work */
    minimumInputLength: 0,
    templateResult: function (data) {
        return data.text;
    },
    templateSelection: function (data, container) {
        return data.text;
    }
});

$('#jobstate').select2({
    ajax: {
        url: ajaxurl + '?action=searchStateFromCountry',
        dataType: 'json',
        delay: 50,
        data: function (params) {
            var query = {
                q: params.term, /* search term */
                page: params.page
            };

            return query;
        },
        processResults: function (data, params) {
            
             // parse the results into the format expected by Select2
             // since we are using custom formatting functions we do not need to
             // alter the remote JSON data, except to indicate that infinite
             // scrolling can be used
             
            params.page = params.page || 1;

            return {
                results: data.items,
                pagination: {
                    more: (params.page * 10) < data.totalEntries
                }
            };
        },
        cache: true
    },
    escapeMarkup: function (markup) {
        return markup;
    }, /* let our custom formatter work */
    minimumInputLength: 0,
    templateResult: function (data) {
        return data.text;
    },
    templateSelection: function (data, container) {
        return data.text;
    }
});
function job_state(ctr,cityid=0){
 //   alert(cityid);
    if(cityid>0){
    $.post(ajaxurl+"?action=getCitiesFromState",
      {
        stateid:ctr.val(),
        cityid : cityid
      },
      function(data){
        $(".job-city-div").html(data);
      });
    } else {
        $.post(ajaxurl+"?action=getCitiesFromState",
        {
        stateid:ctr.val()
        },
      function(data){
        $(".job-city-div").html(data);
      });
    }
}

/*--------------------------------------
 POST SLIDER
 --------------------------------------*/
if (jQuery('#tg-dbcategoriesslider').length > 0) {

    if ($("body").hasClass("rtl")) var rtl = true;
    else rtl = false;
    var _tg_postsslider = jQuery('#tg-dbcategoriesslider');
    _tg_postsslider.owlCarousel({
        items: 4,
        nav: true,
        rtl: rtl,
        loop: false,
        dots: false,
        autoplay: false,
        dotsClass: 'tg-sliderdots',
        navClass: ['tg-prev', 'tg-next'],
        navContainerClass: 'tg-slidernav',
        navText: ['<span class="icon-chevron-left"></span>', '<span class="icon-chevron-right"></span>'],
        responsive: {
            0: {items: 2},
            640: {items: 3},
            768: {items: 4}
        }
    });
}
// -------------------------------------------------------------
//  select-main-category Change
// -------------------------------------------------------------
$('#input-catid').on('change', function () {
    $(this).addClass('selected');
    var catid = $(this).data('ajax-catid');
    $("#maincatide").removeClass('col-lg-12');
    $("#maincatide").addClass('col-lg-6');
    $('#subcatide').css("display", "inline-block");
    // $("#subcatide").removeClass('col-lg-6');
    // $("#subcatide").addClass('col-lg-6');
    var catid = $('#input-catid').val();
    var action = $(this).data('ajax-action');
    var data = {action: action, catid: catid};
    getsubcat(catid, 'getsubcatbyid', "");
    $('#input-subcatid').val('');
});
var subcatID = $('#input-subcatid').attr('data-sub-cat-id');
if(subcatID !== ''){
    var catid = $('#input-catid').val();
    getsubcat(catid, 'getsubcatbyid', subcatID);
}

// $('.select-category.post-option .tg-category').on('click', function () {
//     $('.select-category.post-option .tg-category.selected').removeClass('selected');
//     $(this).addClass('selected');
//     var catid = $(this).data('ajax-catid');
//     $('#main-category-text').html($(this).data('cat-name'));
//     $('#input-maincatid').val(catid);
//     if($(this).data('sub-cat') == 1) {
//         $('#sub-category-loader').css("visibility", "visible");
//         $("#sub_category").html('');
//         var action = $(this).data('ajax-action');
//         var data = {action: action, catid: catid};
//         getsubcat(catid, action, "");
//         $(".tg-subcategories").show();
//         $('#input-subcatid').val('');
//         $('#sub-category-text').html('--').hide();
//         $('#change-category-btn').hide();
//     }else{
//         $(".tg-subcategories").hide();
//         $('#input-subcatid').val(0);
//         $('#sub-category-text').html('--').hide();
//         $('#change-category-btn').show();
//         $('#choose-category').html(lang_edit_cat);
//         $.magnificPopup.close();
//     }

// });
// -------------------------------------------------------------
//  select-sub-category Change
// -------------------------------------------------------------
$('#sub_category').on('click', 'li', function (e) {
    e.preventDefault();
    var $item = $(this).closest('li');
    $('#sub_category li.selected').removeClass('selected active');
    $item.addClass('selected');
    var subcatid = $item.data('ajax-subcatid');
    var photoshow = $item.data('photo-show');
    var priceshow = $item.data('price-show');
    $('#input-subcatid').val(subcatid);
    $('#sub-category-text').html($item.text()).show();

    $('#change-category-btn').show();
    // -------------------------------------------------------------
    //  Get custom fields
    // -------------------------------------------------------------
    var catid = $('#input-maincatid').val();
    var action = 'getCustomFieldByCatID';
    var data = {action: action, catid: catid, subcatid: subcatid};
    $.ajax({
        type: "POST",
        url: ajaxurl + "?action=" + action,
        data: data,
        success: function (result) {
            if (result != 0) {
                $("#ResponseCustomFields").html(result);
                $('#custom-field-block').show();
                $(".selectpicker").selectpicker();
            }
            else {
                $('#custom-field-block').hide();
                $("#ResponseCustomFields").html('');
            }

        }
    });
    if (photoshow == 1) {
        $('#quickad-photo-field').show();
    } else {
        $('#quickad-photo-field').hide();
    }
    if (priceshow == 1) {
        $('#quickad-price-field').show();
    } else {
        $('#quickad-price-field').hide();
    }
    $('#choose-category').html(lang_edit_cat);
    $.magnificPopup.close();
});

// function getsubcat(catid, action, selectid) {
//     var data = {action: action, catid: catid, selectid: selectid};
//     $.ajax({
//         type: "POST",
//         url: ajaxurl + '?action=' + action,
//         data: data,
//         success: function (result) {
//             $("#sub_category").html(result);
//             $('#sub-category-loader').css("visibility", "hidden");
//         }
//     });
// }


function getsubcat(catid, action, selectid) {
    var data = {action: action, catid: catid, selectid: selectid};
    $.ajax({
        type: "POST",
        url: ajaxurl + '?action=' + action,
        data: data,
        success: function (result) {
            $("#input-subcatid").html(result);
            //$('#sub-category-loader').css("visibility", "hidden");
        }
    });
}

function fillPrice(obj, val) {
    if ($(obj).is(':checked')) {
        var a = $('#totalPrice').text();
        var c = (parseFloat(a) + parseFloat(val)).toFixed(2);
    } else {
        var a = $('#totalPrice').text();
        var c = (parseFloat(a) - parseFloat(val)).toFixed(2);
    }

    $('#ad_total_cost_container').fadeIn();
    if (c == 0) {
        $('#ad_total_cost_container').fadeOut();
    }
    $('#totalPrice').html(c);
}
