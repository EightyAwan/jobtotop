{OVERALL_HEADER}
<style>#footer{width: 100%; position: absolute; bottom: -100px !important;}
.social-login-buttons .google-login {
   border-color: #3b5998;
    color: #3b5998;
}
.social-login-buttons .google-login:hover {
        border-color: #3b5998;
    background-color: #3b5998;
}
</style>
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_LOGIN}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_LOGIN}</li>
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
                    <h3>Welcome</h3>
                    <span>{LANG_DONT_HAVE_ACCOUNT} <a href="{LINK_SIGNUP}"> &nbsp; {LANG_SIGNUP_NOW}</a></span>
                </div>
              
                <div class="social-login-buttons">
               
                    <button class="facebook-login ripple-effect" onclick="fblogin()"><i class="fa fa-facebook"></i> {LANG_LOGIN_VIA_FACEBOOK}
                    </button>
             

              
                    <button class="google-login ripple-effect" onclick="gmlogin()"><i class="fa fa-google"></i> {LANG_LOGIN_VIA_GOOGLE}
                    </button>
                 
                </div>
                <div class="social-login-separator"><span>{LANG_OR}</span></div>
               
                <!-- Form -->
                IF("{ERROR}"!=""){
                <span class='status-not-available'>{ERROR}</span>
                {:IF}
                <form method="post">
                    <div class="input-with-icon-left">
                        <i class="la la-user"></i>
                        <input type="email" class="input-text with-border" name="username" id="username"
                        placeholder="{LANG_EMAIL}" required/>
                    </div>

                    <div class="input-with-icon-left">
                        <i class="la la-unlock"></i>
                        <input type="password" class="input-text with-border" name="password" id="password"
                        placeholder="{LANG_PASSWORD}" required/>
                    </div>
                    <input type="checkbox" name="rememberme" id="check" style="width:auto; height:auto; ">
                    <caption>Keep me logged in</caption> <br>
                    <input type="hidden" name="ref" value="{REF}"/>
                    <button class="button full-width button-sliding-icon ripple-effect margin-top-10" name="submit" type="submit">{LANG_LOGIN} <i class="icon-feather-arrow-right"></i></button>
                    <br>
                    <center><a href="{LINK_LOGIN}?fstart=1" class="forgot-password">{LANG_FORGOT_PASSWORD}</a> </center> 
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="margin-top-70"></div>
    <br>  <br> <br> <br>
    {OVERALL_FOOTER}
