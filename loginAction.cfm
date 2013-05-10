<cfset request.errorMessage="">


<cfscript>
myUser=createObject('component','org.rff.atlas.vo.UserVO').init();
myUser.username=form.un;
myUser.setpassword(form.pw);	
loginUser=application.remote.user.loginuser(myUser);	
</cfscript>
<cfif loginUser.success IS 1>
	<cflocation addtoken="false" url="index.cfm">
<cfelse>
	<cfset request.errorMessage=loginUser.message>
</cfif>
