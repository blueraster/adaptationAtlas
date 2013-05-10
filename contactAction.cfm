

<cfparam name="form.name" default="">
<cfparam name="form.organization" default="">
<cfparam name="form.email" default="">
<cfparam name="form.topic" default="">
<cfparam name="form.message" default="">

<cfset myString="#NAME#|#organization#|#email#|#topic#|#message#">
<cfset success=application.gateway.security.audit("CONTACT",left(myString,255))>

<cfmail subject="#application.config.CONTACT_US_SUBJECT# (#NAME#)" to="#application.config.CONTACT_US_TO#" from="#application.config.CONTACT_US_FROM#" type="text/html">

<strong>Name:</strong><br>
#NAME#<br><br>

<strong>Organization:</strong><br>
#organization#<br><br>

<strong>Email:</strong><br>
#email#<br><br>

<strong>Topic:</strong><br>
#topic#<br><br>

<strong>Message:</strong><br>
#message#<br><br>


</cfmail>
<cflocation addtoken="false" url="contact.cfm?confirm=true">
