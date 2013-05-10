<cfif isDefined('form.email')>
<cfinclude template="profileAction.cfm">
</cfif>


<cf_header>



<div id="content">

<h3>Update your Atlas Account Profile</h3>

<p>We never give away your information.  View our <a href="privacy-policy.cfm" target="_blank">privacy statement</a></p>


<cfif isDefined('request.errorMessage') AND len(request.errorMessage)>
<cfoutput><span style="color:##FF0000">&nbsp;&nbsp;NOTICE: #request.errorMessage#</span></cfoutput>
</cfif>
<cfset myLookupdata=application.gateway.users.getLookupDataForProfile()>


<cfform name="myForm" format="flash" action="profile.cfm"  preservedata="true"  skin="haloBlue" style="backgroundAlpha:50;" width="820" height="330" timeout="500"> 

<cfformgroup type="Hbox" label="test"  style="horizontalAlign:left;backgroundAlpha:50;" >
	<cfformgroup type="panel"  label="My Atlas Profile" width="400" style="horizontalAlign:right;">
		<cfinput  name="firstName" required="true" label="First/Given Name:" value="#session.user.firstname#"  size="25" message="First name is required">
		<cfinput name="lastName" required="true" label="Last/Family Name:" value="#session.user.lastname#"  size="25" message="Last name is required">
		<cfselect name="occupation" query="myLookupdata.occupationData" display="label" selected="#session.user.OCCUPATIONID#" value="id" size="1" queryposition="below"   required="true" label="Occupation" width="250" message="Occupation is required">
			<option value="">Select an occupation</option>
		</cfselect>
		<cfselect name="organizationType"  query="myLookupdata.organizationTypeData" display="label" selected="#session.user.organizationTypeId#" value="id" required="true" queryposition="below"  label="Organization Type" width="250" message="Organization type is required" >
		<option value="">Select an organization type</option>
		</cfselect>
		<cfif len(session.user.COUNTRY)>
			<cfset selectedCountry=session.user.COUNTRY>
		<cfelse>
			<cfset selectedCountry="USA">
		</cfif>
		
		<cfselect name="country" selected="#selectedCountry#"  query="myLookupdata.countryData" display="label" value="id" required="true" label="Country" width="250" message="Country type is required">
		
		</cfselect>
		<cfinput name="city" required="true" label="City:" value="#session.user.town#"  size="25" message="City is required">
		
		<cfinput name="email" required="true" label="Email:" value="#session.user.email#" validate="email"  size="25" message="Email does not appear valid">

		
		<cfinput name="password" type="password" required="true"  label="Password:"  value="                 "   size="25" message="Password is required">
	
		<cfformitem  type="hrule" />
		
		<cfformgroup type="Hbox">
			<cfformgroup type="Vbox">
				<cfinput type="Checkbox" required="true" name="agreeToTerms" Label="Agree to Terms" message="You must agree to terms">
			 </cfformgroup>
			<cfformgroup type="Vbox">
				<cfformitem  type="html"><a href="terms-of-service.cfm" target="_blank"><u>View Terms</u></a></cfformitem>
			 </cfformgroup> 
	  	</cfformgroup>
	</cfformgroup>
	
		<!--- <cfformitem type="spacer" width="15" /> --->
	<cfformgroup type="panel" label="My Atlas Preferences" width="400" style="horizontalAlign:right;">
		<cfformgroup type="Vbox">
				<cfformitem  type="text" >
				To receive timely updates about new information added to the Adaptation Atlas, please select regions and themes that interest you. You can change these preferences in your My Atlas account at anytime. 
				</cfformitem>
				
				<cfformgroup type="Hbox">
					<cfformgroup type="Vbox" style="verticalGap:0px;">
						<cfformitem  type="text" >
						Regions of Interest:
						</cfformitem>
						
						<cfloop query="myLookupdata.regionsOfInterestData">
						 <cfinput type="Checkbox" checked="#listFind(arrayToList(session.user.regionsOfInterest),myLookupdata.regionsOfInterestData.id)#" name="regionsOfInterest_#myLookupdata.regionsOfInterestData.id#"  value="#myLookupdata.regionsOfInterestData.label#"  label="#myLookupdata.regionsOfInterestData.label#">
				        </cfloop>
				    <!--- <cfformgroup type="repeater" query="q1">
				           <cfinput type="Checkbox" name="regionsOfInterest" checked="true"  bind="{q1.currentItem['id']}" label="{q1.currentItem.label} {Boolean((q1.currentItem.id==6)?true:false).toString()}">
				         
				    </cfformgroup> --->

					</cfformgroup>
			
					<cfformgroup type="Vbox" style="verticalGap:0px;">
						<cfformitem  type="text" >
						Themes of Interest:
						</cfformitem>
						<cfloop query="myLookupdata.themesOfInterestData">
						 <cfinput type="Checkbox" checked="#listFind(arrayToList(session.user.themesOfInterest),myLookupdata.themesOfInterestData.id)#" name="themeOfInterest_#myLookupdata.themesOfInterestData.id#"  value="#myLookupdata.themesOfInterestData.id#"  label="#myLookupdata.themesOfInterestData.label#">
				        </cfloop>
					</cfformgroup>
				</cfformgroup>
				<cfformitem  type="hrule" />
		
			<cfformgroup type="hbox" style="horizontalGap:0px;">
			<!--- <cfformitem  type="text" >Other Preferences:</cfformitem> --->
			
				<cfformgroup type="Vbox" style="horizontalGap:0px;">>
					<cfinput type="Checkbox" checked="#session.user.sendAlertId NEQ 'OPT_OUT'#" name="optIn" Label="Send me updates via email." width="170">
	   			 </cfformgroup>
				
				<cfformgroup type="Vbox" style="horizontalGap:0px;">
					<cfselect name="emailFrequency" label="" width="80" selected="#session.user.SENDALERTID#" message="Organization type is required">
					<option <cfif session.user.SENDALERTID IS "WEEKLY">selected</cfif> value="WEEKLY">Weekly</option>
					<option <cfif session.user.SENDALERTID IS "MONTHLY">selected</cfif> value="MONTHLY">Monthly</option>
					<option <cfif session.user.SENDALERTID IS "QUARTER">selected</cfif> value="QUARTER">Quarterly</option>
					</cfselect>
	   			 </cfformgroup>
				<cfformgroup type="Vbox">
					<cfinput  name="submit" type="submit"  value="Submit">
				</cfformgroup>
			
			</cfformgroup>

		</cfformgroup>
	
	</cfformgroup>
	
</cfformgroup>
</cfform>


</div>

<br><br><br><br><br><br>
<cf_footer>