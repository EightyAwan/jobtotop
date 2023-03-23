{OVERALL_HEADER}
<div id="titlebar">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>{LANG_MEMBERSHIPPLAN}</h1>
                <!-- Breadcrumbs -->
                <nav id="breadcrumbs">
                    <ul>
                        <li><a href="{LINK_INDEX}">{LANG_HOME}</a></li>
                        <li>{LANG_MEMBERSHIPPLAN}</li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
</div>
<div class="container">
    <h3 class="page-title margin-bottom-30">{LANG_ALL_PLANS}</h3>
    <div class="row">
        <div class="col-xl-12">
            <div class="pricing-plans-container margin-bottom-50">
                {LOOP: SUB_TYPES}
                <!-- Plan -->
                <div class='pricing-plan IF("{SUB_TYPES.recommended}"=="yes"){ recommended {:IF}'>
                    <h3>{SUB_TYPES.title}</h3>
                    <div class="pricing-plan-label billed-monthly-label"><strong>{SUB_TYPES.feature}</strong></div>
                    <div class="pricing-plan-features">
                        <strong>{LANG_FEATURES_OF} {SUB_TYPES.title}</strong>
                         {SUB_TYPES.description}
                    </div>
                    IF("{SUB_TYPES.Selected}"=="0"){
                    <form name="form1" method="post" action="">
                        <input class="signup cursor" name="upgrade" type="hidden" value="{SUB_TYPES.id}">
                        <button type="submit" class="button full-width margin-top-20" name="Submitup"><strong>{CURRENCY_SIGN}{SUB_TYPES.cost}</strong></button>
                    </form>
                    {:IF}
                    IF("{SUB_TYPES.Selected}"=="1"){
                    <a href="#" class="button full-width margin-top-20">
                        {LANG_CURRENT_PLAN}
                    </a>
                    {:IF}
                </div>
                {/LOOP: SUB_TYPES}
            </div>
        </div>
    </div>
</div>
{OVERALL_FOOTER}
