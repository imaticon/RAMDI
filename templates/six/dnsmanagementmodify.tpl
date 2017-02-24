<div class="alert alert-info">
	<p><strong>{$LANG.rcdns_note}:</strong></p>
	<ul>
		<li>{$LANG.rcdns_howtonsdesc1} &quot;<strong>*</strong>&quot;</li>
		<li>{$LANG.rcdns_howtonsdesc2} &quot;<strong>@</strong>&quot;</li>
	</ul>
</div>

{if $modifyrecorderror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$modifyrecorderror}
    </ul>
</div>
{/if}

{if $modifyrecordsuccess}
<br />
<div class="alert alert-success">
	<p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$modifyrecordsuccess}
    </ul>
</div>
{/if}


<form method="post" action="dnsmanagement.php?action=managednszonemodify">
	<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
	<input type="hidden" name="freednshosting" value="{$freednshosting}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="modify" value="true"/>
	<input type="hidden" name="currentvalue" value="{if $smarty.post.modify eq "true" && !$modifyrecorderror}{$valuerecord}{else}{$currentvalue}{/if}"/>
	<input type="hidden" name="isvalue" value="{$currentvalue}"/>
	<table class="table table-bordered table-hover">
		<tr>
			<td class="textcenter" colspan="2">
				<h3>
					{$LANG.rcdns_onlymodifyword}
					{if $recordtype eq "SOA"}
					{$recordtype} Record: {$domain}
					{else}
					{$recordtype} Record: {$hostrecord}.{$domain}
					{/if}
				</h3>
			</td>
		</tr>
		<tr>
			<td>
				{if $recordtype eq "SRV"}
				<strong>{$LANG.rcdns_srvrecordhost}</strong>
				{elseif $recordtype eq "SOA"}
				<strong>{$LANG.rcdns_soaprimaryns}</strong>
				{else}
				<strong>{$LANG.rcdns_recordhostname}</strong>
				{/if}
			</td>
			<td>
				{if $recordtype eq "SOA"}
				<input name="host" type="hidden" value="{$hostrecord}"/>
				<span><strong>{$hostrecord}</strong></span>
				{else}
				<input name="host" type="hidden" value="{$hostrecord}"/>
				<span><strong>{$hostrecord}.{$domain}</strong></span>
				{/if}
			</td>
		</tr>
		<tr>
			<td>
				{if $recordtype eq "A"}
				<strong>{$LANG.rcdns_ipv4recordvalue}</strong>
				{elseif $recordtype eq "AAAA"}
				<strong>{$LANG.rcdns_ipv6recordvalue}</strong>
				{elseif $recordtype eq "CNAME"}
				<strong>{$LANG.rcdns_cnamerecordvalue}</strong>
				{elseif $recordtype eq "NS"}
				<strong>{$LANG.rcdns_nsrecordvalue}</strong>
				{elseif $recordtype eq "TXT"}
				<strong>{$LANG.rcdns_txtrecordvalue}</strong>
				{elseif $recordtype eq "MX"}
				<strong>{$LANG.rcdns_mxrecordvalue}</strong>
				{elseif $recordtype eq "SRV"}
				<strong>{$LANG.rcdns_srvrecordvalue}</strong>
				{elseif $recordtype eq "SOA"}
				<strong>{$LANG.rcdns_soaresponsibleperson}</strong>
				{/if}
			</td>
			<td>
				{if $recordtype eq "TXT"}
				<textarea name="value" class="form-control" cols="50" rows="7">{if $valuerecord}{$valuerecord}{/if}</textarea>
				{elseif $recordtype eq "SOA"}
				<input class="form-control" name="responsibleperson" type="text" value="{if $responsibleperson}{$responsibleperson}{/if} " size="60"/>
				{else}
				<input name="value" class="form-control" type="text" value="{if $valuerecord}{$valuerecord}{/if}" size="60"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_ttltitle}</strong>
			</td>
			<td>
				<input name="ttl" class="form-control" type="text" value="{if $ttlrecord}{$ttlrecord}{/if}" size="4"/>
				{$LANG.rcdns_ttlmodifydesc}
			</td>
		</tr>
		{if $recordtype eq "MX"}
		<tr>
			<td>
				<strong>{$LANG.rcdns_prioritytitle}</strong>
			</td>
			<td>
				<input name="priority" class="form-control" type="text" value="{if $priorityrecord}{$priorityrecord}{/if}" size="4"/>
			</td>
		</tr>
		{/if}
		{if $recordtype eq "SRV"}
		<tr>
			<td>
				<strong>{$LANG.rcdns_prioritytitle}</strong>
			</td>
			<td>
				<input name="priority" class="form-control" type="text" value="{if $priorityrecord}{$priorityrecord}{/if}" size="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_weighttitle}</strong>
			</td>
			<td>
				<input name="weight" class="form-control" type="text" value="{if $weightrecord}{$weightrecord}{/if}" size="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_porttitle}</strong>
			</td>
			<td>
				<input name="port" class="form-control" type="text" value="{if $portrecord}{$portrecord}{/if}" size="4"/>
			</td>
		</tr>
		{/if}
		{if $recordtype eq "SOA"}
		<tr>
			<td>
				<strong>{$LANG.rcdns_soaexpiretitle}</strong>
			</td>
			<td>
				<input name="soaexpire" class="form-control" type="text" value="{if $soaexpire}{$soaexpire}{/if}" size="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_soaretrytitle}</strong>
			</td>
			<td>
				<input name="soaretry" class="form-control" type="text" value="{if $soaretry}{$soaretry}{/if}" size="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_soarefreshtitle}</strong>
			</td>
			<td>
				<input name="soarefresh" class="form-control" type="text" value="{if $soarefresh}{$soarefresh}{/if}" size="4"/>
			</td>
		</tr>
		{/if}
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcdns_buttonzonednsmodify}" class="btn btn-success"/></p>
			</td>
		</tr>
</table>
</form>
