{include file="$template/pageheader.tpl" title=$LANG.rcdns_zonedns desc=$domain}

<script language="javascript" type="text/javascript">
	function confirmDelete(){literal}{{/literal}return confirm("{$LANG.rcdns_deleterecordwarn}");{literal}}{/literal}
</script>

<p>{$LANG.rcdns_dnsmanageintrotitle}</p>

{if $recorddeletederror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$recorddeletederror}
    </ul>
</div>
{/if}

{if $recorddeletedsuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$recorddeletedsuccess}
    </ul>
</div>
{/if}

{if $nschangeerror}
<br />
<div class="alert alert-error">
    <p class="bold">{$LANG.clientareaerrors}</p>
    <ul>
        {$nschangeerror}
    </ul>
</div>
{/if}

{if $nschangesuccess}
<br />
<div class="alert alert-success">
	<p class="bold">{$LANG.moduleactionsuccess}</p>
    <ul>
        {$nschangesuccess}
    </ul>
</div>
{/if}

{if $nsserversok != 1}

{literal}<script language="javascript" type="text/javascript">function showdnscheckform(){jQuery("#dnscheck").slideToggle();}</script>{/literal}

<div class="alert alert-warning">
	{$LANG.rcdns_domdnsconfigerror1}&nbsp;<a href="#" onclick="showdnscheckform();return false;">{$LANG.rcdns_clickherelink}</a><br/>
</div>

<div style="display:none;" id="dnscheck">
	<br/>
	<h3>
		{$LANG.rcdns_nameservertitle}
	</h3>
	<p>
		{$LANG.rcdns_nsserversolutiontitle}
	</p>
	<p>
		<strong>{$LANG.rcdns_note}:</strong> {$LANG.rcdns_dnsconfigapplied}
	</p>
	<table class="table table-striped table-framed">
		<thead>
			<tr>
				<th class="textcenter" colspan="2">
					{$LANG.rcdns_nsserversolution}
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="50%" style="vertical-align:top">
					<p class="label terminated">
						{$LANG.currentnameservers}
					</p>
					{foreach key=num item=actualdns from=$configurednsservers.0}
					{$actualdns}<br />
					{/foreach}
				</td>
				<td width="50%" style="vertical-align:top">
					<p class="label active">
						{$LANG.recommendednameservers}
					</p>
					{foreach key=num item=defaultdns from=$requirednsservers.0}
					{$defaultdns}<br />
					{/foreach}
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<form method="post" action="dnsmanagement.php?action=managednszone">
						<input type="hidden" name="domainid" value="{if $domainid}{$domainid}{else}{$id}{/if}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						{foreach key=num item=defaultdns from=$requirednsservers.0}
						<input type="hidden" name="ns[]" value="{$defaultdns}"/>
						{/foreach}
						<input type="hidden" name="changens" value="true"/>
						<p align="center"><input type="submit" {if $nsserversok == 1}disabled="disabled"{/if} value="{$LANG.rcdns_changednsbutton}" class="btn btn-success"/></p>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
{/if}

<br /><br />

<table class="table table-striped table-framed">
	<thead>
		<tr>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="A"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} A Records" {if $smarty.request.nsrecordtype=="A"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="AAAA"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} AAAA Records" {if $smarty.request.nsrecordtype=="AAAA"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="CNAME"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} CNAME Records" {if $smarty.request.nsrecordtype=="CNAME"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="MX"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} MX Records" {if $smarty.request.nsrecordtype=="MX"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
		</tr>
	</thead>
	<thead>
		<tr>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="NS"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} NS Records" {if $smarty.request.nsrecordtype=="NS"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="TXT"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} TXT Records" {if $smarty.request.nsrecordtype=="TXT"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="SRV"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} SRV Records" {if $smarty.request.nsrecordtype=="SRV"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
			<th class="textcenter">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="nsrecordtype" value="SOA"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_domainadminister} SOA" {if $smarty.request.nsrecordtype=="SOA"}disabled="disabled"{/if} class="btn"/>
				</form>
			</th>
		</tr>
	</thead>
</table>

<br/>

