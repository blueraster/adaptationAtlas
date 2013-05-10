<cftry>
<cfspreadsheet  
    action="read" 
    src = "#application.environment.diskroot#/images/maps/Maps.xlsx" 
    columns = "1-7" 
    headerrow = "1"  sheet="1"
    query = "myData" > 
<cfcatch type="any2">
<cfexit method="exittag">
</cfcatch>	
</cftry>	
	<cfset maps=arrayNew(1)>
	
	
	<cfoutput query="myData" startrow="2">
	<cfscript>
	map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
	myLabel=myData.label;
	if(left(myLabel,1) IS '"')myLabel=mid(mylabel,2,len(mylabel)-2);
	map.filename=myData.filename;
	map.label=myLabel;
	map.params=myData.parameters;
	arrayAppend(maps,map);
	</cfscript>
	</cfoutput>
	


<!--- <cfscript>



map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Tanser2003-2080A2-SouthernAfrica";
map.name="## Months Suitable for Transmission, Tanser 2003";
map.params="loc=AFRICA&tf=PROJECTED_2080&sc=A2&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=32445&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=17.2705&y=7.0136&z=4&q=1&v=1&sel=398";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Amelung2007-TourismMths-bsln-seasia";
map.name="Number of 'Good' Tourism Months per Year in 1970, Amelung 2007";
map.params="loc=GLOBAL&tf=BASELINE&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=38.7598&y=39.504&z=3&q=1&v=1&sel=133";
arrayAppend(maps,map);
	
map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Amelung2007-TourismMths-bsln-seasia";
map.name="Projected Average Annual Runoff, Arnell 2003";
map.params="loc=GLOBAL&tf=BASELINE&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=38.7598&y=39.504&z=3&q=1&v=1&sel=133";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Hales2002-Australia";
map.name="Probability of Dengue Fever, Hales et al. 2002";
map.params="loc=GLOBAL&tf=PROJECTED_2080&sc=A2&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=128.6279&y=-13.6674&z=4&q=1&v=1&sel=135";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Parry2004-MZ-2020PC-HornAfrica";
map.name="Change in Maize Yields from 1970-2000 Average Baseline, Tonnes per Hectare, Parry et al. 2004";
map.params="loc=GLOBAL&tf=PROJ_CHANGE_2020&sc=B2B&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=11.4697&y=7.5367&z=4&q=1&v=1&sel=17";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Vafeidis2008-C.America";
map.name="People Flooded in 2100, in 1000s, Vafeidis 2008";
map.params="loc=GLOBAL&tf=PROJECTED_2100&sc=A2&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=-79.6948&y=18.2293&z=5&q=1&v=1&sel=304";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Tubiello2007-bsln-japan";
map.name="1961-1990 Yields, Kilograms per hectare, Tubiello 2007";
map.params="loc=GLOBAL&tf=BASELINE&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=132.2754&y=40.1705&z=5&q=1&v=1&sel=131";
arrayAppend(maps,map);

	
map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Doll2005-USA";
map.name="Change in Groundwater Recharge, % change, Doll et al. 2005";
map.params="loc=GLOBAL&tf=PROJ_CHANGE_2050&sc=A2&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=-92.439&y=39.1897&z=4&q=1&v=1&sel=138";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Vafeidis2008-SAmerica-2020b2a";
map.name="Land Lost in 2020, km squared, Vafeidis 2008";
map.params="loc=GLOBAL&tf=PROJECTED_2020&sc=B2 &fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=-58.5132&y=-15.3372&z=4&q=1&v=1&sel=226";
arrayAppend(maps,map);

map=createObject('component','org.rff.atlas.vo.FeaturedMapVO');
map.filename="Monfreda2008-WHYields";
map.name="Wheat Yields, tonnes per harvest, Monfreda 2008";
map.params="loc=GLOBAL&tf=CURRENT&fund=0&ptype=0&pop=0&fa_min=7445&fa_max=951000000&sd_min=1970&sd_max=2010&d_min=1&d_max=5&x=80.7275&y=20.9819&z=5&q=1&v=1&sel=379";
arrayAppend(maps,map);



</cfscript> --->
<cfset mapCount=arrayLen(maps)>
<cfset dayIndex=(dayOfYear(now()) mod mapCount) + 1>
<cfset dayIndex=randrange(1,mapCount)>
<cfset mapOfTheDay=maps[dayIndex]>





<cfoutput>
	
