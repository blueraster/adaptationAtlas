<!-- saved from url=(0014)about:internet -->
<html lang="en">

<!-- 
Smart developers always View Source. 

This application was built using Adobe Flex, an open source framework
for building rich Internet applications that get delivered via the
Flash Player or to desktops via Adobe AIR. 

Learn more about Flex at http://flex.org 
// -->

<Cfsetting showdebugoutput="false">
<cfsavecontent variable="headContent">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--  BEGIN Browser History required section -->
<link rel="stylesheet" type="text/css" href="history/history.css" />
<!--  END Browser History required section -->

<title></title>
<script src="AC_OETags.js" language="javascript"></script>

<!--  BEGIN Browser History required section -->
<script src="history/history.js" language="javascript"></script>
<!--  END Browser History required section -->

<style>
/*body { margin: 0px; overflow:hidden }*/
	body {
		margin: 0px 0px 210px 0px;
		text-align:center;
		background: #ffffff;
	}
</style>
<script language="JavaScript" type="text/javascript">
<!--
// -----------------------------------------------------------------------------
// Globals
// Major version of Flash required
var requiredMajorVersion = 9;
// Minor version of Flash required
var requiredMinorVersion = 0;
// Minor version of Flash required
var requiredRevision = 124;
// -----------------------------------------------------------------------------
// -->
var sQueryString = '';
var sUrl = document.location.toString();
var nStart = sUrl.indexOf("?");
var nEnd = sUrl.indexOf("#") - 1;
if (nEnd < 0) nEnd = sUrl.length
if (nStart > 0) {
	sQueryString = sUrl.substr(nStart+1, nEnd-nStart);
}
if (sQueryString == "") {
	//sQueryString = "theme_id=Composition&xmin=-11950000&ymin=2777800&xmax=-8352000&ymax=4900000&casestudies=true&basemap=aerial&case_study_id=cs1"
        //sQueryString = "theme_id=Change&casestudies=false&basemap=aerial&case_study_id=cs1"
	//sQueryString = "theme_id=Change&casestudies=true&basemap=aerial&case_study_id=cs1"
	//sQueryString = "theme_id=Change&casestudies=true&basemap=aeriallabel"
	//sQueryString = "theme_id=Change&casestudies=true&basemap=aeriallabel&case_study_id=cs1"
	//sQueryString = "theme=true&theme_id=Change&casestudies=true&basemap=aeriallabel&case_study_id=cs1"
}

</script>
</cfsavecontent>

<cf_header headContent="#headContent#">


<!--- <div style="position:absolute;top:0; left:0; width:100%; margin: 0px;">
   <div style="position:absolute;width:50%;height:78px;left:0;top:0;margin:0px;background-image:url(html_images/headerleft.png)"></div>
 <div style="position:absolute;width:50%;height:78px;right:0;top:0;margin:0px;background-image:url(html_images/headerright.png)"></div>

</div>
<div style="position:absolute; top:0; left:0; width:100%; margin: 0px;height:78px">
 <div style="margin-left:auto;margin-right:auto;width:990px;"><img src="html_images/header.png" width="990" height="78"/></div>
</div>
 --->
<script language="JavaScript" type="text/javascript">
<!--
// Version check for the Flash Player that has the ability to start Player Product Install (6.0r65)
var hasProductInstall = DetectFlashVer(6, 0, 65);

// Version check based upon the values defined in globals
var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);

if ( hasProductInstall && !hasRequestedVersion ) {
	// DO NOT MODIFY THE FOLLOWING FOUR LINES
	// Location visited after installation is complete if installation is required
	var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
	var MMredirectURL = window.location;
    document.title = document.title.slice(0, 47) + " - Flash Player Installation";
    var MMdoctitle = document.title;

	AC_FL_RunContent(
		"src", "playerProductInstall",
		"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
		"width", "100%",
		"height", "100%",
		"align", "middle",
		"id", "GAtlas_Main",
		"quality", "high",
		"bgcolor", "#ffffff",
		"name", "GAtlas_Main",
		"allowFullScreen", "true",
		"allowScriptAccess","sameDomain",
		"type", "application/x-shockwave-flash",
		"pluginspage", "http://www.adobe.com/go/getflashplayer"
	);
} else if (hasRequestedVersion) {
	// if we've detected an acceptable version
	// embed the Flash Content SWF when all tests are passed
	//"flashvars","theme_id=Composition&xmin=-11950000&ymin=2777800&xmax=-8352000&ymax=4900000&casestudies=true&basemap=aerial&case_study_id=cs1"
	AC_FL_RunContent(
			"src", "GAtlas_Main",
			"width", "100%",
			"height", "100%",
			"align", "middle",
			"id", "GAtlas_Main",
			"quality", "best",
			"bgcolor", "#ffffff",
			"name", "GAtlas_Main",
                        "flashvars", sQueryString,
			"allowFullScreen", "true",
			"allowScriptAccess","sameDomain",
			"type", "application/x-shockwave-flash",
			"pluginspage", "http://www.adobe.com/go/getflashplayer"
	);
  } else {  // flash is too old or we can't detect the plugin
    var alternateContent = 'Alternate HTML content should be placed here. '
  	+ 'This content requires the Adobe Flash Player. '
   	+ '<a href=http://www.adobe.com/go/getflash/>Get Flash</a>';
    document.write(alternateContent);  // insert non-flash content
  }
// -->
//                     
</script>
<noscript>
  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="GAtlas_Main" width="100%" height="100%"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="GAtlas_Main.swf" />
                        <param name="flashvars" value=""/>
			<param name="allowFullScreen" value="true" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<param name="allowScriptAccess" value="sameDomain" />
			<embed src="GAtlas_Main.swf" quality="high" bgcolor="#ffffff"
				flashvars="theme=Change&xmin=-11950000&ymin=2777800&xmax=-8352000&ymax=4900000&casestudies=true"
				width="100%" height="100%" name="GAtlas_Main" align="middle"
				play="true"
				loop="false"
				quality="best"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
</noscript>

<cf_footer>