{if $recordtype neq "SOA"}
<div class="searchbox">
	<div style="float:left;padding:0px 3px 2px 0px;">
		<form method="POST" action="dnsmanagement.php?action=managednszoneadd">
			<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
			<input type="hidden" name="domainid" value="{$domainid}"/>
			<input type="hidden" name="domain" value="{$domain}"/>
			<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
			<input type="hidden" name="page" value="{$pagenumber}"/>
			<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
			<input type="hidden" name="q" value="{$q}"/>
			<input type="submit" value="{$LANG.rcdns_addanewrecord} {$recordtype} Record" class="btn btn-info"/>
		</form>
	</div>
	{if $googleapps}
		{if $recordtype eq "A" || $recordtype eq "AAAA" || $recordtype eq "MX" || $recordtype eq "CNAME" || $recordtype eq "SRV" || $recordtype eq "TXT"}
			<div style="float:left;padding:0px 3px 3px 0px;">
				<form method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="googleapps" value="true"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_googlecreaterecs} {$recordtype} Records" class="btn btn-info"/>
				</form>
			</div>
		{/if}
	{/if}
	<div style="float:left;padding:0px 3px 3px 0px;">
		<form method="POST" action="dnsmanagement.php?action=managednszoneview">
			<input type="hidden" name="domainid" value="{if $domainid}{$domainid}{else}{$id}{/if}"/>
			<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
			<input type="hidden" name="nsrecordtype" value="{if $recordtype}{$recordtype}{else}A{/if}"/>
			<input type="hidden" name="domain" value="{$domain}"/>
			<input type="submit" value="{$LANG.rcdns_dnsoverviewbutton}" class="btn"/>
		</form>	
	</div>
</div>
{/if}
	
<h3>{$LANG.rcdns_domainadminister} {$recordtype} Records</h3>

<br /><br />

{if $recordtype neq "SOA"}
<div class="searchbox">
    <form method="post" action="dnsmanagement.php?action=managednszone">
        <div class="input-append">
		<input type="text" name="q" value="{if $q}{$q}{else}{$LANG.rcdns_searchenterdomain}{/if}" class="input-medium appendedInputButton" onfocus="if(this.value=='{$LANG.rcdns_searchenterdomain}')this.value=''" />
		<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
		<input type="hidden" name="domainid" value="{$domainid}"/>
		<input type="hidden" name="domain" value="{$domain}"/>
		<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
        <input type="submit" value="{$LANG.searchfilter}" class="btn btn-info" />
		</div>
    </form>
</div>
{/if}

<br />

<p>{$numproducts} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<script language="javascript" type="text/javascript">
	{literal}
		jQuery(document).ready(function() {
			jQuery("#select-all-records").click(function() {
				var checkBoxes = jQuery("input[name=multidelete\\[\\]]");
				checkBoxes.prop("checked", !checkBoxes.prop("checked"));
			});                 
		});	
	{/literal}
</script>

