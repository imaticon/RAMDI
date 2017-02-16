{include file="$template/pageheader.tpl" title=$LANG.rcdns_dnsoverviewtitle desc=$domain}

<p>{$LANG.rcdns_dnsoverviewtitledesc} <strong>{$domain}</strong></p><br />

<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th>{$LANG.rcdns_recordtype}</th>
			<th>{$LANG.rcdns_searchnametitle}</th>
			<th>{$LANG.rcdns_txtrecordvalue}</th>
			<th>{$LANG.rcdns_ttltitle}</th>
			<th>{$LANG.rcdns_prioritytitle}</th>
			<th>{$LANG.rcdns_weighttitle}</th>
			<th>{$LANG.rcdns_porttitle}</th>
			<th>{$LANG.rcdns_dnsrecordstatus}</th>
		</tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$dnsrecords}
		<tr>
			<td>{$service.type}</td>
			<td><div style="width: 200px; word-wrap: break-word;">{$service.hostname}</div></td>
			<td><div style="width: 150px; word-wrap: break-word;">{$service.value}</div></td>
			<td>{$service.timetolive}</td>
			<td>{$service.priority}</td>
			<td>{$service.weight}</td>
			<td>{$service.port}</td>
			<td>{$service.status}</td>
		</tr>
		{foreachelse}
		<tr>
			<td colspan="8">{$LANG.norecordsfound}</td>
	    </tr>
		{/foreach}		
	</tbody>
</table>

<form method="post" action="{$smarty.server.PHP_SELF}?action=managednszone">
	<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
	<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
	<input name="domain" value="{$domain}" type="hidden"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>
