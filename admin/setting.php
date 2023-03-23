<?php
require_once('includes.php');
?>

<main class="app-layout-content">

    <!-- Page Content -->
    <div class="container-fluid p-y-md">
        <!-- Partial Table -->
        <div class="card">
            <div class="card-header">
                <h4>Site setting</h4>
            </div>
            <div class="card-block">
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">


                        <div id="quickad-tbs" class="wrap">
                            <div class="quickad-tbs-body">

                                <div class="row">
                                    <div id="quickad-sidebar" class="col-sm-4">
                                        <ul class="quickad-nav" role="tablist">
                                            <li class="quickad-nav-item" data-target="#quickad_logo_watermark" data-toggle="tab">Logo</li>
                                            <li class="quickad-nav-item" data-target="#quickad_theme_setting" data-toggle="tab">SEO Setting</li>
                                        </ul>
                                    </div>

                                    <div id="quickad_settings_controls" class="col-sm-8">
                                        <div class="panel panel-default quickad-main">
                                            <div class="panel-body">
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="quickad_logo_watermark">
                                                        <form method="post" action="ajax_sidepanel.php?action=SaveSettings" id="#quickad_logo_watermark" enctype="multipart/form-data">
                                                            <!-- Favicon upload-->
                                                            <div class="form-group">

                                                                <label class="control-label">Favicon Icon<code>*</code></label>
                                                                <div class="screenshot"><img class="redux-option-image" id="favicon_uploader" src="../storage/logo/<?php echo $config['site_favicon']?>" alt="" target="_blank" rel="external"  style="border: 2px solid #eee;background-color: #000;max-width: 100%"></div>
                                                                <input class="form-control input-sm" type="file" name="favicon" onchange="readURL(this,'favicon_uploader')">
                                                                <span class="help-block">Ideal Size 16x16 PX</span>
                                                            </div>

                                                            <!-- Site Logo upload-->
                                                            <div class="form-group">
                                                                <label class="control-label">Logo<code>*</code></label>
                                                                <div class="screenshot"><img class="redux-option-image" id="image_logo_uploader" src="../storage/logo/<?php echo $config['site_logo']?>" alt="" target="_blank" rel="external"  style="border: 2px solid #eee;background-color: #000;max-width: 100%"></div>
                                                                <input class="form-control input-sm" type="file" name="file" onchange="readURL(this,'image_logo_uploader')">
                                                                <span class="help-block">Ideal Size 170x60 PX</span>
                                                            </div>
                                                            <!-- Site Logo upload-->
                                                            <div class="form-group">
                                                                <label class="control-label">Footer Logo<code>*</code></label>
                                                                <div class="screenshot"><img class="redux-option-image" id="image_flogo_uploader" src="../storage/logo/<?php echo $config['site_logo_footer']?>" alt="" target="_blank" rel="external"  style="border: 2px solid #eee;background-color: #000;max-width: 100%"></div>
                                                                <input class="form-control input-sm" type="file" name="footer_logo" onchange="readURL(this,'image_flogo_uploader')">
                                                                <span class="help-block">Display in the footer</span>
                                                            </div>

                                                            <!-- Admin Logo upload-->
                                                            <div class="form-group">
                                                                <label class="control-label">Admin Logo</label>
                                                                <div class="screenshot"><img class="redux-option-image" id="adminlogo" src="../storage/logo/<?php echo $config['site_admin_logo']?>" alt="" target="_blank" rel="external"  style="border: 2px solid #eee;background-color: #000;max-width: 100%"></div>
                                                                <input class="form-control input-sm" type="file" name="adminlogo" onchange="readURL(this,'adminlogo')">
                                                                <span class="help-block">Ideal Size 235x62 PX</span>
                                                            </div>

                                                            <!-- Admin Logo upload-->
                                                            <div class="panel-footer">
                                                                <button name="logo_watermark" type="submit" class="btn btn-primary btn-radius save-changes">Save</button>
                                                                <button class="btn btn-default" type="reset">Reset</button>
                                                            </div>

                                                        </form>
                                                    </div>
                                                    <div class="tab-pane" id="quickad_theme_setting">
                                                        <form method="post" action="ajax_sidepanel.php?action=SaveSetting" id="#quickad_theme_setting">
                                                            

                                                            <div class="form-group">
                                                                <label class="">Meta Keywords:</label>
                                                                <div>
                                                                    <input name="meta_keywords" type="text" class="form-control" value="<?php echo get_option("meta_keywords"); ?>">
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="">Meta Description:</label>
                                                                <div>
                                                                    <input name="meta_description" type="text" class="form-control" value="<?php echo get_option("meta_description"); ?>">
                                                                </div>
                                                            </div>
                                                            <div class="panel-footer">
                                                                <button name="theme_setting" type="submit" class="btn btn-primary btn-radius save-changes">Save</button>
                                                                <button class="btn btn-default" type="reset">Reset</button>
                                                            </div>

                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <!-- /.row -->
            </div>
            <!-- .card-block -->
        </div>
        <!-- .card -->
        <!-- End Partial Table -->

    </div>
    <!-- .container-fluid -->
    <!-- End Page Content -->

</main>


<?php include("footer.php"); ?>
<script>
    var url = window.location.href;
    var activeTab = url.substring(url.indexOf("#") + 1);
    if(url.indexOf("#") > -1){
        if(activeTab.length > 0){
            $(".quickad-nav-item").removeClass("active");
            $(".tab-pane").removeClass("active in");
            $("li[data-target = #"+activeTab+"]").addClass("active");
            $("#" + activeTab).addClass("active in");
            $('a[href="#'+ activeTab +'"]').tab('show')
        }
    }
</script>
<script>
    $(".save-changes").on('click',function(){
        $(".save-changes").addClass("bookme-progress");
    });
    // wait for the DOM to be loaded
    $(document).ready(function() {
        // bind 'myForm' and provide a simple callback function
        $('form').ajaxForm(function(data) {
            if (data == 0) {
                alertify.error("Unknown Error generated.");
            } else {
                data = JSON.parse(data);
                if (data.status == "success") {
                    alertify.success(data.message);
                }
                else {
                    alertify.error(data.message);
                }
            }
            $(".save-changes").removeClass('bookme-progress');
        });

        /* Mail Method Changer */
        $("#email_type").on('change',function(){
            $(".mailMethods").hide();
            $(".mailMethod-"+$(this).val()).fadeIn('fast');
        });
    });
</script>
<!-- Page JS Code -->
<script>
    $(function()
    {
        // Init page helpers (BS Datepicker + BS Colorpicker + Select2 + Masked Input + Tags Inputs plugins)
        App.initHelpers('select2');
    });
</script>
</body></html>