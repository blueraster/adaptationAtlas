<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<cfsetting showdebugoutput="false">
<cfoutput>
	<cfparam name="attributes.title" default="Global Adaptation Atlas">
	<cfparam name="attributes.headContent" default="">
	<cfparam name="attributes.body" default="">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>#attributes.title#</title>
<style>

input{
	font-family:verdana;
	font-size:8pt;
	}

</style>

#attributes.headContent#
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="mm_code.js"></script>
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" #attributes.body#>

<div id="fullHeader">
<div id="container">
  <div id="header">
   <div id=logo>
	<table cellpadding="0" cellspacing="0" border="0">
		<tr><td>
			<a href="index.cfm">
			<img height="90" alt="Adaptation Atlas - Resources for the Future" src="images/logo.png" width="183" border="0">
			</a>
		</td>
		<td><a href="http://www.rff.org" target="_blank">
			<img border="0" src="images/tagline.png" width="181" height="90" alt="Resource for the Future">
			</a>
		</td></tr>
	</table></div>

    <div id="login">
		<!--- <a href="login.cfm" class="loginlink">Log in</a> | <a href="register.cfm" class="loginlink">Register</a> --->
	
		<cfif IsUserLoggedIn()>
		<em>#session.user.FULLNAME#</em>&nbsp;<a href="logout.cfm" class="loginlink">Logout</a>
		<cfelse>
		<a href="login.cfm" class="loginlink">Log in</a> | <a href="register.cfm" class="loginlink">Register</a>
		</cfif>
		<br />
	    <br />
       <!---  <form action="search.cfm" method="post">
		<input name="query" type="text" value="Search Website..." onfocus="this.value='';" style="width:150px;color:999999;">
        <input type="submit" value="Go!" style="padding:0px 3px 0px 3px">
      </form> --->
<div id="cse-search-form" style="width: 215px;margin-left:25px;">Loading</div>

<div id="cse" style="width:300px;top: 125px;right:10px;position:absolute;background-color:##ffffff;border:##999999 dotted 0px;"></div>


    </div>
  </div>
</div>

<script src="http://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript">
  google.load('search', '1', {language : 'en'});
  google.setOnLoadCallback(function(){
    var customSearchControl = new google.search.CustomSearchControl('013448648160779846687:gjkz16m3tny');
    customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
    var options = new google.search.DrawOptions();
    options.setSearchFormRoot('cse-search-form');
    customSearchControl.draw('cse', options);
  }, true);
</script>

<!--- 
<table cellpadding="0" cellspacing="0" border="1" width="100%">
<tr>
	<td width="200"><a href="index.cfm"><img src="" width="200" height="70" alt="Logo" border="0"></a></td>
	<td><img src="" width="100%" height="70" alt="Header"></td>
	<td width="200" align="right" valign="top">
		<div style="padding:5px;">
		<cfif IsUserLoggedIn()>
		<em>#session.user.FULLNAME#</em>&nbsp;<a href="logout.cfm">Logout</a>
		<cfelse>
		<a href="login.cfm">Log in</a> | <a href="register.cfm">Register</a>
		</cfif>
		</div>
		<div style="padding:5px;">
		<form action="search.cfm" method="post">
		<input name="query" type="text" value="Search Website..." onfocus="this.value='';" style="width:150px;color:999999;font-family:tahoma;font-size:8pt;">
		<input type="submit" value="Go!" style="width:26px;font-family:tahoma;font-size:8pt;" >
		</form>

		</div>
	</td>
</tr>
</table> --->
</cfoutput>


<cf_navbar>
</div>