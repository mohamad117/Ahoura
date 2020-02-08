{if $error_code }
	{if $irnic_error_code }
		<div class="errorbox">{$irnic_error_code}</div>
	{else}
		<div class="errorbox">
		{$LANG.IRNIC_MSG_CODE_UNKNOWN} {$error_code}
		<br>
		{$error_msg}
		</div>
	{/if}
{/if}
  <br>
  <h1 class="firsth"> <i class="fa fa-check"></i> ساختن شناسه کاربری ایرنیک </h1>
  <p>پر کردن فیلد‌هایی که با ستاره (<span class="mandatory">*</span>) مشخص شده‌اند، اجباری می‌باشد.</p>
  <br>

    <form method="POST" action="{$smarty.server.PHP_SELF}">   
	<input name="a" value="chg_handle" type="hidden">	
      <h2 class="firsth2">نوع شناسه: &nbsp; 
		<select name="handle_class" tabindex="5" onchange="submit()">
              <option {if $handle_class == 'Person' }selected{/if} value="Person" >حقیقی</option>
              <option {if $handle_class == 'Company' }selected{/if}  value="Company" >شرکتی</option>
			  <option {if $handle_class == 'Organization' }selected{/if}  value="Organization" >سازمانی</option>
			  <option {if $handle_class == 'Education' }selected{/if}  value="Education" >آموزشی</option>
		</select>
	  </h2>
	</form>