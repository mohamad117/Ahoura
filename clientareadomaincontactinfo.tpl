{php}
$did = $this->_tpl_vars['domainid'];
$result = select_query("tbldomains", "status",
                "id = ".$did);
if($data = mysql_fetch_array($result)) {
	$this->_tpl_vars['status'] = $data['status'];
}
{/php}
<h2>{$LANG.domaincontactinfo}</h2>
<p>{$LANG.domainname}: <strong>{$domain}</strong></p>
<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts">
  <input type="hidden" name="sub" value="save">
  <input type="hidden" name="domainid" value="{$domainid}">
  {foreach key=contactdetail item=values from=$contactdetails}
	{assign var="contactlabel" value=$contactdetail|replace:' ':''}
	{assign var="contactlabel" value=IRNIC_CONTACTDETAIL_$contactlabel}
	{assign var="contactlabel" value=$LANG.$contactlabel}
	{if !$contactlabel}
	{assign var="contactlabel" value=$contactdetail}
	{/if}
  <p><strong>{$contactlabel}</strong></p>
  <table width="100%" border="0" cellpadding="10" cellspacing="0">
    {foreach key=name item=value from=$values}
    <tr>
		{assign var="contactlabel" value=$name|replace:' ':''}
		{assign var="contactlabel" value=IRNIC_CONTACTDETAIL_$contactlabel}
		{assign var="contactlabel" value=$LANG.$contactlabel}
		{if !$contactlabel}
		{assign var="contactlabel" value=$name}
		{/if}
      <td width=120 align="right">{$contactlabel}</td>
	  {if is_null($value) }
	  <td></td>
	  {else}
		{if $status != 'Active'}
			  <td>{$value}</td>
		{else}
	  <td><input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" size="30"></td>
		{/if}
	  {/if}
    </tr>
    {/foreach}
  </table>
  {/foreach}
  {if $status == 'Active'} 
  <p align="center">
    <input type="submit" value="{$LANG.clientareasavechanges}">
  </p>
  {/if}
</form>
<form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails">
  <input type="hidden" name="id" value="{$domainid}" />
  <p align="center">
    <input type="submit" value="{$LANG.clientareabacklink}" />
  </p>
</form><br />