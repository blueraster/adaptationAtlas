


<cf_header>

<div id="content" align="left">

<a href="impacts.cfm">Impact Data</a> &nbsp;&nbsp;|&nbsp;&nbsp;
<a href="activities.cfm">Activity Data</a> &nbsp;&nbsp;|&nbsp;&nbsp;
<a href="data.cfm">Search Data</a>

<cfset qGetAllImpacts=application.gateway.impacts.getUniqueImpactsData()>


<cfoutput query="qGetAllImpacts" group="themeid">
<h3>#themeid#</h3>
<cfset rownum=1>

<table border="0" cellpadding="10" cellspacing="0">
<cfoutput>
	<cfif rownum mod 3 IS 1><tr></cfif>
	<td valign="top"><img width="40" height="40" src="images/themes/#qGetAllImpacts.themeid#.png" alt="#qGetAllImpacts.themeid#"></td>
	<td valign="top" width="300">
		<a href="impactDetail.cfm?id=#impactId#">#qGetAllImpacts.tooltip#</a><!---  <br>#qGetAllImpacts.citationinfo# --->
	</td>
	<cfif rownum mod 3 IS 0><tr></cfif>
	<cfset rownum=rownum+1>
</cfoutput>
</table>
</cfoutput>

 </div>
<cf_footer>