<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

    {$headoutput}

</head>
<body {if $loginpage eq 1 or $templatefile eq "clientregister"}class="fullpage"{/if}>
{if $loginpage eq 0 and $templatefile ne "clientregister"}

<div id="header-holder" class="{if $templatefile != 'homepage'}inner-header{/if}">
    <div class="bg-animation"></div>
    
    {$headeroutput}

    <section id="header" class="container-fluid">
        <div class="container">
            <ul class="top-nav">
             
			 
			 
			 
			 
			 <li>
                    <a href="#" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                        {$LANG.notifications}
                        {if count($clientAlerts) > 0}{/if}
                        <b class="caret"></b>
                    </a>
                    <div id="accountNotificationsContent" class="hidden">
                        <ul class="client-alerts">
                        {foreach $clientAlerts as $alert}
                            <li>
                                <a href="{$alert->getLink()}">
                                    <i class="fa fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}warning{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                    <div class="message">{$alert->getMessage()}</div>
                                </a>
                            </li>
                        {foreachelse}
                            <li class="none">
                                {$LANG.notificationsnone}
                            </li>
                        {/foreach}
                        </ul>
                    </div>
                </li>
				
				
			 
			 
			 

                {if $loggedin}
{if $loggedin}
<script src="{$WEB_ROOT}/templates/{$template}/assets/js/VO_gravtar.js" type="text/javascript"></script>
        		<li class="dropdown primary-action">
        			<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="m-l-10">{literal}<script>document.write('<img src="' + get_gravatar("{$clientsdetails.email}", 32) + '" class="user-image" />');</script>{/literal}<i></i></span> {$loggedinuser.firstname} {$loggedinuser.lastname} <b class="caret"></b></a>
        			<ul class="dropdown-menu">
					  <li><a id="Menu-Hello_User-Edit_Account_Details" href="clientarea.php?action=details">{$LANG.editaccountdetails}</a></li>
          <!--      {if $condlinks.updatecc}<li><a id="Menu-Hello_User-Contacts_Sub-Accounts" href="clientarea.php?action=creditcard">{$LANG.navmanagecc}</a></li>{/if}
                <li><a href="clientarea.php?action=contacts">{$LANG.clientareanavcontacts}</a></li>  -->
                {if $condlinks.addfunds}<li><a id="Menu-Hello_User-Add_Funds" href="clientarea.php?action=addfunds">{$LANG.addfunds}</a></li>{/if}
                <li><a id="Menu-Hello_User-Email_History" href="clientarea.php?action=emails">{$LANG.navemailssent}</a></li>
                <li><a id="Menu-Hello_User-Change_Password" href="clientarea.php?action=changepw">{$LANG.clientareanavchangepw}</a></li>
        			</ul>
        		</li>
{/if}
                    <li class="primary-action myicon100">
                        <a href="{$WEB_ROOT}/logout.php" class="btn btn-action">
                            {$LANG.clientareanavlogout}
                        </a>
                    </li>
                {else}
                    <li>
                        <a href="{$WEB_ROOT}/clientarea.php">{$LANG.login}</a>
                    </li>
                    {if $condlinks.allowClientRegistration}
                        <li>
                            <a href="{$WEB_ROOT}/register.php">{$LANG.register}</a>
                        </li>
                    {/if}
                {/if}
				
				
				
				
               
				
				
				
                {if $adminMasqueradingAsClient || $adminLoggedIn}
                    <li>
                        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-logged-in-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{$LANG.adminmasqueradingasclient} {$LANG.logoutandreturntoadminarea}{else}{$LANG.adminloggedin} {$LANG.returntoadminarea}{/if}">
                            <i class="fa fa-sign-out"></i>
                        </a>
                    </li>
                {/if}
            </ul>


            {if $assetLogoPath}
                <a href="{$WEB_ROOT}" class="logo"><img src="{$assetLogoPath}" alt="{$companyname}"></a>
            {else}
                <a href="{$WEB_ROOT}" class="logo logo-text logo-holder"><div class="logo" style="width:300px;height:60px" title="{$companyname}"></div></a>
            {/if}

        </div>
    </section>
    <section id="main-menu">
        <nav id="nav" class="container-fluid navbar navbar-default navbar-main" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#primary-nav">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="primary-nav">

                    <ul class="nav navbar-nav">

                        {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}

                    </ul>

                    <ul class="nav navbar-nav navbar-left">
				<li><a href="cart.php?a=view"><i class="fa fa-cart-plus" aria-hidden="true"></i> سبد خرید </a></li>

                    </ul>

                </div><!-- /.navbar-collapse -->
            </div>
        </nav>
    </section>
    {if $templatefile == 'homepage'}
    <div id="top-content" class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    {if $registerdomainenabled || $transferdomainenabled}
                    <div class="big-title">7 روز هفته و بصورت 24 ساعته<br>آماده پشتیبانی و پاسخ به سوالات شما هستیم</div>
                    <div class="domain-search-holder">
                        <form id="domain-search" method="post" action="domainchecker.php">
                            {if $transferdomainenabled}
                            <span class="inline-button">
                                <input id="transfer-btn" type="submit" name="transfer" value="{$LANG.domainstransfer}" />
                            </span>
                            {/if}
                            {if $registerdomainenabled}
                            <span class="inline-button">
                                <input id="search-btn" type="submit" name="submit" value="{$LANG.search}" />
                            </span>
                            {/if}
							<input id="domain-text" type="text" name="domain" placeholder="{$LANG.exampledomain}" />
                        </form>
                      <!-- <div class="captcha-holder">{include file="$template/includes/captcha.tpl"}</div> --> 
                    </div>
                    {else}
                        <div class="toparea-space"></div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
    {/if}
