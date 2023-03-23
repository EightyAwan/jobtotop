{OVERALL_HEADER}
<style>
    #footer {
        width: 100%; 
        position: absolute; 
        bottom: -100px !important;
    }
    
    @media (max-width: 767px) {
        #footer {
            bottom: -200px !important;
        }
    }
</style>
<link rel="stylesheet" href="https://cdn.tutorialjinni.com/intl-tel-input/17.0.8/css/intlTelInput.css"/>
<script src="https://cdn.tutorialjinni.com/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Create CV</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>Create CV</li>
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
                    <h3 style="font-size: 26px;" class="opt_text_yes" id="jobSeekerSectionHeading">Let's create your CV</h3>
                </div>
                <form method="post" id="" action="#" accept-charset="UTF-8">
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-user"></i>
                            <input type="text" class="input-text with-border" placeholder="Full Name" value="" id="name" name="name" required="" />
                        </div>
                        <span>Full Name</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-user"></i>
                            <input type="text" class="input-text with-border" placeholder="Job Position" value="" id="" name="" required="" />
                        </div>
                        <span>Job Position</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <textarea class="input-text with-border" placeholder="About Me" value="" id="name" name="name" required=""></textarea>
                        </div>
                        <span>About Me</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-envelope"></i>
                            <input type="email" class="input-text with-border" placeholder="Your Email" value="" id="" name="" required="" />
                        </div>
                        <span>Email Address</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-phone"></i>
                            <input type="tel" class="input-text with-border" placeholder="Phone Number" value="" id="" name="" required="" />
                        </div>
                        <span>Phone Number</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-map-marker"></i>
                            <input type="text" class="input-text with-border" placeholder="Address" value="" id="" name="" required="" />
                        </div>
                        <span>Address</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-skype"></i>
                            <input type="text" class="input-text with-border" placeholder="Skype" value="" id="" name="" />
                        </div>
                        <span>Skype Address</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-github"></i>
                            <input type="text" class="input-text with-border" placeholder="Github Link" value="" id="" name="" />
                        </div>
                        <span>Github Link</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-facebook"></i>
                            <input type="text" class="input-text with-border" placeholder="Facebook Link" value="" id="" name="" />
                        </div>
                        <span>Facebook Link</span>
                    </div>
                    <div class="form-group">
                        <div class="input-with-icon-left">
                            <i class="la la-linkedin"></i>
                            <input type="text" class="input-text with-border" placeholder="Linkedin Link" value="" id="" name="" />
                        </div>
                        <span>Linkedin Link</span>
                    </div>
                    <div class="form-group">
                        <h3>Add you Skills</h3>
                        <div class="skills_field"></div>
                        <span>Add your skill <i class="la la-plus plus_icon add_skill"></i><br />Click at the plus icon to add skill and minus icon to remove skill.</span>
                    </div>
                    <div class="form-group mt-3">
                        <h3>Add you Languages</h3>
                        <div class="languages_field"></div>
                        <span>Add your languages <i class="la la-plus plus_icon add_languages"></i><br />Click at the plus icon to add languages and minus icon to remove languages.</span>
                    </div>
                     <div class="form-group mt-3">
                        <h3>Add you Work Experience</h3>
                        <div class="work_field"></div>
                        <span>Add your Work Experience <i class="la la-plus plus_icon work_ex_field"></i><br />Click at the plus icon to add Work Experience and minus icon to remove Work Experience.</span>
                    </div>
                     <div class="form-group mt-3">
                        <h3>Add you Projects</h3>
                        <div class="project_field"></div>
                        <span>Add your Projects<i class="la la-plus plus_icon project_ex_field"></i><br />Click at the plus icon to add Projects and minus icon to remove Projects.</span>
                    </div>
                     <div class="form-group mt-3">
                        <h3>Add you Education</h3>
                        <div class="education_field"></div>
                        <span>Add your Education<i class="la la-plus plus_icon eduction_ex_field"></i><br />Click at the plus icon to add Education and minus icon to remove Education.</span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="margin-top-70"></div>