{if $recordtype eq "A" || $recordtype eq "AAAA" || $recordtype eq "CNAME" || $recordtype eq "NS" || $recordtype eq "TXT"}
<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th {if $orderby eq "host"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=host&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_searchnametitle}</a></th>
			<th {if $orderby eq "value"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=value&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_txtrecordvalue}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_ttltitle}</a></th>
			<th {if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=status&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_dnsrecordstatus}</a></th>
			<th colspan="2" align="center"><a href="#" onclick="return false">{$LANG.rcdns_dnsactions}</a></th>
			<th><input id="select-all-records" type="checkbox" /></th>
		</tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$searchdataKey}
		<tr>
			<td>{$service.host}.{$domain}</td>
			<td><div style="width: 250px; word-wrap: break-word;">{$service.value}</div></td>
			<td>{$service.timetolive}</td>
			<td>{if $service.status eq "Active"}<span class="label active">{$LANG.clientareaactive}</span>{else}<span class="label suspended">{$LANG.clientareasuspended}</span>{/if}</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszonemodify">
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden">
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.host}"/>
					<input type="hidden" name="value" value="{$service.value}"/>
					<input type="hidden" name="currentvalue" value="{$service.value}"/>
					<input type="hidden" name="ttl" value="{$service.timetolive}"/>
					<input type="submit" value="{$LANG.rcdns_modifybutton}" class="btn btn-info"/>
				</form>
			</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszone" onclick="return confirmDelete();">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.host}"/>
					<input type="hidden" name="value" value="{$service.value}"/>
					<input type="submit" value="{$LANG.rcdns_deletebutton}" class="btn btn-danger"/>
				</form>
			</td>
			<td><input name="multidelete[]" type="checkbox" value="{$service.host},{$service.value}" class="checkbox"/></td>
		</tr>
		{foreachelse}
		<tr>
			<td colspan="7">{$LANG.norecordsfound}</td>
	    </tr>
		{/foreach}
		<tr>
			<td colspan="7">
				{if $searchdataKey}
				<div style="float:right;">
					<form id="multidelete" method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_multideletebutton}" class="btn btn-danger" onclick="return confirmDelete();" />
					</form>
				</div>
				{/if}
				{if $q neq ""}
				<div style="float:left;">
					<form method="post" action="dnsmanagement.php?action=managednszone">
						<input type="hidden" name="q" value=""/> 
						<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
						<input type="submit" value="{$LANG.rcdns_deletesearchquerybutton}" class="btn btn-success"/>
					</form>
				</div>
				{/if}
			</td>
		</tr>
	</tbody>
</table>
{/if}

{if $recordtype eq "MX"}
<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th {if $orderby eq "host"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=host&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_searchnametitle}</a></th>
			<th {if $orderby eq "value"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=value&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_txtrecordvalue}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_ttltitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_prioritytitle}</a></th>
			<th {if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=status&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_dnsrecordstatus}</a></th>
			<th colspan="2" align="center"><a href="#" onclick="return false">{$LANG.rcdns_dnsactions}</a></th>
			<th><input id="select-all-records" type="checkbox" /></th>
		</tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$searchdataKey}
		<tr>
			<td>{$service.host}.{$domain}</td>
			<td><div style="width: 250px; word-wrap: break-word;">{$service.value}</div></td>
			<td>{$service.timetolive}</td>
			<td>{$service.priority}</td>
			<td>{if $service.status eq "Active"}<span class="label active">{$LANG.clientareaactive}</span>{else}<span class="label suspended">{$LANG.clientareasuspended}</span>{/if}</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszonemodify">
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.host}"/>
					<input type="hidden" name="value" value="{$service.value}"/>
					<input type="hidden" name="currentvalue" value="{$service.value}"/>
					<input type="hidden" name="ttl" value="{$service.timetolive}"/> 
					<input type="hidden" name="priority" value="{$service.priority}"/>
					<input type="submit" value="{$LANG.rcdns_modifybutton}" class="btn btn-info"/>
				</form>
			</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszone" onclick="return confirmDelete();">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden">
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.host}"/>
					<input type="hidden" name="value" value="{$service.value}"/>
					<input type="submit" value="{$LANG.rcdns_deletebutton}" class="btn btn-danger"/>
				</form>
			</td>
			<td>
				<input name="multidelete[]" type="checkbox" value="{$service.host},{$service.value}" class="checkbox"/>
			</td>
		</tr>
		{foreachelse}
		<tr>
			<td colspan="8">{$LANG.norecordsfound}</td>
	    </tr>
		{/foreach}
		<tr>
			<td colspan="8">
				{if $searchdataKey}
				<div style="float:right;">
					<form id="multidelete" method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_multideletebutton}" class="btn btn-danger" onclick="return confirmDelete();" />
					</form>
				</div>
				{/if}
				{if $q neq ""}
				<div style="float:left;">
					<form method="post" action="dnsmanagement.php?action=managednszone">
						<input type="hidden" name="q" value=""/> 
						<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
						<input type="submit" value="{$LANG.rcdns_deletesearchquerybutton}" class="btn btn-success"/>
					</form>
				</div>
				{/if}
			</td>
		</tr>
	</tbody>
