

<cfset myActivities=application.remote.data.getFeaturedActivities()>
<cfif NOT myActivities.success><cfexit method="exittag"></cfif>
<!--- <table width="100%" border="0" cellpadding="0" cellspacing="10" style="margin-top:10px;">
	<tr>
		<td width="20%"><div align="center"><img width="40" height="40" border="0" src="images/themes/FOOD.png" alt="FOOD Icon" /></div></td>
		<td width="20%"><div align="center"><img width="40" height="40" border="0" src="images/themes/HEALTH.png" alt="HEALTH Icon" /></div></td>	
		<td width="20%"><div align="center"><img width="40" height="40" border="0" src="images/themes/LIVELIHOOD.png" alt="LIVELIHOOD Icon" /></div></td>	
		<td width="20%"><div align="center"><img width="40" height="40" border="0" src="images/themes/WATER.png" alt="WATER Icon" /></div></td>
		<td width="20%"><div align="center"><img width="40" height="40" border="0" src="images/themes/LAND.png" alt="LAND Icon" /></div></td>
	</tr>
	<tr>
		<td><div align="center"><a href="activityDetail.cfm?id=2485" title="Formation of Water User Associations and River Namwi Catchments for Sustainable Irrigation" style="text-decoration:none"  class="themelink"> Formation of Water User Associations&hellip; </a></div></td>
		<td><div align="center"><span class="vsmall"><a href="activityDetail.cfm?id=2368" title="Capacity Development and Adaptation to Climate Change on Human Health Vulnerability" style="text-decoration:none"  class="themelink">Capacity Development and Adaptation&hellip;</a></span></div></td>	
		<td><div align="center"><span class="vsmall"><a href="activityDetail.cfm?id=2467" title="Enhancing Adaptive Capacity in Semi-Arid Mountainous Regions" style="text-decoration:none"  class="themelink"> Enhancing Adaptive Capacity in Semi-Arid&hellip; </a></span></div></td>	
		<td><div align="center"><span class="vsmall"><a href="activityDetail.cfm?id=2470" title="Restoration of the Lepa Village Natural Spring and Development of a Water Catchment for Village Drinking Water" style="text-decoration:none"  class="themelink"> Restoration of the Lepa Village Natural&hellip; </a></span></div></td>
		<td><div align="center"><span class="vsmall"><a href="activityDetail.cfm?id=2523" title="Rio de Janeiro's Community Reforestation Project" style="text-decoration:none"  class="themelink"> Rio de Janeiro's Community Reforestation&hellip; </a></span></div></td>
	</tr>
	</table> --->

<table width="100%" cellpadding="0" cellspacing="30" style="margin-top:10px;">
	<tr>
	<cfoutput>
		<cfloop collection="#myActivities.data#" item="item">
		<td  width="20%" align="center" valign="top">
						<cfset title=myActivities.data[item].title>
						<a href="activityDetail.cfm?id=#myActivities.data[item].activityId#" title="#title#"s  class="themelink">
			<img style="margin-bottom:4px;" width="45" height="45" border="0" src="images/themes/#myActivities.data[item].THEMEID#.png" alt="#myActivities.data[item].THEMEID# Icon"><br>
			
							<cfset charCount=0>
							<cfloop list="#title#" delimiters=" " index="word"><cfif charCount GT 70>&hellip;<cfbreak><cfelse> </cfif>#word#<cfset charCount=charCount+len(word)+1></cfloop>
							</a>
						
		</td>
		</cfloop>
	</cfoutput>
	</tr>

</table>