<table id="Table_01"  border="0" cellpadding="0" cellspacing="0">

	<tr>
		<td width="10" height="10"><img src="images/FeaturedMap_03.png" width="10" height="10" alt=""></td>
		<td width="405" height="10" background="images/FeaturedMap_04.png"><img src="images/spacer.gif" width="405" height="10" alt=""></td>
		<td width="10" height="10"><img src="images/FeaturedMap_05.png" width="10" height="10" alt=""></td>
	</tr>
	<tr>
		<td width="10" height="20" background="images/FeaturedMap_07.png"><img src="images/spacer.gif" width="10" height="20" alt=""></td>
		<td width="405" height="20" bgcolor=" " background="images/FeaturedMap_08.png">
		<div style="font-size:12pt;color:##ffffff">#mapOfTheDay.label#</div>
		</td>
		<td width="10" height="20" background="images/FeaturedMap_09.png"><img src="images/spacer.gif" width="10" height="20" alt=""></td>
	</tr>
	<tr>
		<td width="10" height="4"><img src="images/FeaturedMap_10.png" width="10" height="4" alt=""></td>
		<td width="405" height="4" background="images/FeaturedMap_11.png"><img src="images/spacer.gif" width="405" height="4" alt=""></td>
		<td width="10" height="4"><img src="images/FeaturedMap_12.png" width="10" height="4" alt=""></td>
	</tr>
	<tr>
		<td width="10" height="180" background="images/FeaturedMap_13.png"><img src="images/spacer.gif" width="10" height="180" alt=""></td>
		
		<!--- MAP --->
		<td width="405" height="300" bgcolor="##b5c7d6">
		<a href="map.cfm?#mapOfTheDay.params#">
			<img height="300" width="450" src="#application.environment.basehref#/images/maps/#mapOfTheDay.filename#" border="0">
		</a>
		</td>
		
		
		<td width="10" height="180" background="images/FeaturedMap_15.png"><img src="images/spacer.gif" width="10" height="180" alt=""></td>
	</tr>
	
	<!--- Stripe --->
	<tr>
		<td width="10" height="2"><img src="images/FeaturedMap_16.png" width="10" height="2" alt=""></td>
		<td width="405" height="2" background="images/FeaturedMap_17.png"><img src="images/spacer.gif" width="405" height="2" alt=""></td>
		<td width="10" height="2"><img src="images/FeaturedMap_18.png" width="10" height="2" alt=""></td>
	</tr>
	
	
	<tr>
		<td width="10" height="59" background="images/FeaturedMap_19.png"><img src="images/spacer.gif" width="10" height="59" alt=""></td>
		<td width="405" height="59" background="images/FeaturedMap_20.png">
			<!--- Form --->
			<cfset qGetCountries=application.gateway.business.getCountryQuery()>
		<div id="locationFinder">
		<strong>Explore Your Location</strong><br>
		Enter a country you would like to explore<br>
		<cfform name="featureMapForm"  format="html" action="map.cfm" method="get"  skin="haloBlue"  timeout="300"> 
		
			
			<cfformgroup type="Hbox">
				<cfformgroup type="Vbox">
				<cfselect name="country" onchange="featureMapForm.submit();"  queryposition="below" query="qGetCountries" display="label" value="id"   required="true" label="Country"  message="Country type is required">
				<option value="">Select a Country</option>
				</cfselect>
				 </cfformgroup>
				<cfformgroup type="Vbox">
					<cfinput  name="submit" type="submit"  value="Go">
					
				</cfformgroup>
			<cfloop list="#mapOfTheDay.params#" index="item" delimiters="&">
				<cfinput type="hidden" name="#listfirst(item,"=")#" value="#listlast(item,"=")#">
			</cfloop>
   			 </cfformgroup>
			</cfform>
		</div>
			

		</td>
		<td width="9" height="59" background="images/FeaturedMap_21.png"><img src="images/spacer.gif" width="10" height="59" alt=""></td>
	</tr>
	<tr>
		<td width="8" height="9"><img src="images/FeaturedMap_22.png" width="10" height="10" alt=""></td>
		<td width="405" height="9" background="images/FeaturedMap_23.png"><img src="images/spacer.gif" width="405" height="10" alt=""></td>
		<td width="9" height="9"><img src="images/FeaturedMap_24.png" width="10" height="10" alt=""></td>
	</tr>

</table>
	
	

	<!--- <div id="myRotatingImg" style="visibility:hidden">


<cfoutput>
<table border="0" cellpadding="0" cellspacing="0">
<tr><td><img onload="document.getElementById('myRotatingImg').style.visibility='visible';" src="#application.environment.basehref#/images/maps/#mapOfTheDay.filename#" width="400" height="350"  alt="Interesting Map Images (Rotating)" border="1"></td>
<td background="images/BG_dropshadow_vert.gif" valign="top">
<img src=images/dropshadow_02.gif" border="0" width="16" height="350"></td></tr>
<tr><td background="images/BG_dropshadow_hor.gif"><img src="images/dropshadow_03.gif" border="0" width="400" height="16"></td><td><img src="images/dropshadow_04.gif" border="0"></td></tr>
</table>
</cfoutput>
</div>
	 --->
<!--- 		<div id="featuredMap">
		<div style="margin:3px;font-size:14pt;">#mapOfTheDay.label#</div>

					
						
		<a href="map.cfm?#mapOfTheDay.params#">
			<img height="300" width="450" src="#application.environment.basehref#/images/maps/#mapOfTheDay.filename#" border="0">
		</a>
		
		
		
		
		</div> --->


</cfoutput>