</div>
    
{if $templatefile == 'homepage'}

<div id="services" class="container-fluid">
    <div class="container">
        
 <!--   <section id="adsbanner">
        
            <div class="col-sm-12">
                       <a href="http://whmcsco.com/index.php"> <img src="http://whmcsco.com/images/banner.jpg" alt=""></a>
            </div>
        
    </section> -->
    
        
		<!--
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <div class="service-box">
                    <div class="service-icon">
                        <img src="{$WEB_ROOT}/templates/{$template}/images/feature1.svg" alt="">
                    </div>
                    <div class="service-title"><a href="#">طراحی سایت</a></div>
                    <div class="service-details">
                        <p>با 17 سال فعالیت و ثبت بیش از 3000 سایت آماده ایم تا سایت شما را با متد روز طراحی کنیم</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div class="service-box">
                    <div class="service-icon">
                        <img src="{$WEB_ROOT}/templates/{$template}/images/feature2.svg" alt="">
                    </div>
                    <div class="service-title"><a href="#">میزبانی وب</a></div>
                    <div class="service-details">
                        <p>جزء 10 شرکت اول در ارائه میزبانی وب در ایران آماده میزبانی سایت شما در بستری امن و قدرتمند هستیم</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div class="service-box">
                    <div class="service-icon">
                        <img src="{$WEB_ROOT}/templates/{$template}/images/feature3.svg" alt="">
                    </div>
                    <div class="service-title"><a href="#">خدمات SSL</a></div>
                    <div class="service-details">
                        <p>تضمینی بر امن بودن وب سایت شما و تاییدی مهم در سئو و بهینه سازی سایت و همچنین درگاه های پرداخت آنلاین</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div class="service-box">
                    <div class="service-icon">
                        <img src="{$WEB_ROOT}/templates/{$template}/images/feature4.svg" alt="">
                    </div>
                    <div class="service-title"><a href="#">بهنیه سازی و SEO</a></div>
                    <div class="service-details">
                        <p>افزایش بازدید و بهبود رتبه شما در گوگل مسیری ثابت برای موفقیت کسب و کار شماست، ما همراه شما</p>
                    </div>
                </div>
            </div>
			
        </div>
		-->
		
    </div>
</div>

{/if}

{include file="$template/includes/verifyemail.tpl"}
<div id="main-body-holder" class="container-fluid">
<section id="main-body">
    <div class="container{if $skipMainBodyContainer}-fluid without-padding{/if}">
        <div class="row">

        {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
            {if $primarySidebar->hasChildren() && !$skipMainBodyContainer}
                <div class="col-md-12 pull-md-right">
                    {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
                </div>
            {/if}
        {/if}
        <!-- Container for main page display content -->
        <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-md-12 pull-md-right{else}col-xs-12{/if} main-content">
            {if !$primarySidebar->hasChildren() && !$showingLoginPage && !$inShoppingCart && $templatefile != 'homepage' && !$skipMainBodyContainer}
                {include file="$template/includes/pageheader.tpl" title=$displayTitle desc=$tagline showbreadcrumb=true}
            {/if}
{/if}





<!-- Smartsupp Live Chat script -->
<script type="text/javascript">
var _smartsupp = _smartsupp || {};
_smartsupp.key = '3d74cdaba2b2fb79e1c2bc576d767a7cec7135f5';
window.smartsupp||(function(d) {
  var s,c,o=smartsupp=function(){ o._.push(arguments)};o._=[];
  s=d.getElementsByTagName('script')[0];c=d.createElement('script');
  c.type='text/javascript';c.charset='utf-8';c.async=true;
  c.src='https://www.smartsuppchat.com/loader.js?';s.parentNode.insertBefore(c,s);
})(document);
</script>

<!--Ads -->
<script>
	!function (t, e, n) {
		t.yektanetAnalyticsObject = n, t[n] = t[n] || function () {
			t[n].q.push(arguments)
		}, t[n].q = t[n].q || [];
		var a = new Date, r = a.getFullYear().toString() + "0" + a.getMonth() + "0" + a.getDate() + "0" + a.getHours(),
			c = e.getElementsByTagName("script")[0], s = e.createElement("script");
		s.id = "ua-script-yn-31946-adv"; s.dataset.analyticsobject = n; s.async = 1; s.type = "text/javascript";
		s.src = "https://cdn.yektanet.com/rg_woebegone/scripts_v2/yn-31946-adv/rg.complete.js?v=" + r, c.parentNode.insertBefore(s, c)
	}(window, document, "yektanet");
</script>