</table>
{/if}
{if $recordtype eq "SRV"}
<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th {if $orderby eq "host"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=host&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_searchnametitle}</a></th>
			<th {if $orderby eq "value"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=value&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_txtrecordvalue}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_ttltitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_prioritytitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_weighttitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_porttitle}</a></th>
			<th {if $orderby eq "status"} class="headerSort{$sort}"{/if}><a href="dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&orderby=status&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&sort={if $sort eq "desc"}asc{else}desc{/if}&page={$pagenumber}&itemlimit={$itemlimit}">{$LANG.rcdns_dnsrecordstatus}</a></th>
			<th align="center" colspan="2"><a href="#" onclick="return false">{$LANG.rcdns_dnsactions}</a></th>
			<th><input id="select-all-records" type="checkbox" /></th>
		</tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$searchdataKey}
		<tr>
			<td>{$service.host}.{$domain}</td>
			<td><div style="width: 130px; word-wrap: break-word;">{$service.value}</div></td>
			<td>{$service.timetolive}</td>
			<td>{$service.priority}</td>
			<td>{$service.weight}</td>
			<td>{$service.port}</td>
			<td>{if $service.status eq "Active"}<span class="label active">{$LANG.clientareaactive}</span>{else}<span class="label suspended">{$LANG.clientareasuspended}</span>{/if}</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszonemodify">
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.host}"/>
					<input type="hidden" name="value" value="{$service.value}"/>
					<input type="hidden" name="currentvalue" value="{$service.value}"/>
					<input type="hidden" name="ttl" value="{$service.timetolive}"/>
					<input type="hidden" name="priority" value="{$service.priority}"/>
					<input type="hidden" name="weight" value="{$service.weight}"/>
					<input type="hidden" name="port" value="{$service.port}"/>
					<input type="submit" value="{$LANG.rcdns_modifybutton}" class="btn btn-info"/>
				</form>
			</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszone" onclick="return confirmDelete();">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.host}"/>
					<input type="hidden" name="value" value="{$service.value}"/>
					<input type="hidden" name="weight" value="{$service.weight}"/>
					<input type="hidden" name="port" value="{$service.port}"/>
					<input type="submit" value="{$LANG.rcdns_deletebutton}" class="btn btn-danger"/>
				</form>
			</td>
			<td>
				<input name="multidelete[]" type="checkbox" value="{$service.host},{$service.value},{$service.port},{$service.weight}" class="checkbox"/>
			</td>
		</tr>
		{foreachelse}
		<tr>
			<td colspan="10">{$LANG.norecordsfound}</td>
	    </tr>
		{/foreach}
		<tr>
			<td colspan="10">
				{if $searchdataKey}
				<div style="float:right;">
					<form id="multidelete" method="POST" action="dnsmanagement.php?action=managednszone">
					<input type="hidden" name="delete" value="true"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="page" value="{$pagenumber}"/>
					<input type="hidden" name="itemlimit" value="{$itemlimit}"/>
					<input type="hidden" name="q" value="{$q}"/>
					<input type="submit" value="{$LANG.rcdns_multideletebutton}" class="btn btn-danger" onclick="return confirmDelete();" />
					</form>
				</div>
				{/if}
				{if $q neq ""}
				<div style="float:left;">
					<form method="post" action="dnsmanagement.php?action=managednszone">
						<input type="hidden" name="q" value=""/> 
						<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
						<input type="submit" value="{$LANG.rcdns_deletesearchquerybutton}" class="btn btn-success"/>
					</form>
				</div>
				{/if}
			</td>
		</tr>
	</tbody>
