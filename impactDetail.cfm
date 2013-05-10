



<cfset myImpact=application.gateway.impacts.getImpactDetail(#url.id#)>
<cfset myImpact=myImpact>

<cfif NOT isDefined('myImpact.keywords')><cfset myImpact.keywords=""></cfif>

<cf_header title="#replacenocase(myImpact.KEYWORDS,";"," - ","all")# #myImpact.name#">

<div id="content" align="left">

<cfoutput><h3>#myImpact.name#</h3></cfoutput>


<cfoutput>
<table border="0" cellspacing="0" cellpadding="10">
<tr>
	<td valign="top"><img src="images/themes/#myImpact.THEMEID#.png" alt="#myImpact.themeid#"></td>
	<td valign="top">
		<div style="padding-left:10px;">
		<strong>#myImpact.name#</strong>
		<cfif len(myImpact.subtheme)><br><br><strong>Theme:</strong> #myImpact.theme# (#myImpact.subtheme#)</cfif>
		<cfif len(myImpact.abstract)><br><br><strong>Abstract:</strong>

			<div class="scrollingArea" style="overflow-y:auto;height:150px">
				#rereplacenocase(myImpact.abstract,"[#chr(13)##chr(11)#]+","<BR><BR>",'all')#
			</div></cfif>
		<cfif len(myImpact.KEYWORDS)><br><br><strong>Keywords:</strong><ul><li>#replacenocase(myImpact.KEYWORDS,";",",<li>","all")#</ul></cfif>
		
		<cfif len(myImpact.location)><br><br><strong>Location:</strong> #myImpact.location#</cfif>
		<cfif len(myImpact.timeframe)><br><br><strong>Timeframe:</strong> #myImpact.timeframe#</cfif>
		<cfif len(myImpact.scenario)><br><br><strong>Scenario:</strong> #myImpact.scenario#</cfif>
		<cfif len(myImpact.datasource)><br><br><strong>Datasource:</strong> #myImpact.datasource#</cfif>
		<cfif len(myImpact.citation)><br><br><strong>Citation:</strong><br>#myImpact.citation#</cfif>
 	

 		<cfif len(myImpact.DOWNLOADURL) AND fileexists('#application.environment.diskroot#\data\#myImpact.DOWNLOADURL#')>
		<br><br>
		<a href="#application.environment.basehref#/data/#myImpact.DOWNLOADURL#" target="_blank"><strong>** Download Data</strong></a></li>
		</cfif>
 	
 		
		
		
		<br><br>
		<strong>More Info:</strong>
		<ul>
		<cfif len(myImpact.EXTERNALWEBSITE)>
		<li><a href="#myImpact.EXTERNALWEBSITE#" target="_blank">Data/Patner Website</a></li>
		</cfif>
		<li><a href="map.cfm?mode=single&impact=#myImpact.impactid#">Details in Map Viewer</a></li>
		<li><a href="impacts.cfm">Return to All Impacts</a></li>
		</ul>
		</div>
	</td>
	<td valign="top" rowspan="2">
		<cfif len(myImpact.GRAPHICURL)>
		<img border="0" src="#myImpact.GRAPHICURL#">
		</cfif>
	</td>
</tr>
</table>

</cfoutput>


 </div>
<cf_footer>