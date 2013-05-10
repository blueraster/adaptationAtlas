


<cfparam name="url.id" default="99999999">
<cfset myLinkConfirmUser=createObject('component','org.rff.atlas.vo.UserVO').getUserFromHash(url.id)>
<cfset myLinkConfirmUser.confirm()>

<cf_header>

<div id="content">

<h3>User Account Confirmation</h3>
<cfoutput>
<cfif myLinkConfirmUser.statusID IS 20>
#application.config.message.USER_ACCOUNT_HAS_BEEN_CONFIRMED#
<cfelse>
The system has detected an issue with this confirmation link.  Please try again or contact an administrator.
</cfif>
</cfoutput>
</div>
<cf_footer>