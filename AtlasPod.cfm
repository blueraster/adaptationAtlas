

<cfif thisTag.ExecutionMode IS "START">
	<cfparam name="attributes.title" default="">
	<cfparam name="attributes.height" default="200">
	<cfparam name="attributes.width" default="400">
</cfif>	

<cfif thisTag.ExecutionMode IS "END">
 <cfsavecontent variable="VARIABLES.NewContent">
	<cfoutput>
			
			<!--- <a href='test' style='float:right;background-color:##663300;color:##ffffff;'>&nbsp;I&nbsp;</a> --->
		<cfpod 
		    headerStyle = "color:##643A0D;"  
		    	
		    name = "string" 
		    title = "#attributes.title#" 
		    width = "#attributes.width#" height ="#attributes.height#">#thistag.generatedcontent#</cfpod>
	</cfoutput>
	</cfsavecontent>
<cfset THISTAG.GeneratedContent = VARIABLES.NewContent /> 
</cfif>

