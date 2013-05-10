



<cfset myItem=application.gateway.activities.getActivityDetail(#val(url.id)#)>
<cfset myItem=myItem>


<cf_header title="#replacenocase(myItem.KEYWORDS,";"," - ","all")# #myItem.title#">

<div id="content" align="left">

<cfoutput><h3 style="width:800px;">#myItem.title#</h3></cfoutput>

<cfoutput>
<table border="0" cellspacing="0" cellpadding="10" width="700">
<tr>
	<!--- <td valign="top"><img  src="images/themes/#myItem.THEMEID#.png" alt="#myItem.themeid#"></td> --->
	<td valign="top">
		<div style="padding-left:10px;">

		<table border="0" cellspacing="0" cellpadding="3" width="400">
		<tr><td valign="top"><strong>Activity Type:</strong></td>	<td valign="top">#myItem.activityType#</td><td colspan="2"><img  src="images/themes/#myItem.THEMEID#.png" alt="#myItem.themeid#"></td></tr>
		<tr><td valign="top"><strong>Status:</strong></td>			<td valign="top">#myItem.Status#</td></tr>
		<tr><td valign="top"><strong>Funding Source:</strong></td>	<td valign="top" colspan="3">#myItem.fundingSource#&nbsp;</td></tr>
		<tr><td valign="top"><strong>Location<cfif listlen(myitem.location,".") GT 2>s</cfif>:</strong></td>
			<td valign="top" colspan="3">#myItem.location#</td>
		</tr>
		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
			<td valign="top"><strong>Start Date:</td>
			<td valign="top" nowrap="true">#myItem.startDate#&nbsp;</td>
			<td valign="top" colspan="2" nowrap="true"><strong>Duration:</strong>&nbsp;&nbsp;#myItem.duration#</td>
		</tr>
		
		<tr><td valign="top"><strong>Total Funding:</strong></td>	<td valign="top">#myitem.fundingAmount#</td><td colspan="2">&nbsp;</td></tr>
		<tr><td colspan="4">&nbsp;</td></tr>
		<tr><td valign="top"><strong>Donor:</strong></td>			<td valign="top" colspan="3">#myItem.fundingAgency#</td></tr>
		<tr><td valign="top"><strong>Recipient:</strong></td>		<td valign="top" colspan="3">#myItem.impag#</td></tr>
		

			
<!--- 		<tr><td colspan="4">
		<br><br>
		<strong>More Info:</strong>
		<ul>
		<cfif len(myItem.websiteURL)>
		<li><a href="#myItem.websiteURL#" target="_blank">Project Website</a></li>
		</cfif>
		<li><a href="map.cfm?mode=single&activity=#myItem.activityId#">Details in Map Viewer</a></li>
		<li><a href="activities.cfm">Return to All Activities</a></li>
		</ul>
		
		</td></tr> --->
	</table>
		
		

		
		
		</div>
	</td>
	<td valign="top" width="200">
		<img  border="0" src="#myItem.thumbnailpath#" title="#myItem.caption#" alt="Thumbnail for #myItem.caption#"><br>
		#myItem.caption#

	</td>
</tr>

<tr><td colspan="2">
		<div style="padding-left:10px;">
		<cfset myDescription=myItem.description>
		<cfif len(trim(myDescription))>
		<div style="border:1px dotted ##999999;padding:4px;">
		<strong>Description:</strong>

						<!--- 		<cfset myDescription=rereplacenocase(myDescription,"[#chr(10)#]+","<BR>",'all')> --->
						<!--- 		<cfset myDescription=replacenocase(myDescription,"•","<li>",'all')> --->

			<div class="scrollingArea" style="overflow-y:auto;height:153px;padding:8px">
				#myDescription#</div>
			</div>
		</cfif>
			
			<p><a href="#myItem.WEBSITEURL#" target="_blank">Project Website</a></p>
			
			<cfif len(myItem.contact)>
			<strong>Contact Information:</strong><br>
			#myItem.contact#<br>
			<cfif len(myItem.email)>#myItem.email#<br></cfif>
			<cfif len(myItem.phone)>#myItem.phone#<br></cfif>
			</cfif>
			<cfif len(myItem.website)>
			<strong>Other Links:</strong><br>
			#myItem.website#
			<a href="#myItem.website#" target="_blank">Detail Page Link</a><br>
			</cfif>
			<br>
			<strong>Other&nbsp;Themes:</strong> #replacenocase(myItem.keywords,",",", ","all")#
		</div>
		</td></tr>
		

</table>
<br><br>
</cfoutput>


 </div>
<cf_footer>