<script>
    $(document).ready(function(){
        $(".add_skill").click(function(){
            var newField = '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-minus my_del minus_icon"></i> <input type="text" class="input-text with-border" value="" id="" name="" /> </div>';
            $(".skills_field").append(newField);
            
            $(".my_del").on('click' , function(){
                var m =$(this)
                $(m).closest("div").remove();
           });
        });
        
         $(".add_languages").click(function(){
            var newField = '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-minus my_del minus_icon"></i> <input type="text" class="input-text with-border" value="" id="" name="" />' + 
            '<select style="width:44%;">'+
            '<option>Beginner</option><option>professional</option><option>Extra professional</option>' +
            '</select>' 
            + '</div>';
            $(".languages_field").append(newField);
            
            $(".my_del").on('click' , function(){
                var m =$(this)
                $(m).closest("div").remove();
           });
        });
        
        
         $(".work_ex_field").click(function(){
            var bt = '<div>'+ '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-user"></i><input type="text" placeholder="Enter your Company Name" class="input-text with-border" value="" id="" name="" /> </div>' +
            '<div class="input-with-icon-left" style="margin-top:15px;">  <i class="la la-user"></i><input type="text" placeholder="Enter Your Field" class="input-text with-border" value="" id="" name=""  /> </div>' +
            '<div  class="input-with-icon-left " style="margin-top:15px;"> <i class="la la-calendar"></i> <input type="date" /></div>'+'<span class="date_ld">Joning Date</span>' +
            '<div  class="d-flex justify-content-center"><b><big>To</big></b></div>' +
            '<div  style="margin-top:15px; position:relative;"><input type="checkbox" value="Present" class="on_job" style="width: 5%; height: 25px;" /><span style="position: absolute;top: -5px;left: 33px;">present</span></div>' +
            '<div  class="input-with-icon-left slide_top" style="margin-top:15px;"> <i class="la la-calendar"></i> <input type="date" /></div>'+'<span class="date_ld slide_top">Leave Date</span>' +
            '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-user"></i> <textarea name="" id="" cols="15" placeholder="Describe Your Experience" rows="5" style="text-indent: 48px;"></textarea> </div>' +
            '<a class="btn btn-primary all_del" style="margin-bottom:30px;">Close All Fileds</a>' +'</div>' ;
            $(".work_field").append(bt);
            
            $(".on_job").on('click', function(){
                $(".slide_top").toggle("slow");
            });
            
             $(".all_del").on('click' , function(){
                var m =$(this);
                $(m).closest("div").remove();
           });
        });
        
         $(".project_ex_field").click(function(){
             var pro ='<div>'+ '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-globe minus_icon"></i> <input type="text" class="input-text with-border" value="" id="" name="" placeholder="project name/project link" /> </div>' +
             '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-user"></i> <textarea name="" id="" cols="15" placeholder="Describe Your projects" rows="5" style="text-indent: 48px;"></textarea> </div>' +
             '<a class="btn btn-primary all_del" style="margin-bottom:30px;">Close All Fileds</a>' +'</div>'  ;
             $(".project_field").append(pro);
             
              $(".all_del").on('click' , function(){
                var m =$(this);
                $(m).closest("div").remove();
           });
         });
        
        
        $(".eduction_ex_field").click(function(){
            var bt = '<div>'+ '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-user"></i><input type="text" placeholder="Qualification" class="input-text with-border" value="" id="" name="" /> </div>' +
            '<div class="input-with-icon-left" style="margin-top:15px;"> <i class="la la-user"></i><input type="text" placeholder="School/college/university" class="input-text with-border" value="" id="" name="" /> </div>' +
            '<div class="input-with-icon-left" style="margin-top:15px;">  <i class="la la-user"></i><input type="text" placeholder="courses" class="input-text with-border" value="" id="" name=""  /> </div>' +
            '<a class="btn btn-primary all_del" style="margin-top:30px;">Close All Fileds</a>' +'</div>' ;
            $(".education_field").append(bt);
            
             $(".all_del").on('click' , function(){
                var m =$(this);
                $(m).closest("div").remove();
           });
        });
        
    });
</script>
{OVERALL_FOOTER}
