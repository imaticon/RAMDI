{if $isactivated}

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdns_activatedomfwddesc|cat:$domain}

{if $fwderror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$fwderror}
    </ul>
</div>
{/if}

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managedomfwd">
	<input type="hidden" name="id" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<input type="hidden" name="activatefwd" value="true"/>
	<p><input type="submit" {if $disabled}{$disabled}{/if} value="{$LANG.rcdns_activatedomfwdbutton}" class="btn btn-success"/></p>
</form>

{else}

{if $nschangeerror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$nschangeerror}
    </ul>
</div>
{/if}

{if $nschangesuccess}
<br />
<div class="alert alert-success">
	<p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$nschangesuccess}
    </ul>
</div>
{/if}

{if $fwderror}
<br />
<div class="alert alert-danger">
    <p>{$LANG.clientareaerrors}</p>
    <ul>
        {$fwderror}
    </ul>
</div>
{/if}

{if $fwdsuccess}
<br />
<div class="alert alert-success">
	<p>{$LANG.moduleactionsuccess}</p>
    <ul>
        {$fwdsuccess}
    </ul>
</div>
{/if}

{if $nsserversok != 1}

<script language="javascript" type="text/javascript">
	{literal}function showdnscheckform(){jQuery("#dnscheck").slideToggle();}{/literal}
</script>

<div class="alert alert-warning">
	{$LANG.rcdns_domdnsconfigerror1}&nbsp;<a href="#" onclick="showdnscheckform();return false;">{$LANG.rcdns_clickherelink}</a><br />
</div>

<div style="display:none;" id="dnscheck">
	<br/ >
	<h5>{$LANG.rcdns_nameservertitle}</h5>
	<p>{$LANG.rcdns_domainfwddnssolutiontitle}</p>
	<ul>
		<li>
			{$LANG.rcdns_domainfwddnssolution1}
		</li>
		<li>
			{$LANG.rcdns_domainfwddnssolution2}
		</li>
	</ul>
	<p><strong>{$LANG.rcdns_note}:</strong> {$LANG.rcdns_dnsconfigapplied}</p>
	<table class="table table-bordered table-hover">
		<tr>
			<td class="textcenter" colspan="2">
				{$LANG.rcdns_domainfwddnssolution1}
			</td>
		</tr>
		<tr>
			<td width="50%" style="vertical-align:top">
				<p class="label label-danger">
					{$LANG.currentnameservers}
				</p><br />
				{foreach key=num item=actualdns from=$configurednsservers.0}
				{$actualdns}<br />
				{/foreach}
			</td>
			<td width="50%" style="vertical-align:top">
				<p class="label label-success">
					{$LANG.recommendednameservers}
				</p><br />
				{foreach key=num item=defaultdns from=$requirednsservers.0}
				{$defaultdns}<br />
				{/foreach}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<form method="post" action="{$smarty.server.PHP_SELF}?action=managedomfwd">
					<input type="hidden" name="id" value="{if $domainid}{$domainid}{else}{$id}{/if}"/>
					<input type="hidden" name="domain" value="{$domain}"/>
					{foreach key=num item=defaultdns from=$requirednsservers.0}
					<input type="hidden" name="ns[]" value="{$defaultdns}"/>
					{/foreach}
					<input type="hidden" name="changens" value="true"/>
					<p align="center"><input type="submit" {if $nsserversok == 1}disabled="disabled"{/if} value="{$LANG.rcdns_changednsbutton}" class="btn btn-success"/></p>
				</form>
			</td>
		</tr>
	</table>

	<br />

	<table class="table table-bordered table-hover">
		<tr>
			<td class="textcenter" colspan="4">
				{$LANG.rcdns_domainfwddnssolution2}
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<h5>{$LANG.rcdns_anamerecordtitle}</h5>
			</td>
		</tr>
		<tr>
			<td>
				<strong><u>{$LANG.rcdns_recordtype}</u></strong>
			</td>
			<td>
				<strong><u>{$LANG.rcdns_recordhostname}</u></strong>
			</td>
			<td>
				<strong><u>{$LANG.rcdns_arecordip}</u></strong>
			</td>
			<td>
				<strong><u>{$LANG.rcdns_recordttl}</u></strong>
			</td>
		</tr>
		{foreach key=num item=service from=$requiredarecords}
		<tr>
			<td>
				{$service.type}
			</td>
			<td>
				{$service.host}
			</td>
			<td>
				{$service.value}
			</td>
			<td>
				{$service.timetolive}
			</td>
		</tr>
		{/foreach}
	</table>
</div>
{/if}

<br />

<form method="post" action="{$smarty.server.PHP_SELF}?action=managedomfwd">
	<table class="table table-bordered table-hover">
		<tr>
			<td width="200">
				<h5>{$LANG.rcdns_domfwddestinationtitle}</h5>
			</td>
			<td class="textcenter">
				<p>{$LANG.rcdns_domfwddestinationdesc}</p>
				<input name="forward" class="form-control" type="text" value="{if $forward}{$forward}{else}http://{/if}" size="60"/>
			</td>
		</tr>
		<tr>
			<td>
				<h5>{$LANG.rcdns_domfwdframetitle}:</h5>
			</td>
			<td>
				<p>{$LANG.rcdns_domfwdframedesc}</p>
				<input name="urlmask" type="radio" id="radio" value="true" {if $urlmasking=="true"}checked{/if}/> {$LANG.yes}
				<input name="urlmask" type="radio" id="radio" value="false" {if $urlmasking=="false"}checked{/if}/> {$LANG.no}
			</td>
		</tr>
		<tr>
			<td>
			<h5>{$LANG.rcdns_domfwdheadertagstitle}:</h5>
			</td>
			<td>
				<p>{$LANG.rcdns_domfwdheadertagsdesc}</p>
				<textarea class="form-control" name="headertags" cols="70" rows="7" id="headertags">{$headertags}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<h5>{$LANG.rcdns_domfwdnoframestitle}:</h5>
			</td>
			<td>
				<p>{$LANG.rcdns_domfwdnoframesdesc}</p>
				<textarea class="form-control" name="noframes" cols="70" rows="7" id="noframes">{$noframes}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<h5>{$LANG.rcdns_domfwdsubdomtitle}:</h5>
			</td>
			<td>
				<p>{$LANG.rcdns_domfwdsubdomdesc}</p>
				<input name="subforwarding" type="radio" id="radio" value="true" {if $subforwarding=="true"}checked{/if} /> {$LANG.yes}
				<input name="subforwarding" type="radio" id="radio" value="false" {if $subforwarding=="false"}checked{/if} /> {$LANG.no}
			</td>
		</tr>
		<tr>
			<td>
				<h5>{$LANG.rcdns_domfwdpathtitle}:</h5>
			</td>
			<td>
				<p>{$LANG.rcdns_domfwdpathdesc}</p>
				<input name="pathforwarding" type="radio" id="radio" value="true" {if $pathforwarding=="true"}checked{/if} /> {$LANG.yes}
				<input name="pathforwarding" type="radio" id="radio" value="false" {if $pathforwarding=="false"}checked{/if} /> {$LANG.no}
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="hidden" name="cfgdomfwd" value="true"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="id" value="{if $domainid}{$domainid}{else}{$id}{/if}"/>
				<p align="center"><input type="submit" value="{$LANG.rcdns_savechanges}" class="btn btn-success"/></p>
			</td>
		</tr>
	</table>
</form>

{/if}
