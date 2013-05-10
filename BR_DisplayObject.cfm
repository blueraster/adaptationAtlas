<!--- 	This code is Copyright (c) 2009 by Blue Raster LLC		 
		Contact sansari@blueraster.com for information.		 --->
<cfparam name="attributes.top" default="3">
<cfparam name="attributes.var" default="#attributes#">
<cfparam name="attributes.label" default="My Object">
<cfparam name="attributes.color" default="##115588">
<cfparam name="attributes.highlightFields" default="">
<cfparam name="attributes.stringLimit" default="400">
<!--- <cfsilent> --->
<cfset rowCount=0>
<cfoutput>
<cfif isArray(attributes.var)>
	<cfif arrayLen(attributes.var) GT 0>
	
		<!--- Test --->
		<cfset arrayContainsComplexValues=false>
		<cfloop from="1" to="#arrayLen(attributes.var)#" index="j">
			<cfif NOT isSimpleValue(attributes.var[j])>
			<cfset arrayContainsComplexValues=true>
			</cfif>
		</cfloop>
	<cfif arrayContainsComplexValues>
		<cfloop from="1" to="#arrayLen(attributes.var)#" index="j">
		<cftry>
		<cfsavecontent variable="myArrayOfComplexText">
		<cf_BR_DisplayObject var="#attributes.var[j]#" color="##339933" label="#attributes.label# (#j# of #arrayLen(attributes.var)#)" stringLimit="#attributes.stringLimit#" top="#attributes.top#">
		</cfsavecontent>
		#myArrayOfComplexText#
		<cfcatch type="any">
			<cf_BR_DisplayObject var="#attributes.var[j]#" color="##339933" label="#attributes.label# (#j# of #arrayLen(attributes.var)#)" stringLimit="#attributes.stringLimit#" top="#attributes.top#">
				<!--- <cfdump var="#attributes.var[j]#" label="Unusual Object" expand="false"><br> --->
		
		</cfcatch></cftry>
		<cfif j IS attributes.top><cfbreak></cfif>
		</cfloop>
	<cfelse>
		<cftry>
		<cfdump var="#attributes.var#" label="#attributes.label#: (#min(attributes.top,arrayLen(attributes.var))# of #arrayLen(attributes.var)#)" top="#attributes.top#">
		<cfcatch type="Any">********32</cfcatch>
		</cftry>
	</cfif>
	<cfelse>
	<table cellpadding="2" cellspacing="0" style="border:1px solid ##339933" width="200">
	<tr><td colspan="2" bgcolor="##339933" nowrap><span style="color:##ffffff;font-weight:bold">#attributes.label# (0 Records)</span></td></tr>
	</table>
	</cfif>
	<cfexit method="exittag">
	
<!--- <cfelseif isObject(attributes.var) AND structKeyExists(attributes.var,"Message") AND structKeyExists(attributes.var,"SUCCESS") AND structKeyExists(attributes.var,"data") AND NOT isSimpleValue(attributes.var.data)>	
	<cfdump var="#attributes.var#" expand="false">
	 <cf_BR_DisplayObject var="#attributes.var#" color="339933" label="#attributes.label# (ERROR)"> 
	
	<cfexit method="exittag"> --->
	
	
<cfelseif isSimpleValue(attributes.var)>
	<table cellpadding="2" cellspacing="0" style="border:1px solid #attributes.color#" width="200">
	<tr><td colspan="2" bgcolor="#attributes.color#" nowrap><span style="color:##ffffff;font-weight:bold">#attributes.label# &nbsp;&nbsp;[Simple Value]</span></td></tr>
	<tr>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top" >Value:</td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top" ><span style="color:##000000;"><cfif isXML(attributes.var)><xmp>#attributes.var#</xmp><cfelseif len(attributes.var)>#attributes.var#<cfelse>[NULL]</cfif></span> &nbsp;</td>
	</tr>
	</table>
	<cfexit method="exittag">
