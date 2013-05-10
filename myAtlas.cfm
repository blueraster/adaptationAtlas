

<cf_header>

<div id="content">
	<h3>Welcome to Your Atlas Account </h3>
<p>From here, you can access your profile details; track your activity and interactions with the Global Adaptation Atlas. </p>

	<cfset myAtlas=application.remote.user.getMyAtlasItems()>
	<cfif myAtlas.success NEQ 1>
	<cfthrow object="#myAtlas.error#">
	</cfif>
	<cfset myAtlas=myAtlas.data>

	
	
<table><tr>
<td width="400" height="50" valign="top">

<cf_atlasPod title="Profile" width="400" height="100">
Update your Profile Details. <input type="button" value="Update Profile" onclick="document.location.href='profile.cfm';">
<cfoutput>
<p>
	#session.user.fullname#, 
	#session.user.town#<br><br>
	#session.user.email#<br>

</p></cfoutput>
</cf_atlasPod>	

<br><br>

<cf_atlasPod title="My Maps" width="400" height="140">
	<table style="padding-left:20px;" width="350">
	<cfoutput query="myAtlas.savedMaps">
	<tr><td valign="middle"><li><a href="map.cfm?#params#"><cfif len(label)>#label#<cfelse>Custom Map #savedMapId#</cfif></a></li> </td><td>saved #dateformat(createdOn,'m-d-yy')#</td></tr>
	</cfoutput>
		</table>
</cf_atlasPod>

<br><br>

<cf_atlasPod title="My Upload/Download History" width="400" height="100">

	<cfif myAtlas.downloadHistory.recordcount>
	<table style="padding-left:20px;" width="350">
	<cfoutput query="myAtlas.downloadHistory">
	<tr><td valign="top"><li><cfif len(description)>#description#<cfelse>Download</cfif></li></td><td>#dateformat(date,'m-d-yy')#</td></tr>
	</cfoutput>
	</table> 
	<cfelse>
	<p>You have no download records.</p>
	</cfif>
	
	<cfif myAtlas.uploadHistory.recordcount>
	<table style="padding-left:20px;" width="350">
	<cfoutput query="myAtlas.uploadHistory">
	<tr><td valign="top"><li><cfif len(description)>#description#<cfelse>Upload</cfif></li></td><td>#dateformat(date,'m-d-yy')#</td></tr>
	</cfoutput>
	</table> 
	<cfelse>
	<p>You have no upload records.</p>
	</cfif>
</cf_atlasPod>

</td>
<td width="100">&nbsp;</td>
<td width="400" valign="top">

	
<cf_atlasPod title="My Data" width="400" height="210">
	<table style="padding-left:20px;" width="350" border="0">
	<cfoutput query="myAtlas.savedImpactData">
	<tr><td valign="middle"><li></td><td valign="top"><a href="impactDetail.cfm?id=#impactId#">#Name#<cfif len(scenario)> (#scenario#)</cfif></a></td></tr>
	</cfoutput>
	</table>
</cf_atlasPod>


<br><br>
<cf_atlasPod title="My Activities" width="400" height="210">
	<table style="padding-left:20px;" width="350">
	<cfoutput query="myAtlas.savedActivityData">
	<tr><td valign="middle"><li></li></td><td><a href="activityDetail.cfm?id=#activityId#">#Title#</a> (#City#, #Country#)</li></td></tr>
	</cfoutput>
	</table>
</cf_atlasPod>
<!--- <br><br>
<cf_atlasPod title="My Download History" width="400" height="100">
	
</cf_atlasPod> --->
			
		
</td></tr></table>
</div>
<cf_footer>