{OVERALL_HEADER}  
<link rel="stylesheet" href="https://cdn.tutorialjinni.com/intl-tel-input/17.0.8/css/intlTelInput.css"/>
<style>
    #footer {
        width: 100%; 
        position: absolute; 
        bottom: -100px !important;
    }
    .social-login-buttons .google-login {
   border-color: #3b5998;
    color: #3b5998;
}
.social-login-buttons .google-login:hover {
        border-color: #3b5998;
    background-color: #3b5998;
}

    
    @media (max-width: 767px) {
        #footer {
            bottom: -200px !important;
        }

    }
</style>
<script src="https://cdn.tutorialjinni.com/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>{LANG_REGISTER}</h2>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_REGISTER}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xl-5 margin-0-auto">
            <div class="login-register-page">
                <!-- Welcome Text -->
                <div class="welcome-text">
                    <h3 style="font-size: 26px;">{LANG_LETS_CREATE_ACC}</h3>
                    <span>{LANG_ALREADY_HAVE_ACC} <a href="{LINK_LOGIN}">{LANG_LOGIN!}</a></span>
                </div>
                   <div class="social-login-buttons">
                    <button class="facebook-login ripple-effect" onclick="fblogin(2)"><i class="fa fa-facebook"></i> {LANG_LOGIN_VIA_FACEBOOK}
                    </button>
                    <button class="google-login ripple-effect" onclick="gmlogin(2)"><i class="fa fa-google"></i> {LANG_LOGIN_VIA_GOOGLE}
                    </button>
                </div>
                <div class="social-login-separator"><span>{LANG_OR}</span></div>
                <form method="post" id="register-account-form" action="" accept-charset="UTF-8">
                    <!-- Account Type -->
                    <div class="account-type">
                        <div>
                            <input type="radio" name="user-type" id="freelancer-radio" class="account-type-radio user-type-rd" value="1" checked/>
                            <label for="freelancer-radio" class="ripple-effect-dark"><i class="la la-user"></i> {LANG_JOB_SEEKER}</label>
                        </div>
                        <div>
                            <input type="radio" name="user-type" id="employer-radio" class="account-type-radio user-type-rd" value="2" />
                            <label for="employer-radio" class="ripple-effect-dark"><i class="la la-suitcase"></i> {LANG_EMPLOYER}</label>
                        </div>
                    </div>
                    <span id="type-status">IF("{TYPE_ERROR}"!=""){ {TYPE_ERROR} {:IF}</span>                
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-user"></i>
                            <input type="text" class="input-text with-border" placeholder="First Name" value="{NAME_FIELD}" id="name" name="name" onBlur="checkAvailabilityName()" required/>
                        </div>
                        <span id="name-availability-status">IF("{NAME_ERROR}"!=""){ {NAME_ERROR} {:IF}</span>
                    </div>
                    <!--<div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-user"></i>
                            <input type="text" class="input-text with-border" placeholder="{LANG_USERNAME}" value="{USERNAME_FIELD}" id="Rusername" name="username" onBlur="checkAvailabilityUsername()" required/>
                        </div>
                        <span id="user-availability-status">IF("{USERNAME_ERROR}"!=""){ {USERNAME_ERROR} {:IF}</span>
                    </div> -->
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-envelope"></i>
                            <input type="text" class="input-text with-border" placeholder="{LANG_EMAIL}" value="{EMAIL_FIELD}" name="email" id="email" onBlur="checkAvailabilityEmail()" required/>
                        </div>
                        <span id="email-availability-status">IF("{EMAIL_ERROR}"!=""){ {EMAIL_ERROR} {:IF}</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-unlock"></i>
                            <input type="password" class="input-text with-border" placeholder="{LANG_PASSWORD}" id="Rpassword" name="password" onBlur="checkAvailabilityPassword()" required/>
                        </div>
                        <span id="password-availability-status">IF("{PASSWORD_ERROR}"!=""){ {PASSWORD_ERROR} {:IF}</span>
                    </div>
                      
                     <div class="form-group" id="otp-section" style="display:block !important">
                        <div class="input-with-icon-left">
                            <i class="la la-phone"></i>
                            <input type="text" class="input-text with-border" placeholder="Phone" id="phone" name="phone" onBlur=""/>
                            <input type="hidden" id="uphone" name="uphone"/>

                            <input type="button" id="otp-dialog" class="button btn-verify" value="Verify" />
                        </div>
                        <span class="number_not" style="margin-top:5px:text-align:center;font-size:14px;"> Please Verify Your Number.</span>
                    </div>
                  
                 <div class="checkbox">
                            <input type="checkbox" id="agree_for_term" name="agree_for_term" value="1" required>
                            <label for="agree_for_term" Style="height: 3.5rem;white-space: normal;" ><span class="checkbox-icon"></span> {LANG_BY_CLICK_REGISTER} </label>
                        </div> 
                        <button class="button full-width button-sliding-icon ripple-effect margin-top-10" id='signupbtn' name="submit" type="submit">{LANG_REGISTER} <i class="icon-feather-arrow-right"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="margin-top-70"></div>
<!-- otp In Popup -->

<div id="otp-in-dialog" class="mfp-wrap mfp-close-btn-in mfp-auto-cursor mfp-align-top my-mfp-zoom-in mfp-ready"
     tabindex="-1" style="display: none">
    <div class="mfp-container mfp-inline-holder">
        <div class="mfp-content">
            <div class="zoom-anim-dialog dialog-with-tabs popup-dialog">
                <ul class="popup-tabs-nav" style="pointer-events: none;">
                    <li class="active"><a href="#exist_acc">JOBTOTOP OTP Verification Code</a></li>
                </ul>
                <div class="popup-tabs-container">
                    <div class="popup-tab-content" id="exist_acc" style="">
                        <p>OTP code has been sent to your mobile.</p>
                         <div class="alert alert-danger error_otp" style="text-align:center;display:none;"> Incorrect OTP Please Enter Valid a Code</div>
                        <form action="" class="mt-5">
                            <input class="otp" required type="number" id="0" maxlength="1">
                            <input class="otp" required type="number" id="1" maxlength="1">
                            <input class="otp" required type="number" id="2" maxlength="1">
                            <input class="otp" required type="number" id="3" maxlength="1">
                            <input class="otp" required type="number" id="4" maxlength="1">
                            <input class="otp" required type="number" id="5" maxlength="1">
                        </form>
                                                <style>
@media only screen and (max-width: 550px) {
  #otpbtn {
    margin-left: 35%;
  }
}
</style>
                        <button type="submit" id="otpbtn" class='btn btn-primary btn-block mt-4 mb-4 customBtn' style="margin-bottom:20px; margin-left:37%;">Verify</button>
                        
                    </div>
                </div>
                <button type="button" class="mfp-close"></button>
            </div>
        </div>
    </div>
    <div class="mfp-bg my-mfp-zoom-in mfp-ready"></div>
</div>
<!--End of OTP-->
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
$(function() {
    var input = document.querySelector("#phone");
    window.intlTelInput(input, {
        separateDialCode: true,
        //Default country
        initialCountry:"ae"
    });
    $('.account-type-radio').click(function() {
        var usertype = $("input[name='user-type']:checked").val();
    
        // if(usertype=='1'){
        //     document.getElementById('otp-section').style.display = 'none';
        //     $('#phone').removeAttr('required');
        //     // document.getElementById('otp-section').style.display = 'block';
        //     // $('#phone').attr("required", "true");
        // }
        // else{
        //     document.getElementById('otp-section').style.display = 'block';
        //     $('#phone').attr("required", "true");
        // }
    });
    //OTP code
    var elts = document.getElementsByClassName('otp')
    Array.from(elts).forEach(function(elt){
        elt.addEventListener("keyup", function(event) {
            // Number 13 is the "Enter" key on the keyboard
            if (event.keyCode === 13 || elt.value.length == 1) {
                // Focus on the next sibling
                elt.nextElementSibling.focus()
            }
        });
    })
    
    
     function checkAvailabilityOTP() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'password=' + $("#phone").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#phone").removeClass('has-success');
                    $("#phone-availability-status").html(data);
                    $("#phone").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#phone").removeClass('has-error mar-zero');
                    $("#phone-availability-status").html("");
                    $("#phone").addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    $('body').on('click', '#otp-dialog', function () {
        let code = $(".iti__selected-dial-code").text();
        let pval = $("#phone").val();
        let cphone = code + pval;

        if(pval == '')
        {
            alert('please enter phone');
            return false;
        }
        
        jQuery.ajax({
            url: "{APP_URL}send-otp.php",
            data: 'phone=' + cphone,
            type: "POST",
            success: function (data) {
                $('#otp-in-dialog').css('display', 'block');
            },
            error: function () {
            }
        });

    });
    $('body').on('click', '.mfp-close', function () {
        $('#otp-in-dialog').css('display', 'none');
    });
    $('body').on('click', '#otpbtn', function () {
        
        let form_otp1 = $("#0").val();
        let form_otp2 = $("#1").val();
        let form_otp3 = $("#2").val();
        let form_otp4 = $("#3").val();
        let form_otp5 = $("#4").val();
        let form_otp6 = $("#5").val();
        
        let full_otp = form_otp1 + form_otp2 + form_otp3 +form_otp4 +form_otp5 +form_otp6;
             console.log(full_otp);
            jQuery.ajax({
            url: "{APP_URL}verify-otp.php",
            // data: 'OTP=' + full_otp,
            data: {otp: full_otp},
            type: "POST",
            success: function (data) {
                console.log(data);
                if(data == 1){
                       $('#otp-in-dialog').css('display', 'none');
                        // $('#otp-dialog').val('Verified');
                        $('#otp-dialog').replaceWith('<input type="button" id="otp-dialog" class="button btn-verify" value="Verified" disabled="disabled" style="background-color: #03d703;">');
                        $('#otp-dialog').attr("disabled",true);
                        $('#phone').attr("readonly",true);
                        var ccode =$('.iti__selected-dial-code').text();
                        var phone = $('#phone').val();
                        $('#uphone').val(ccode+phone);
                        localStorage.setItem("verify", 1);
                         $(".error_otp").css("display","block");
                         $(".error_otp").html("Your Phone Number Verified")
                          $(".number_not").css("display","none");
                    
                }else{
                    
                    $(".error_otp").css("display","block");
                }
            },
            error: function () {
            }
        });
     

    });

    //end of otp code
    if ($('#agree_for_term').is(':checked')) {
            //alert('Checked');
            $('#agree_for_term').next().css("color", 'black');
        }
    $('#signupbtn').click(function() {
         
         var x = localStorage.getItem("verify"); 
         
          if(x == 1){
               
              localStorage.removeItem("verify");
          }else{
               
                 $(".number_not").css("display","block","color","#ea5252", "backgroundColor", "#ffe6e6");
              return false;
          }
        
        if ($('#agree_for_term').is(':checked')) {
            //alert('Checked');
            $('#agree_for_term').next().css("color", 'black');
        } else {
            //$('#agree_for_term').css('color', 'red');
            $('#agree_for_term').next().css("color", 'red');
            alert('NOT CHECKED');
        }
        
        
    });
});
    var error = "";

    function checkAvailabilityName() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'name=' + $("#name").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#name").removeClass('has-success');
                    $("#name-availability-status").html(data);
                    $("#name").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#name").removeClass('has-error mar-zero');
                    $("#name-availability-status").html("");
                    $("#name").addClass('has-success');

                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    function checkAvailabilityUsername() {
        var $item = $("#Rusername").closest('.form-group');
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'username=' + $("#Rusername").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $item.removeClass('has-success');
                    $("#user-availability-status").html(data);
                    $item.addClass('has-error');
                }
                else {
                    error = 0;
                    $item.removeClass('has-error');
                    $("#user-availability-status").html("");
                    $item.addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    function checkAvailabilityEmail() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'email=' + $("#email").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#email").removeClass('has-success');
                    $("#email-availability-status").html(data);
                    $("#email").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#email").removeClass('has-error mar-zero');
                    $("#email-availability-status").html("");
                    $("#email").addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }
    function checkAvailabilityPassword() {
        $("#loaderIcon").show();
        jQuery.ajax({
            url: "{APP_URL}check_availability.php",
            data: 'password=' + $("#Rpassword").val(),
            type: "POST",
            success: function (data) {
                if (data != "success") {
                    error = 1;
                    $("#Rpassword").removeClass('has-success');
                    $("#password-availability-status").html(data);
                    $("#Rpassword").addClass('has-error mar-zero');
                }
                else {
                    error = 0;
                    $("#Rpassword").removeClass('has-error mar-zero');
                    $("#password-availability-status").html("");
                    $("#Rpassword").addClass('has-success');
                }
                $("#loaderIcon").hide();
            },
            error: function () {
            }
        });
    }

</script>
{OVERALL_FOOTER}
