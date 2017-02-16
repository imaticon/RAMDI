{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdns_dnsoverviewtitledesc|cat:$domain}

<table class="table table-bordered table-hover">
	<tr>
		<td>{$LANG.rcdns_recordtype}</td>
		<td>{$LANG.rcdns_searchnametitle}</td>
		<td>{$LANG.rcdns_txtrecordvalue}</td>
		<td>{$LANG.rcdns_ttltitle}</td>
		<td>{$LANG.rcdns_prioritytitle}</td>
		<td>{$LANG.rcdns_weighttitle}</td>
		<td>{$LANG.rcdns_porttitle}</td>
		<td>{$LANG.rcdns_dnsrecordstatus}</td>
	</tr>
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
</table>