</table>
{/if}
{if $recordtype eq "SOA"}
<table class="table table-striped table-framed">
    <thead>
        <tr>
			<th><a href="#" onclick="return false">{$LANG.rcdns_soaprimaryns}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_soaresponsibleperson}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_ttltitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_soaexpiretitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_soarefreshtitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_soaretrytitle}</a></th>
			<th><a href="#" onclick="return false">{$LANG.rcdns_dnsrecordstatus}</a></th>
			<th align="center"><a href="#" onclick="return false">{$LANG.rcdns_dnsactions}</a></th>
		</tr>
	</thead>
	<tbody>
		{foreach key=num item=service from=$searchdataKey}
		<tr>
			<td><div style="width: 140px; word-wrap: break-word;">{$service.primaryns}</div></td>
			<td><div style="width: 140px; word-wrap: break-word;">{$service.responsibleperson}</div></td>
			<td>{$service.ttl}</td>
			<td>{$service.expire}</td>
			<td>{$service.refresh}</td>
			<td>{$service.retry}</td>
			<td>{if $service.status eq "Active"}<span class="label active">{$LANG.clientareaactive}</span>{else}<span class="label suspended">{$LANG.clientareasuspended}</span>{/if}</td>
			<td>
				<form method="POST" action="dnsmanagement.php?action=managednszonemodify">
					<input type="hidden" name="domainid" value="{$domainid}"/>
					<input name="freednshosting" value="{$freednshosting}" type="hidden"/>
					<input type="hidden" name="nsrecordtype" value="{$recordtype}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					<input type="hidden" name="host" value="{$service.primaryns}"/>
					<input type="hidden" name="responsibleperson" value="{$service.responsibleperson}"/>
					<input type="hidden" name="ttl" value="{$service.ttl}"/>
					<input type="hidden" name="soaexpire" value="{$service.expire}"/>
					<input type="hidden" name="soarefresh" value="{$service.refresh}"/>
					<input type="hidden" name="soaretry" value="{$service.retry}"/>
					<input type="submit" value="{$LANG.rcdns_modifybutton}" class="btn btn-info"/>
				</form>
			</td>
		</tr>
		{foreachelse}
		<tr>
			<td align="center" colspan="11">{$LANG.norecordsfound}</td>
		</tr>
		{/foreach}
	</tbody>
</table>
{/if}

<script language="javascript" type="text/javascript">
	{literal}
		jQuery('#multidelete').on('submit',function(e){
			$form=jQuery(this);
			jQuery('input[type=checkbox]:checked').each(function(index,elem){
				var val=jQuery(elem).val(),name=jQuery(elem).attr('name');
				var hiddenInput=jQuery('<input type="hidden" value="'+val+'" name="'+name+'"/>');
				$form.append(hiddenInput);
			});
		});
	{/literal}
</script>
<br />

<div class="recordslimit">
	<form action="dnsmanagement.php">
		<input type="hidden" name="action" value="managednszone" />
		<select name="itemlimit" id="itemlimit" onchange="this.form.submit();">
			<option>{$LANG.resultsperpage}</option>
			<option value="10"{if $itemlimit==10} selected{/if}>10</option>
			<option value="25"{if $itemlimit==25} selected{/if}>25</option>
			<option value="50"{if $itemlimit==50} selected{/if}>50</option>
			<option value="100"{if $itemlimit==100} selected{/if}>100</option>
			<option value="all"{if $itemlimit > 100} selected{/if}>{$LANG.clientareaunlimited}</option>
		</select>
		<input type="hidden" name="domainid" value="{$domainid}" />
		<input type="hidden" name="domain" value="{$domain}" />
		<input type="hidden" name="freednshosting" value="{$freednshosting}" />
		<input type="hidden" name="nsrecordtype" value="{$recordtype}" />
	</form>
</div>

<div class="pagination">
    <ul>
        <li class="prev{if !$prevpage} disabled{/if}"><a href="{if $prevpage}dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&amp;page={$prevpage}&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
        <li class="next{if !$nextpage || $nextpage==$pageend} disabled{/if}"><a href="{if $nextpage != $pageend}dnsmanagement.php?action=managednszone{if $q}&q={$q}{/if}&amp;page={$nextpage}&domainid={$domainid}&domain={$domain}&freednshosting={$freednshosting}&nsrecordtype={$recordtype}&itemlimit={$itemlimit}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
    </ul>
</div>

<br/>

<form method="post" action="clientarea.php?action={if empty($freednshosting) || $freednshosting eq "false"}productdetails{else}domaindetails{/if}">
	<input type="hidden" name="id" value="{if $domainid}{$domainid}{else}{$id}{/if}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<p align="center"><input type="submit" value="{$LANG.clientareabacklink}" class="btn"/></p>
</form>
