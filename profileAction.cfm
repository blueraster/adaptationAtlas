
<cfset request.errorMessage="">

<cfscript>
	myUser=createObject('component','org.rff.atlas.vo.UserVO').init();
	session.user.firstName=form.firstname;
	session.user.lastname=form.lastname;

	session.user.email=form.email;
	session.user.userName=form.email;
	//myUser.password=form.xxxxxxxxxxxxxx;
	session.user.occupationId=form.occupation;
	session.user.organizationTypeId=form.organizationType;
	session.user.country=form.country;
	session.user.town=form.city;
	if(form.optIn)	session.user.sendAlertId=emailFrequency;
	else			session.user.sendAlertId="OPT_OUT";
	session.user.acceptedTerms=now();
	//myUser.roles=form.xxxxxxxxxxxxxx;

	//only update if changed
	if(len(trim(form.PASSWORD))) session.user.setPassword(form.PASSWORD);
	
	//clear interests before repopulating below
	session.user.regionsOfInterest=arrayNew(1);
	session.user.themesOfInterest=arrayNew(1);
</cfscript>
<cfloop collection="#form#" item="item">
	<cfif item CONTAINS "REGIONSOFINTEREST_">
		<cfscript>
			if( evaluate(item)){
			success=arrayAppend(session.user.regionsOfInterest,rereplacenocase(item,"regionsOfInterest_","","all"));
			}
		</cfscript>
	</cfif>
	<cfif item CONTAINS "THEMEOFINTEREST_">
		<cfscript>
			if( evaluate(item)){
			success=arrayAppend(session.user.themesOfInterest,rereplacenocase(item,"themeOfInterest_","","all"));
			}
		</cfscript>
	</cfif>
</cfloop>

<cftry>
<cfset session.user.save()>
<cfcatch type="ACCOUNT_EXISTS">
<cfset request.errorMessage=cfcatch.message>
</cfcatch>
</cftry>

<cfif len(request.errorMessage) IS 0>
	<cfmail subject="#application.config.UPDATE_PROFILE_SUBJECT# (#session.user.lastname#)"
			to="#application.config.CONFIRM_MEMBERSHIP_ADMIN_CC#"
			from="#application.config.CONFIRM_MEMBERSHIP_FROM#"
			type="text/html">
				<p>Profile Updated:</p>
			<cf_BR_DisplayObject var="#session.user#" label="myUser" stringLimit="500">
	</cfmail>
	
	<cfmail subject="#application.config.UPDATE_PROFILE_SUBJECT# (#session.user.lastname#)"
			to="#session.user.email#"
			from="#application.config.CONFIRM_MEMBERSHIP_FROM#"
			type="text/html">
	<p>Hello #myUser.firstname#,</p>
	
	<p>Thank you for your continued interest in the Global Adaptation Atlas initiative. </p>		
	<p>This note confirms that you recently updated your user profile.
		If you have not recently updated your profile for the Global Adaptation Atlas, please contact us at info@adaptationatlas.org.
	</p>
	

	<p>Visit www.adaptationatlas.org for more. Please don't hesitate to contact us at info@adaptationatlas.org or use our online Contact form. </p>
	
	<p>Best,</p>
	
	<p>#application.config.CONFIRM_MEMBERSHIP_SIGNATURE#</p>
	
	</cfmail>
	<cflocation addtoken="false" url="profile-confirmation.cfm">
</cfif>
