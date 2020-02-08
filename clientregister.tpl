<div id="form-section" class="container-fluid signup">
    <div class="website-logo">
        <a href="{$WEB_ROOT}/index.php">
            <div class="logo" style="width:300px;height:260px"></div>
        </a>
    </div>
    <div class="row">
        <div class="info-slider-holder">
            <div class="bg-animation"></div>
            <div class="info-holder">
                <h6>سامانه پشتیبانی و تیکتینگ</h6>
                <div class="e0">با کارشناسان پشتیبانی آذران اینجا در ارتباط باشید.</div>
                </div>
            </div>
			
        </div>
        <div class="form-holder">
            <div class="menu-holder">
                <ul class="main-links">
<li><a class="normal-link" href="{$WEB_ROOT}/login.php"> قبلا ثبت نام کردید ؟</a></li>
<li><a class="sign-button" href="{$WEB_ROOT}/login.php">ورود به سایت</a></li>      

</ul>
            </div>
            <div class="signin-signup-form">
			
                <div class="form-items">
                    <div class="form-title">{include file="$template/includes/pageheader.tpl" title=$LANG.register}</div>
					<p class="saeed_text">کاربر گرامی، لطفا با ایمیل معتبر پنل سایت <a href="http://www.azaranweb.org/"> azaranweb.org </a>ثبت نام را انجام دهید.
					<br>
					در صورتی که به ایمیل معتبر دسترسی ندارید با تیم پشتیبانی آذران وب تماس حاصل نمایید.
					</p>
					<h3>
					لطفا تمام فیلدها رو به صورت انگلیسی وارد کنید.
					</h3>
                    

                    {if $registrationDisabled}
                        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
                    {/if}

                    {if $errormessage}
                        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                    {/if}

                    {if !$registrationDisabled}
                    <form id="signupform" method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form">
                        <input type="hidden" name="register" value="true"/>
                        <div class="row">
                            <div class="col-md-6 form-text">
                                <input type="text" name="firstname" id="firstname" value="{$clientfirstname}" placeholder="{$LANG.clientareafirstname}" {if !in_array('firstname', $optionalFields)}required{/if} />
                            </div>
                            <div class="col-md-6 form-text">
                                <input type="text" name="lastname" id="lastname" value="{$clientlastname}" placeholder="{$LANG.clientarealastname}" {if !in_array('lastname', $optionalFields)}required{/if} />
                            </div>
                        </div>
                        <div class="form-text">
                            <input type="text" name="companyname" id="companyname" value="{$clientcompanyname}" placeholder="{$LANG.clientareacompanyname}" />
                        </div>
                        <div class="form-text">
                            <input type="email" name="email" id="email" value="{$clientemail}" placeholder="{$LANG.clientareaemail}" />
                        </div>

                        <div id="newPassword1" class="form-group has-feedback form-text">
                            <input type="password" placeholder="{$LANG.clientareapassword}" id="inputNewPassword1" name="password" autocomplete="off" />
                            <span class="form-control-feedback glyphicon glyphicon-password"></span>
                            {include file="$template/includes/pwstrength.tpl"}
                        </div>
                        <div id="newPassword2" class="form-group has-feedback form-text">
                            <input type="password" placeholder="{$LANG.clientareaconfirmpassword}" id="inputNewPassword2" name="password2" autocomplete="off" />
                            <span class="form-control-feedback glyphicon glyphicon-password"></span>
                            <div id="inputNewPassword2Msg">
                            </div>
                        </div>

                        <div class="form-text">
                            <input type="text" name="address1" id="address1" value="{$clientaddress1}" placeholder="{$LANG.clientareaaddress1}" {if !in_array('address1', $optionalFields)}required{/if} />
                        </div>
                        <div class="form-text" hidden>
                            <input type="text" name="address2" id="address2" value="{$clientaddress2}" placeholder="{$LANG.clientareaaddress2}" />
                        </div>
                        <div class="form-text" hidden>
                            <input type="text" name="city" id="city" class="selectpicker" value="Den Haag" placeholder="{$LANG.clientareacity}" {if !in_array('city', $optionalFields)}required{/if} />
                        </div>
                        <div class="form-text" hidden>
                            <input type="text" name="state" id="state" value="Zuid-Holland" placeholder="{$LANG.clientareastate}" {if !in_array('state', $optionalFields)}required{/if} />
                        </div>
                        <div class="form-text" hidden>
                            <input type="text" name="postcode" id="postcode" value="SL 2675" placeholder="{$LANG.clientareapostcode}" {if !in_array('postcode', $optionalFields)}required{/if} />
                        </div>

                        <div class="form-text" hidden>
                            <label for="country" class="control-label">{$LANG.clientareacountry}</label>
                            <select id="country" name="country" class="selectpicker">
                                {foreach $clientcountries as $countryCode => $countryName}
                                    <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                        {$countryName}
                                    </option>
                                {/foreach}
                            </select>
                        </div>

                        <div class="form-text">
                            <input type="tel" name="phonenumber" id="phonenumber" value="{$clientphonenumber}" placeholder="{$LANG.clientareaphonenumber}" {if !in_array('phonenumber', $optionalFields)}required{/if} />
                        </div>

                        {if $customfields}
                            {foreach from=$customfields key=num item=customfield}
                                <div class="form-text">
                                    <label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
                                    <div class="control">
                                        {$customfield.input} {$customfield.description}
                                    </div>
                                </div>
                            {/foreach}
                        {/if}

                        {if $currencies}
                            <div class="form-group">
                                <label for="currency" class="control-label">{$LANG.choosecurrency}</label>
                                <select id="currency" name="currency" class="selectpicker">
                                    {foreach from=$currencies item=curr}
                                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}
                        {if $securityquestions}
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">{$LANG.clientareasecurityquestion}:</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="form-group col-sm-12">
                                        <select name="securityqid" id="securityqid" class="form-control">
                                            {foreach key=num item=question from=$securityquestions}
                                                <option value={$question.id}>{$question.question}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="securityqans">{$LANG.clientareasecurityanswer}</label>
                                        <div class="col-sm-6">
                                            <input type="password" name="securityqans" id="securityqans" class="form-control" autocomplete="off" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/if}

                        {include file="$template/includes/captcha.tpl"}

                        {if $accepttos}
                            <div class="panel panel-danger tospanel">
                                <div class="panel-heading">
                                    <h3 class="panel-title"><span class="fa fa-exclamation-triangle tosicon"></span> &nbsp; {$LANG.ordertos}</h3>
                                </div>
                                <div class="panel-body">
                                        <div class="col-md-12">
                                            <label class="checkbox">
                                            <input type="checkbox" name="accepttos" class="accepttos">
                                            {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                                            </label>
                                        </div>
                                </div>
                            </div>
                        {/if}
                        <div class="form-button">
                            <button id="submit" type="submit" class="ybtn ybtn-purple">{$LANG.clientregistertitle}</button>
                        </div>
                    </form>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>