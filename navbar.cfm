  

<cfset currentpage=listlast(cgi.PATH_INFO,"/\")>
<div id="navbar">
    <div id="mainnav">
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td><a href="index.cfm">
			<img src="images/topnav/home_<cfif currentpage IS "index.cfm">on<cfelse>off</cfif>.png" alt="Home" name="topnavhome" width="88" height="23" border="0" id="topnavhome" onmouseover="MM_swapImage('topnavhome','','images/topnav/home_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></td>
          <td><a href="myAtlas.cfm"><img src="images/topnav/atlas_<cfif currentpage IS "myAtlas.cfm">on<cfelse>off</cfif>.png" alt="My Atlas" name="topnavatlas" width="110" height="23" border="0" id="topnavatlas" onmouseover="MM_swapImage('topnavatlas','','images/topnav/atlas_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></td>
          <td><a href="resources.cfm"><img src="images/topnav/resources_<cfif currentpage IS "resources.cfm">on<cfelse>off</cfif>.png" alt="resources" name="topnavresources" width="127" height="23" border="0" id="topnavresources" onmouseover="MM_swapImage('topnavresources','','images/topnav/resources_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></td>
          <td><a href="data.cfm"><img src="images/topnav/data_<cfif currentpage IS "data.cfm">on<cfelse>off</cfif>.png" alt="Data" name="topnavdata" width="82" height="23" border="0" id="topnavdata" onmouseover="MM_swapImage('topnavdata','','images/topnav/data_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></td>
          <td><a href="map.cfm"><img src="images/topnav/map_<cfif currentpage IS "map.cfm">on<cfelse>off</cfif>.png" alt="Map" name="topnavmap" width="77" height="23" border="0" id="topnavmap" onmouseover="MM_swapImage('topnavmap','','images/topnav/map_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></td>
          <td><a href="about.cfm"><img src="images/topnav/about_<cfif currentpage IS "about.cfm">on<cfelse>off</cfif>.png" name="topnavabout" width="93" height="23" border="0" id="topnavabout" onmouseover="MM_swapImage('topnavabout','','images/topnav/about_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></td>
    
			<!--- <cfif 1 is 1 or isUserInRole("ADMIN")>
			<td width="100">&nbsp;</td>
			<td width="100"><a href="admin.cfm">Admin</a></td>
			</cfif>  --->
	   </tr>
      </table>
    </div>
    <div id="helpbutton"> <a href="help.cfm"><img src="images/topnav/help_off.png" alt="Help" name="topnavhelp" width="88" height="23" border="0" id="topnavhelp" onmouseover="MM_swapImage('topnavhelp','','images/topnav/help_on.png',1)" onmouseout="MM_swapImgRestore()" /></a></div>
  </div>
<!--- <cfoutput>
<div class="navbar">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td width="70"><a href="index.cfm">Home</a></td>
<td width="135"><a href="about.cfm">About the Atlas</a></td>
<td width="60"><a href="map.cfm">Map</a></td>
<td width="60"><a href="data.cfm">Data</a></td>
<td width="95"><a href="resources.cfm">Resources</a></td>
<td width="100"><a href="myAtlas.cfm">My Atlas</a></td>
<td>&nbsp;</td>
<td width="80" align="right"><a href="help.cfm">Help</a></td>
</tr>
</table>
</div>
</cfoutput> --->
