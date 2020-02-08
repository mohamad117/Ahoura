<div id="form-section" class="container-fluid signin">
    <div class="website-logo">
        <a href="{$WEB_ROOT}/index.php">
            <div class="logo" style="width:232px;height:200px"></div>
        </a>
    </div>
    <div class="row">
        <div class="info-slider-holder">
            <div class="bg-animation"></div>
            <div class="info-holder">
               
                <div class="bold-title">به کسب و کار خود رونق ببخشید</div>
				<div class="">
       <img class="img100 img-responsive" src="{$WEB_ROOT}/assets/img/logo.png">
    </div>
	
                    </div>
                </div>
            </div>
        </div>

		
    </div>
	 
	
        <div class="form-holder">
            <div class="menu-holder">
                <ul class="main-links">
                    <li><a class="normal-link" href="{$WEB_ROOT}/register.php">قصد ثبت نام دارید ؟</a></li>
                    <li><a class="sign-button" href="{$WEB_ROOT}/register.php">عضویت در سایت</a></li>
                </ul>
            </div>
            <div class="signin-signup-form">
                <div class="form-items">
                    <div class="form-title">{include file="$template/includes/pageheader.tpl" title=$LANG.login desc="{$LANG.restrictedpage}"}</div>
                    {if $incorrect}
                        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
                    {elseif $verificationId && empty($transientDataName)}
                        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.verificationKeyExpired textcenter=true}
                    {elseif $ssoredirect}
                        {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sso.redirectafterlogin textcenter=true}
                    {/if}
                    <form id="signinform" method="post" action="{$systemurl}dologin.php" role="form">
                        <div class="form-text">
                            <input id="inputEmail" type="email" name="username" name="username" placeholder="{$LANG.enteremail}">
                        </div>
                        <div class="form-text">
                            <input id="inputPassword" type="password" name="password" placeholder="{$LANG.clientareapassword}" autocomplete="off">
                        </div>
                        <div class="form-text text-holder">
                            <input id="chkbox" type="checkbox" class="hno-checkbox" name="rememberme" /> <label for="chkbox">{$LANG.loginrememberme}</label>
                        </div>
                        <div class="form-button">
                            <button id="login" type="submit" class="ybtn ybtn-purple">{$LANG.loginbutton}</button>
                            <a href="pwreset.php" class="btn btn-link">{$LANG.forgotpw}</a>
                        </div>
                    </form>
                </div>
				<p class="p1">کاربران محترم آدرس پورتال قدیم کاربران آذران وب به شرح زیر است :</p>
				<p class="p2">در صورت مغایرت سرویس های خریداری شده با بخش پشتیبانی آذران وب تماس بگیرید .</p>
				<a class="a1" href="http://azaranweb.org/fa/account/login">ورود به پورتال قدیم</a>
            </div>
        </div>
    </div>
</div>