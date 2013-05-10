


<cfif isDefined('form.un')>
<cfinclude template="loginAction.cfm">
</cfif>


<cf_header>

<div id="content" align="center">
<!--- <table background="images/loginScreen.jpg" width="326" height="145">
	<tr><td valign="middle" align="center" >
	<form action="loginAction.cfm" method="post">
		<table border="0" cellpadding="3" cellspacing="0" width="270">
			<tr><td colspan="2" align="left">&nbsp;</td></tr>
			<tr><td class="vsmall">Name</td>		<td>&nbsp;</td>	<td><input name="un" type="text" value="sansari@blueraster.com" style="width:170px;"></td></tr>
			<tr><td class="vsmall">Password</td>	<td>&nbsp;</td>	<td><input name="pw" type="password" value="" style="width:170px;"></td></tr>
			<tr><td colspan="2" align="left"><input type="submit" value="Login"></td></tr>
		</table>
	</form>
	</td></tr>
</table> --->
<cfif isDefined('request.errorMessage') AND len(request.errorMessage)>
<cfoutput><div style="color:##FF0000">&nbsp;&nbsp;NOTICE: #request.errorMessage#</div></cfoutput>
</cfif>
<cfform format="flash" action="login.cfm" preservedata="true"  skin="haloBlue" height="150" width="325"  timeout="300"> 
<cfformgroup type="panel" label="Login" style="marginBottom:10px;marginTop:10px;horizontalAlign:center;">
	<cfinput type="text" name="un" required="true" validate="email" Label="Name" width="200" message="Email does not appear valid">
	<cfinput type="password"  name="pw" required="true" Label="Password" width="200" message="Password is required">

	
			<cfformgroup type="Hbox">
				<cfformgroup type="Vbox">
					<cfformitem type="spacer" width="180"></cfformitem>
				 </cfformgroup>
				<cfformgroup type="Vbox">
					<cfinput  name="submit" type="submit"  value="Login">
				</cfformgroup>
   			 </cfformgroup>
</cfformgroup>
</cfform>
	<!--- <cf_flashObject id="login" width="330" height="145"> --->
	

</div>


<cf_footer> 