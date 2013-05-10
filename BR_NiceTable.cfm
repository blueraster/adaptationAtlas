<cfsilent>
<!--- 	This code is Copyright (c) 2006 by Blue Raster LLC		 
		Contact sansari@blueraster.com for information.		 --->
		
<cfparam name="attributes.fieldsToHide" default="">
<cfparam name="attributes.fieldsToInclude" default="">
<cfset fieldsToHide=listAppend(attributes.fieldsToHide,"geocode_X,geocode_Y,geocode_SCORE,geocode_ADDR,geocode_DUR,geocode_DateTime,Shape,SQMI")>		
<cfset fieldsToInclude=attributes.fieldsToInclude>		
</cfsilent><cftry>
<cfif IsDefined('attributes.dataset')><cfsilent>
		<cfif  NOT isQuery(attributes.dataset)>	
			<cfexit method="EXITTAG">
		</cfif>
<cfparam name="attributes.Title" default="Results">
<cfparam name="attributes.Links" default="">
<cfparam name="attributes.top" default="10">
<cfparam name="attributes.stringLimit" default="1000">
<cfparam name="attributes.nowrap" default="false">

<cfparam name="attributes.cellpadding" default="2">
<cfparam name="attributes.padding" default="5">
<cfparam name="attributes.border" default="0">

<!--- <cfwddx action="CFML2WDDX" input="#attributes.dataset#" output="wddxQuery" usetimezoneinfo="No"> --->
<cfoutput>
<!--- 
<form id="dataForm" name="dataForm" action="export.cfm" method="post" target="_blank"> --->
<cfset session.myQueryResults=attributes.dataset>
<!--- 	<input type="Text" name="myQuery" value="#wddxQuery#">
</form> --->
</cfoutput>
<cfset myColumns=getMetaData(attributes.dataset)>
</cfsilent>
<cfoutput>
		<table border="#attributes.border#" <cfif isDefined('attributes.width')>width="#attributes.width#" </cfif>cellpadding="#attributes.cellpadding#" cellspacing="0" style="border:thin solid ##333333">
		
		<tr><td colspan="#arrayLen(myColumns)+1#" bgcolor="##333333"><span style="color:##ffffff;"><strong>#attributes.Title#</strong> 
		<cfif attributes.dataset.recordcount> &nbsp;&nbsp;&nbsp;#attributes.links#
		<cfif isDefined('attributes.allowExport')>
		<a href='#application.absoluteurlroot#/mapping/exportQuery.cfm' style='color:##ffffff' target='_blank'>[Excel]</a> &nbsp;&nbsp;&nbsp;</cfif>
		<!--- <a href='exportQuery.cfm' target='_blank' style='color:##ffffff'>[Map]</a>&nbsp;&nbsp;&nbsp;&nbsp; --->
		<cfif attributes.dataset.recordcount GT attributes.top>(Top #attributes.top# of #attributes.dataset.recordcount# records)<cfelse>(#attributes.dataset.recordcount# records)</cfif><cfelse>&nbsp;&nbsp;&nbsp;&nbsp;No Records Found</cfif></span></td></tr>
		<tr bgcolor="##cccccc">
		<td><span style="color:##999999">##</span></td><cfloop index="i" from="1" to="#arrayLen(myColumns)#" step="1"><cfif NOT listfindnocase(fieldsToHide,myColumns[i].name)><cfif len(fieldsToInclude) IS 0 OR listfindnocase(fieldsToInclude,myColumns[i].name)><cfset myColumnName=replacenocase(myColumns[i].name,"_","_","all")>
		<td style="padding-right:#attributes.padding#" <cfif attributes.nowrap>nowrap</cfif>><strong><cfif myColumns[i].name IS "MyValue">Value On Map<cfelse>#myColumnname#</cfif></strong></td></cfif></cfif></cfloop>
		</tr>
		<cfset rowCounter=0>
		<cfloop query="attributes.dataset"><cfset rowCounter=rowCounter+1><cfif rowCounter GT attributes.top><cfbreak></cfif>
		<tr <cfif currentrow mod 2 IS 0>bgcolor="##e9e9e9"<cfelse>bgcolor="##eeeeee"</cfif>>
		<td style="border-bottom:thin ##cccccc solid" class="vsmall" ><span style="color:##999999">#currentrow#</span></td>
		<cfloop index="i" from="1" to="#arrayLen(myColumns)#" step="1"><cfsilent>
		<cfset myCurrentValue=attributes.dataset[myColumns[i].name][currentrow]>
		<cfif isDefined('attributes.formatfunctions')>
			<cfloop index="item" list="#attributes.formatfunctions#" delimiters=",">
				<cfif listFirst(item,":") IS myColumns[i].name>
					<cfset myCurrentValue=evaluate(listLast(item,":")&"('"&myCurrentValue&"')")>
				</cfif>
			</cfloop>
		</cfif>
		</cfsilent><cfif NOT listfindnocase(fieldsToHide,myColumns[i].name)><cfif len(fieldsToInclude) IS 0 OR listfindnocase(fieldsToInclude,myColumns[i].name)><td style="border-bottom:thin ##cccccc solid;padding-right:#attributes.padding#" class="vsmall" <cfif len(myCurrentValue) LT 40 OR attributes.nowrap>nowrap</cfif>><cfif len(myCurrentValue)>#left(myCurrentValue,attributes.stringLimit)#<cfif len(myCurrentValue) GT attributes.stringLimit>...</cfif><cfelse>&nbsp;</cfif></td></cfif></cfif>
		</cfloop></tr></cfloop>
		
		</cfoutput>
		</table>

	</cfif>
<cfcatch type="Any2">
Please contact Administrator and reference BR_NTable
</cfcatch>
</cftry>