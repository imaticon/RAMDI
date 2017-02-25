{include file="$template/pageheader.tpl" title=$LANG.rcdns_zonedns desc=$domain}

<p><strong>{$LANG.rcdns_note}:</strong></p>
<p>&bull;{$LANG.rcdns_howtonsdesc1} &quot;<strong>*</strong>&quot;<br/ >&bull;{$LANG.rcdns_howtonsdesc2} &quot;<strong>@</strong>&quot;</p><br/>

{if $addrecorderror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$addrecorderror}
    </ul>
</div>
{/if}

{if $addrecordsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$addrecordsuccess}
    </ul>
</div>
{/if}


<form method="post" action="dnsmanagement.php?action=managednszoneadd">
	<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
	<input type="hidden" name="freednshosting" value="{$freednshosting}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="add" value="true"/>
	<input type="hidden" name="value" value="{$valuerecord}"/>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="2">
					<h3>{$LANG.rcdns_onlyaddword} {$recordtype} Record {$LANG.rcdns_onlyforword}: {$domain}</h3>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					{if $recordtype eq "SRV"}
					<strong>{$LANG.rcdns_srvrecordhost}</strong>
					{else}
					<strong>{$LANG.rcdns_recordhostname}</strong>
					{/if}
				</td>
				<td>
					<input name="host" type="text" value="{if $hostrecord}{$hostrecord}{/if}" size="10"/><strong>.{$domain}</strong>				</td>
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
				{/if}
			</td>
			<td>
				{if $recordtype eq "TXT"}
				<textarea name="value" class="fullwidth" cols="50" rows="7">{if $valuerecord}{$valuerecord}{/if}</textarea>
				{else}
				<input name="value" type="text" value="{if $valuerecord}{$valuerecord}{/if}" size="60"/>
				{/if}			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_ttltitle}</strong>
			</td>
			<td>
				<input name="ttl" type="text" value="{if $ttlrecord}{$ttlrecord}{/if}" size="4"/> 
				{$LANG.rcdns_ttladddesc}
			</td>
		</tr>
		{if $recordtype eq "MX"}
		<tr>
			<td>
				<strong>{$LANG.rcdns_prioritytitle}</strong>
			</td>
			<td>
				<input name="priority" type="text" value="{if $priorityrecord}{$priorityrecord}{/if}" size="4"/>
			</td>
		</tr>
		{/if}
		{if $recordtype eq "SRV"}
		<tr>
			<td>
				<strong>{$LANG.rcdns_prioritytitle}</strong>
			</td>
			<td>
				<input name="priority" type="text" value="{if $priorityrecord}{$priorityrecord}{/if}" size="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_weighttitle}</strong>
			</td>
			<td>
				<input name="weight" type="text" value="{if $weightrecord}{$weightrecord}{/if}" size="4"/>
			</td>
		</tr>
		<tr>
			<td>
				<strong>{$LANG.rcdns_porttitle}</strong></td>
			<td>
				<input name="port" type="text" value="{if $portrecord}{$portrecord}{/if}" size="4"/>
			</td>
		</tr>
		{/if}
		<tr>
			<td colspan="3">
				<p align="center"><input type="submit" value="{$LANG.rcdns_buttonzonednsadd}" class="btn btn-success"/></p>
			</td>
		</tr>
	</table>
</form>

<br />

<form method="post" action="dnsmanagement.php?action=managednszone">
	<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
	<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
	<input name="domain" value="{$domain}" type="hidden"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>
