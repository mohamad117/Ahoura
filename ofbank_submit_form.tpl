<div dir="rtl" align="right">
<script type="text/javascript" src="templates/{$template}/filter.js"></script>
{literal}
<script type="text/javascript">
function ofbank_change_doc(elm){
	var i = jQuery(elm).val();
	jQuery('.showon').hide();
	jQuery('.showon'+i).show();
}
</script>
{/literal}
<p>
پر کردن فیلد هایی که با <span style="color:red" >*</span> مشخص شده الزامی است. <br />
بیشنه حجم فایل اسکن برای ارسال {$max_scan_size} کیلو بایت می باشد. <br />
نوع فایل اسکن برای ارسال باید یکی از گونه های {$accept_scan_ext} باشد. <br />
</p>



<form method="post" action="{if $formaction }{$formaction}{else}ofbank_manager.php?invoice={$invoice}{/if}" enctype="multipart/form-data" >

<table width="100%" cellspacing="0" cellpadding="0" class="frame">
<tr>
	<td>
	<table width="100%" border="0" cellpadding="10" cellspacing="0">
		<tr>
			<td width="150" class="fieldarea">شماره فاکتور</td>
			<td><a target="_blank" href="viewinvoice.php?id={$invoice}">{$invoice}</a></td>
		</tr>
		<tr>
			<td width="150" class="fieldarea">نوع سند<span style="color:red" >*</span></td>
			<td>
			<select name="doc_id" onchange="ofbank_change_doc(this)">
				{if !$docs }<option value="" ></option>{/if}
				{section name=i loop=$docs}
					<option value="{$smarty.section.i.index}" {if $docs[i] == $docname } selected="selected" {/if} >{$docs[i]}</option>
				{/section}
			</select>
			</td>
		</tr>
		<tr>
			<td width="150" class="fieldarea">مبلغ</td>
			<td><input name="amount" type="text" size="40" value="{$amount}"></td>
		</tr>
		<tr>
			<td width="150" class="fieldarea">تاریخ سند<span style="color:red" >*</span></td>
			<td>
				سال&nbsp;<input name="docdate_year" type="text" size="4" maxlength="4" value="{$docdate_year}">
				&nbsp;ماه&nbsp;<input name="docdate_month" type="text" size="4" maxlength="2" value="{$docdate_month}">
				&nbsp;روز&nbsp;<input name="docdate_day" type="text" size="4" maxlength="2" value="{$docdate_day}">
			</td>
		</tr>
		<tr>
			<td width="150" class="fieldarea">شماره فیش<span style="color:red" >*</span></td>
			<td><input name="paynum" type="text" size="40" onkeypress="return filterInput(1, event)" value="{$paynum}"></td>
		</tr>
		<tr>
			<td width="150" class="fieldarea">نام بانک<span style="color:red" >*</span></td>
			<td>
			<select name="bank_name">
				{if !$banks }<option value="" ></option>{/if}
				{section name=i loop=$banks}
					<option value="{$banks[i]}" {if $banks[i] == $bank_name } selected="selected" {/if} >{$banks[i]}</option>
				{/section}
			</select>
			</td>
		</tr>
		{section name=i loop=$customfields}
		<tr {if !$customfields[i].show } style="display:none;" {/if}class="showon {foreach name=option from=$customfields[i].showon item=showonclass} showon{$showonclass} {/foreach}">
			<td width="150" class="fieldarea">{$customfields[i].name} {if $customfields[i].required }<span style="color:red" >*</span>{/if}</td>
			<td>
			{assign var="cusval" value=$customfields[i].id}
			{assign var="cusval" value=$custom_fields_vals.$cusval}
			{if $customfields[i].type == 'dropdown' }
				<select name="customfield[{$customfields[i].id}]">
				{foreach name=option from=$customfields[i].options item=option}
					<option value="{$option}"  {if $cusval == $option }selected{/if}>{$option}</option>
				{/foreach}
				</select>
			{elseif $customfields[i].type == 'tickbox' }
			<input type="checkbox" name="customfield[{$customfields[i].id}]" {if $cusval == 'on' }checked{/if}>
			{elseif $customfields[i].type == 'textarea' }
			<textarea name="customfield[{$customfields[i].id}]" cols="80" >{if $cusval}{$cusval}{/if}</textarea>
			{else}
			<input type="text" name="customfield[{$customfields[i].id}]"  value="{if $cusval}{$cusval}{/if}" >
			{/if}
			{$customfields[i].desc}
			</td>
		</tr>
		{/section}
		<tr>
			<td width="150" class="fieldarea">{if $scan == true } <a href="offlinebank/client_img_viewer.php?image_row={$row}" target="_blank">اسکن فیش</a> {else}اسکن فیش{/if}</td>
			<td><input name="scan" type="file"></td>
		</tr>
		<tr>
			<td width="150" class="fieldarea">توضیحات</td>
			<td><textarea name="comment" rows=2 cols=80>{$comment}</textarea></td>
		</tr>
	</table>
	</td>
</tr>
</table>

<input type="hidden" name="email" value="{$email}">

    <p align="center">

        {if $act == "prepare" }
            <input type="hidden" name="act" value="register">
            <input type="submit" value="ثبت" class="button" />
        {else}
            <input type="hidden" name="act" value="edit">
            <input type="submit" value="ویرایش" class="button" />
        {/if}

    </p>
</div>
</form>