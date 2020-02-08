<div class="successbox">{$LANG.IRNIC_HANDLE_CREATED_SUCCESS}</div>


<form id="checkoutfrm" name="checkoutfrm" method="post" action="cart.php?a=checkout">
<input type="hidden" name="change_irnic_handle"  value="change_irnic_handle" />
<input type="hidden" name="irnic_handle" value="{$irnic_contact_id}" />
</form>

<div class="contentbox">
{if $cartcontainirdomain }<a href="javascript:void(0);" onclick="checkoutfrm.submit()">ادامه خرید</a> |{/if}
<a href="irnic.php">ثبت شناسه جدید</a>
</div>


<table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="10" cellspacing="0">
                <tr>
                    <td width="150" class="fieldarea">{$LANG.IRNIC_HANDLE_CONTACT}</td>
                    <td>{$irnic_contact_id}</td>
                </tr>
            </table>
        </td>
    </tr>
</table>
	