<cfelseif isQuery(attributes.var)>
<cf_br_nicetable dataset="#attributes.var#" title="#attributes.label#" top="#attributes.top#">
<!--- <cfdump var="#attributes.var#" top="#attributes.top#" expand="false" label="Click To Open Records">  --->
	<!--- <cf_BR_NiceTable var="#attributes.var#" label="#attributes.label#"><br> --->
	<cfexit method="exittag">
<cfelseif isObject(attributes.var) and structKeyExists(attributes.var,"Message") and structKeyExists(attributes.var,"Detail")>
	
	<table cellpadding="2" cellspacing="0" style="border:1px solid ##cc0000" width="200">
	<tr><td colspan="2" bgcolor="##cc0000" nowrap><span style="color:##ffffff;font-weight:bold">Error in #attributes.label#</span></td></tr>
	<tr>
		<td style="border-bottom:1px ##cc9999 solid" class="vsmall" valign="top" >Message:</td>
		<td style="border-bottom:1px ##cc9999 solid" class="vsmall" valign="top" ><span style="color:##990000">#attributes.var.Message#</span>&nbsp;</td>
	</tr>
	<cfif len(attributes.var.detail)>
	<tr>
		<td style="border-bottom:1px ##cc9999 solid" class="vsmall" valign="top" >Detail:</td>
		<td style="border-bottom:1px ##cc9999 solid" class="vsmall" valign="top" ><span style="color:##990000">#attributes.var.Detail#</span>&nbsp;</td>
	</tr></cfif>
	<cfif structKeyExists(attributes.var,'TagContext')><cftry>
	<tr>
		<td style="border-bottom:1px ##cc9999 solid" class="vsmall" valign="top">Notes:</td>
		<td style="border-bottom:1px ##cc9999 solid" class="vsmall" valign="top"><span style="color:##990000" title="attributes.var.tagcontext[1].Raw_Trace">(#listlast(attributes.var.tagcontext[1].Raw_Trace,"/\")#</span>&nbsp;</td>
	</tr><cfcatch type="any"></cfcatch></cftry>
	</cfif>
	</table>
	<cfexit method="exittag">
</cfif>


		<cfif isObject(attributes.var) AND structKeyExists(attributes.var,'ErrorCode') AND structKeyExists(attributes.var,'Success')>
			<cfset attributes.color="##666666"><!--- <cfdump var="#attributes.var#" expand="false"><cfabort> --->
			<cfif attributes.var.success IS "0">
				<cfset attributes.color="##993333">
				<cfif isObject(attributes.var.error) and structKeyExists(attributes.var.error,"Message") and structKeyExists(attributes.var.error,"Detail")>
				<cftry>
				<cfset attributes.var.message=attributes.var.message&"   "&'(#listlast(attributes.var.error.tagcontext[1].Raw_Trace,"/\")#'>
				<cfcatch type="any">
				<cfset attributes.var.message=attributes.var.message>
				</cfcatch>
				</cftry>
				</cfif>
			</cfif>
		</cfif>
	<table cellpadding="2" cellspacing="0" style="border:1px solid #attributes.color#">
		
	<cftry>
		<cfif isObject(attributes.var) AND structKeyExists(getmetadata(attributes.var),'properties') AND structKeyExists(getmetadata(attributes.var),'extends')>
			<!--- CFC CLASS: look for properties, including inheritance --->
			<cfset myClassProperties=arraynew(1)>
				<cfloop from="1" to="#arrayLen(getmetadata(attributes.var).properties)#" index="thisItem">
					<cfset success=arrayAppend(myClassProperties,getmetadata(attributes.var).properties[thisItem])> 
				</cfloop>
				
				
					<!--- Check if HINT SORTING is supported --->
					<cfset hintSortingIsSupported=true>
					<cfset stSortedProperties=structNew()>
					<cfloop from="1" to="#arrayLen(myClassProperties)#" index="i">
					<cfif NOT structKeyExists(myClassProperties[i],'hint')>
						<cfset hintSortingIsSupported=false>
						<!--- <cfset success=structInsert(stSortedProperties,0,properties[i],true)> --->
					<cfelse>
						<cfset success=structInsert(stSortedProperties,myClassProperties[i].hint,myClassProperties[i],false)>
					</cfif>
					</cfloop>
					<cfif hintSortingIsSupported>
						<cfset keyList=listToArray(structKeyList(stSortedProperties))>
						<cfset success=arraySort(keyList,"text","asc")>
						
						<cfset arSortedProperties=arrayNew(1)>
						<cfloop from="1" to="#arrayLen(keyList)#" index="i">
						<cfset success=arrayAppend(arSortedProperties,stSortedProperties[keyList[i]])>
						</cfloop>
						<cfset myClassProperties=arSortedProperties>
					</cfif>
				<!--- 	<cfif arrayLen(myClassProperties) GT 6>
					<cfdump var="#myClassProperties#"><cfaborT>
					</cfif> --->
	
				
			<!--- Check if has properties from superclass / head x deep --->
			<cfset comp="">
			<cfset thisRoot=getmetadata(attributes.var)>
			<cfset levelsOfInheritance=0>
			<cfset component="component">
			<cfloop condition="comp NEQ component AND levelsOfInheritance LTE 5">
			
				<cfset comp=listlast(thisRoot.NAME,".")>
				<cftry>
				<cfset levelsOfInheritance=levelsOfInheritance+1>
				<cfif structKeyExists(thisRoot,'extends')>
					
				<cfset comp=listlast(thisRoot.EXTENDS.NAME,".")>
					<!--- <cfdump var="#thisRoot#" label="level #levelsOfInheritance# [#comp IS component#][#comp#] vs [#component#]">  --->
							<!--- <cfdump var="#thisRoot#" label="level #levelsOfInheritance# [#comp IS component#]"> ---><!--- level #levelsOfInheritance# [#comp# vs. #component#:#comp IS component#]<br> --->
							<cfif comp NEQ component>
							<cfloop from="1" to="#arrayLen(thisRoot.properties)#" index="thisItem">
									<cfset thisRoot.properties[thisItem].extends="*">
								#arraylen(myClassProperties)# add<cfset success=arrayAppend(myClassProperties,thisRoot.properties[thisItem])>
							</cfloop>
							</cfif>
					<cfset thisRoot=thisRoot.extends>
				</cfif>
				<cfcatch type="Any"><cfdump var="#cfcatch#" label="125 xxxx"><cfabort>
				</cfcatch>
				</cftry>
			</cfloop>
			<!--- #arrayLen(myClassProperties)#<br> --->
			<cfset myStruct=structNew()>
			<cfset myArray=arrayNew(1)>
			<cfloop from="1" to="#arrayLen(myClassProperties)#" index="k">
			<cftry>
				<cfset myStruct[myClassProperties[k].name]=attributes.var[myClassProperties[k].name]>
				<cfset success=arrayAppend(myArray,myClassProperties[k].name)>
				<cfcatch type="Any">
					<br>@135:<cfdump var="#cfcatch.message#" label="error message">
				</cfcatch>
			</cftry>
			</cfloop>
			<cfif hintSortingIsSupported>
				<cfset myProps=myArray>
			<cfelse>
				<cfset myProps=listToArray(structKeyList(myStruct))>
				<cfset success=arraySort(myProps,"textnocase","asc")>
			</cfif>

		<cfelse>
			<cfset myProps=listToArray(structKeyList(attributes.var))>
		</cfif>
	<cfcatch type="any">issue at 147<cfdump var="#attributes.var#"><cfdump var="#cfcatch#"><cfaborT>
	<cfif cfcatch.message contains "access denied">
		<h3>access denied</h3> <cfdump var="#attributes.var#"><cfabort>
	<cfelse>
		<cfdump var="#getmetadata(attributes.var)#" label="getmetadata of obj">
		<cfabort>
	</cfif>
	</cfcatch>
	</cftry>
<tr><td colspan="2" bgcolor="#attributes.color#" nowrap><span style="color:##ffffff;font-weight:bold">
				#attributes.Label# 
				<cftry>
					<cfsavecontent variable="myLabelDesc">
					&nbsp;[<!--- #listlast(getMetadata(attributes.var).alias,".")# ---><span title="#getMetadata(attributes.var).path#">#getMetadata(attributes.var).name#</span>]
					</cfsavecontent>
				<cfcatch type="any">
					
					<cfsavecontent variable="myLabelDesc">&nbsp; 
					<cfif isStruct(attributes.var)>[Struct]
					<cfelse>[Unknown]
					</cfif>
					</cfsavecontent>
				</cfcatch>
				</cftry>
				#myLabelDesc#
</span></td></tr> 
<cfloop from="1" to="#arrayLen(myProps)#" index="i">
	<cfset item=myProps[i]>
<cfif IsSimpleValue(attributes.var[item]) or isBinary(attributes.var[item])><cfset rowCount=rowCount+1>
<tr <cfif rowCount mod 2 IS 0>bgcolor="##eeeeee"<cfelse>bgcolor="##ffffff"</cfif>>
	<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid; <cfif listFind(attributes.highlightFields,item)>background-color:##ffff66;</cfif>" class="vsmall" valign="top"><span style="font-size:8pt;">#item#</span></td>
	<td style="border-bottom:1px ##cccccc solid; <cfif listFind(attributes.highlightFields,item)>background-color:##ffff66;</cfif>" class="vsmall" valign="top">
		<cfif isXML(attributes.var[item])>
			
			<cfset myUUID1=createUUID()>
			<cfset myUUID2=createUUID()>
			
			
			<cfif len(attributes.var[item]) GT 2*attributes.stringLimit>
	
			<div id="#myUUID2#" style="display:block;margin-top:0px;margin-bottom:0px;">
			[<a href="javascript:document.getElementById('#myUUID1#').style.display='block';document.getElementById('#myUUID2#').style.display='none';void(0)">View All</a>]
			<xmp>#left(attributes.var[item],attributes.stringLimit)#</xmp>
			<strong>...</strong>
			<xmp>#right(attributes.var[item],attributes.stringLimit)#</xmp>
			</div>
			<div id="#myUUID1#" style="display:none;margin-top:0px;margin-bottom:0px;">
			[<a href="javascript:document.getElementById('#myUUID2#').style.display='block';document.getElementById('#myUUID1#').style.display='none';void(0)">View Abridged</a>]
			<xmp>#attributes.var[item]#</xmp>
			</div>
			
			<cfelse>
			<xmp>#attributes.var[item]#</xmp>
			</cfif>
	
			
		<cfelseif isBinary(attributes.var[item])>
			#binaryencode(attributes.var[item],'hex')#
		<cfelseif isArray(attributes.var[item])>
			<cfdump var="#attributes.var[item]#" label="obj">
		<cfelseif len(trim(attributes.var[item])) GT attributes.stringLimit>
			<cfset myUUID1=createUUID()>
			<cfset myUUID2=createUUID()>
			<!--- #right(htmleditformat(attributes.var[item]),attributes.stringLimit)#
			[<a href="javascript:document.getElementById('#myUUID#').style.display=(document.getElementById('#myUUID#').style.display!='none')?'none':'block';void(0)">View All</a>]
			<div id="#myUUID#" style="display:none">#htmleditformat(attributes.var[item])#</div> --->
			
			
			
			<cfif len(trim(attributes.var[item])) GT 2*attributes.stringLimit>
	
			<div id="#myUUID2#" style="display:block;margin-top:0px;margin-bottom:0px;">
				[<a href="javascript:document.getElementById('#myUUID1#').style.display='block';document.getElementById('#myUUID2#').style.display='none';void(0)">View All</a>]
				<xmp>#left(trim(attributes.var[item]),attributes.stringLimit)#</xmp>
				<strong>...</strong>
				<xmp>#right(trim(attributes.var[item]),attributes.stringLimit)#</xmp>
			</div>
			<div id="#myUUID1#" style="display:none;margin-top:0px;margin-bottom:0px;">
				[<a href="javascript:document.getElementById('#myUUID2#').style.display='block';document.getElementById('#myUUID1#').style.display='none';void(0)">View Abridged</a>]
				<xmp>#trim(attributes.var[item])#</xmp>
			</div>
			
			<cfelse>
			<xmp>#trim(attributes.var[item])#</xmp>
			</cfif>
			
			
		<cfelseif right(trim(attributes.var[item]),4) IS ".png" OR right(attributes.var[item],4) IS ".jpg" OR right(attributes.var[item],4) IS ".gif">
			<cftry>
			<cfhttp url="#trim(attributes.var[item])#" result="imageData" />
			<cfif imageData.Responseheader.Status_Code IS 200><img width="200" src="#trim(attributes.var[item])#" border="0"><br></cfif>#trim(attributes.var[item])#
			<cfcatch type="any">#cfcatch.message#</cfcatch>
			</cftry>
		<cfelseif len(trim(attributes.var[item]))>
			#htmleditformat(attributes.var[item])#
		<cfelse><span style="color:##ff9999;">''</span>

		</cfif>
		</td>
</tr>
<cfelseif IsArray(attributes.var[item]) ><cfset rowCount=rowCount+1>

<tr <cfif rowCount mod 2 IS 0>bgcolor="##eeeeee"<cfelse>bgcolor="##ffffff"</cfif>>
	<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="font-size:8pt;">#item# (Array)</span></td>
	<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top">

	<cf_BR_DisplayObject var="#attributes.var[item]#" color="##339933" label="#item#" stringLimit="#attributes.stringLimit#" top="#attributes.top#">
		</td>
</tr>
<cfelseif (isObject(attributes.var[item]) OR isQuery(attributes.var[item])) AND item IS "Data">
<cfset rowCount=rowCount+1>
	<tr <cfif rowCount mod 2 IS 0>bgcolor="##eeeeee"<cfelse>bgcolor="##ffffff"</cfif>>
		<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="font-size:8pt;">#item#</span></td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top">
			<cfset myUUID=createUUID()>
			[<a href="javascript:document.getElementById('#myUUID#').style.display=(document.getElementById('#myUUID#').style.display!='none')?'none':'block';void(0)">View</a>]</div>
			<div id="#myUUID#" style="display:none"><cf_BR_DisplayObject var="#attributes.var.data#" label="Return Object" stringLimit="#attributes.stringLimit#" top="#attributes.top#"> </div>
		</td>
	</tr>
<cfelseif isQuery(attributes.var[item])>
<cfset rowCount=rowCount+1>
	<tr <cfif rowCount mod 2 IS 0>bgcolor="##eeeeee"<cfelse>bgcolor="##ffffff"</cfif>>
		<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="font-size:8pt;">#item#</span></td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top">
			<cfset myUUID=createUUID()>
			[<a href="javascript:document.getElementById('#myUUID#').style.display=(document.getElementById('#myUUID#').style.display!='none')?'none':'block';void(0)">View</a>]</div>
			<div id="#myUUID#" style="display:none"><cf_BR_DisplayObject var="#attributes.var[item]#" label="Return Object" stringLimit="#attributes.stringLimit#" top="#attributes.top#"></div>
		</td>
	</tr>
<cfelseif isObject(attributes.var[item]) AND item IS "Error"><cfset rowCount=rowCount+1>
	<tr <cfif rowCount mod 2 IS 0>bgcolor="##eeeeee"<cfelse>bgcolor="##ffffff"</cfif>>
		<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="font-size:8pt;">#item#</span></td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top">
			<cfset myUUID=createUUID()>
			[<a href="javascript:document.getElementById('#myUUID#').style.display=(document.getElementById('#myUUID#').style.display!='none')?'none':'block';void(0)">View</a>]</div>
			<div id="#myUUID#" style="display:none"><cfdump var="#attributes.var.error#" label="Return Object"> </div>
		</td>
	</tr>
<cfelseif isObject(attributes.var[item])><cfset rowCount=rowCount+1>
	<tr <cfif rowCount mod 2 IS 0>bgcolor="##eeeeee"<cfelse>bgcolor="##ffffff"</cfif>>
		<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="font-size:8pt;">#item#</span></td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top">
			<cfset myUUID=createUUID()>
			<cftry>
					
				<cfset myObjectMetadata=getMetaData(attributes.var[item])>
				<span title="#myObjectMetadata.path#">#myObjectMetadata.name#</span><br>
			<cfcatch type="Any">
				<span title="Unusual Object">Unusual Object</span><br>
			</cfcatch>
			</cftry>
		
			<!--- [<a href="javascript:document.getElementById('#myUUID#').style.display=(document.getElementById('#myUUID#').style.display!='none')?'none':'block';void(0)">View</a>]</div>
			<div id="#myUUID#" style="display:block"> --->
			 <cf_BR_DisplayObject var="#attributes.var[item]#" color="##999999" label="Data" stringLimit="#attributes.stringLimit#" top="#attributes.top#">
			<!--- </div> --->
		</td>
	</tr>
	<cfelse>
		<!--- test for method --->
		<cfset myMethodData=getMetaData(attributes.var[item])>
		<cfif structKeyExists(myMethodData,'parameters')>
		<tr>
		<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="color:##999999">
		<cfif structKeyExists(myMethodData,'access')>#myMethodData.access#<cfelse><i>public</i></cfif> <cfif structKeyExists(myMethodData,'name')>#myMethodData.name#():<cfelse>[unknown]-</cfif><cfif structKeyExists(myMethodData,'returntype')>#myMethodData.returntype#<cfelse><em>unknown</em></cfif></span> </td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top">
		<cfif   arrayLen(myMethodData.parameters)>
		<table border="0" cellpadding="2" cellspacing="0">
		<tr>
		<td class="vsmall" width="75" valign="top"><span style="color:##999999">argument</span> </td>
		<td  class="vsmall" width="75"  valign="top"><span style="color:##999999">type</span></td>
		<td  class="vsmall" valign="top"><span style="color:##999999">required</span></td>
		</tr>
		<cfloop from="1" to="#arrayLen(myMethodData.parameters)#" index="thisParam">
		<cftry>
		<cfsavecontent variable="myArgDetails">
		<tr>
		<td class="vsmall" valign="top"><span style="color:##999999"><cfif structKeyExists(myMethodData.parameters[thisParam],'name')>#myMethodData.parameters[thisParam].name#<cfelse>-</cfif></span> </td>
		<td  class="vsmall" valign="top"><span style="color:##999999" title="#myMethodData.parameters[thisParam].type#"><cfif structKeyExists(myMethodData.parameters[thisParam],'type')>#listlast(myMethodData.parameters[thisParam].type,".")#<cfelse>-</cfif></span></td>
		<td  class="vsmall" valign="top"><span style="color:##999999"><cfif structKeyExists(myMethodData.parameters[thisParam],'required')>#myMethodData.parameters[thisParam].required#<cfelse>-</cfif></span></td>
		</tr>
		</cfsavecontent>
		<cfcatch type="Any"><cfset myArgDetails="<tr><td colspan='3' class='vsmall'><span style='color:##999999'>@317:#cfcatch.message#</div></td></tr>">
		</cfcatch>
		</cftry>
		#myArgDetails#
		</cfloop>
		</table>
		<cfelse>&nbsp;
		</cfif>
		</td>
		<cfelse>
		[#item#]
		<tr>
		<td style="border-bottom:1px ##cccccc solid;border-right:1px ##cccccc solid" class="vsmall" valign="top"><span style="color:##999999">[#item#]</span> </td>
		<td style="border-bottom:1px ##cccccc solid" class="vsmall" valign="top"><span style="color:##999999">
			<cfif isStruct(attributes.var[item])>
			[Hash Table]
			<cfelse>
				unknown item
			</cfif>
		</span><br>
		<cfset myUUID=createUUID()>
		[<a href="javascript:document.getElementById('#myUUID#').style.display=(document.getElementById('#myUUID#').style.display!='none')?'none':'block';void(0)">View</a>]
		<div id="#myUUID#" style="display:none">
		<cfdump var="#attributes.var[item]#" top="3">
		</div>
		</td>
		</tr>
		</cfif>
</cfif>
</cfloop></table>
</cfoutput>
<!--- </cfsilent> --->

