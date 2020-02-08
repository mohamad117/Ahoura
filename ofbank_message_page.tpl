{if $errormessage}
<div class="errorbox alert alert-danger">
{else}
<div class="successbox alert alert-success text-center">
{/if}
{section name=i loop=$messages_no }
	{if $messages_no[i] == -1 }
		<br>
		اشکال در ثبت پرداخت:{$mysql_error}
	{elseif $messages_no[i] == -2}
		<br>
		اشکال در ویرایش پرداخت:{$mysql_error}
	{elseif $messages_no[i] == -3}
		<br>
		حجم اسکن فیش شما بیش از {$max_scan_size} کیلو بایت می باشد.
	{elseif $messages_no[i] == -4}
		<br>
		نوع فایل اسکن شما غیر مجاز می باشد.
	{elseif $messages_no[i] == -5}
		<br>
		پر کردن فیلد شماره فاکتور الزامی می باشد.
	{elseif $messages_no[i] == -6}
		<br>
		پر کردن فیلد نام بانک الزامی می باشد.
	{elseif $messages_no[i] == -7}
		<br>
		پر کردن فیلد (های)
		{foreach name=option from=$emptycustomfields item=field} {$field}, {/foreach}
			الزامی می باشد.
	{elseif $messages_no[i] == -8}
		<br>
		فیلد (های)
		{foreach name=option from=$unmatchedcustomfields item=field} {$field}, {/foreach}
			درای مقادیر صحیح نمی باشند.
	{elseif $messages_no[i] == -9}
		<br>
		لطفا تاریخ معتبری وارد کنید.
	{elseif $messages_no[i] == 1}
		<br>
		پرداخت شما با موفقیت ثبت شد
	{elseif $messages_no[i] == 2}
		<br>
		پرداخت شما با موفقیت ویرایش شد
	{/if}
{/section}
</div>

{include file="$template/ofbank_submit_form.tpl"}
