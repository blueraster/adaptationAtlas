
<cfset request.errorMessage="">

<cfscript>
	myUser=createObject('component','org.rff.atlas.vo.UserVO').init();
	myUser.firstName=form.firstname;
	myUser.lastname=form.lastname;

	myUser.email=form.email;
	myUser.userName=form.email;
	//myUser.password=form.xxxxxxxxxxxxxx;
	myUser.occupationId=form.occupation;
	myUser.organizationTypeId=form.organizationType;
	myUser.country=form.country;
	myUser.town=form.city;
	if(form.optIn)	myUser.sendAlertId=emailFrequency;
	else			myUser.sendAlertId="OPT_OUT";
	myUser.acceptedTerms=now();
	//myUser.roles=form.xxxxxxxxxxxxxx;
	myUser.setPassword(form.PASSWORD);
</cfscript>
<cfloop collection="#form#" item="item">
	<cfif item CONTAINS "REGIONSOFINTEREST_">
		<cfscript>
			if( evaluate(item)){
			success=arrayAppend(myUser.regionsOfInterest,rereplacenocase(item,"regionsOfInterest_","","all"));
			}

		</cfscript>
	</cfif>
	<cfif item CONTAINS "THEMEOFINTEREST_">
		<cfscript>
			if( evaluate(item)){
			success=arrayAppend(myUser.themesOfInterest,rereplacenocase(item,"themeOfInterest_","","all"));
			}

		</cfscript>
	</cfif>
</cfloop>

<cftry>
<cfset myUser.save()>
<cfcatch type="ACCOUNT_EXISTS">
<cfset request.errorMessage="An account with this email address already exists.">
</cfcatch>
</cftry>

<cfif len(request.errorMessage) IS 0>
	<cfset myHash=myUser.getHash()>
	<cfmail subject="#application.config.CONFIRM_MEMBERSHIP_SUBJECT# (#myuser.lastname#)"
			to="#application.config.CONFIRM_MEMBERSHIP_ADMIN_CC#"
			from="#application.config.CONFIRM_MEMBERSHIP_FROM#"
			type="text/html">
			<cf_BR_DisplayObject var="#myUser#" label="myUser" stringLimit="500">
	</cfmail>
	
	<cfmail subject="#application.config.CONFIRM_MEMBERSHIP_SUBJECT# (#myuser.lastname#)"
			to="#myUser.email#"
			from="#application.config.CONFIRM_MEMBERSHIP_FROM#"
			type="text/html">
	<p>Hello #myUser.firstname#,</p>
	
	<p>Thank you for your interest in the Global Adaptation Atlas initiative and for signing up for a My Atlas Account. </p>
	<p>Please click on this link to complete your registration process:</p>
		
		<blockquote>
				#application.environment.confirmation_Endpoint#?id=#myHash#
		</blockquote>
		
	<p>Alternatively, you can copy and paste the address into your browser address bar.</p>
	<p>Get started on using the Global Adaptation Atlas:</p>
	<ol>
	<li>Use our Map Explorer to visualize impact studies and adaptation activities. </li>
	<li>Contribute to the Adaptation Atlas by uploading your data or activities. </li>
	<li>Set up alerts to get timely email notifications on newly added information. </li>
	</ol>
	<p>Visit www.adaptationatlas.org for more. Please don't hesitate to contact us at info@adaptationatlas.org or use our online Contact form. </p>
	
	<p>Best,</p>
	
	<p>#application.config.CONFIRM_MEMBERSHIP_SIGNATURE#</p>
	
	</cfmail>
	<cflocation addtoken="false" url="register-confirmation.cfm">
</cfif>
