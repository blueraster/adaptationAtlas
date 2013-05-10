<!-- saved from url=(0014)about:internet -->
<html lang="en">

<!-- 
Smart developers always View Source. 

This application was built using Adobe Flex, an open source framework
for building rich Internet applications that get delivered via the
Flash Player or to desktops via Adobe AIR. 

Learn more about Flex at http://flex.org 
// -->

<cfsavecontent variable="headContent">

<style>
	#fullHeader{
		position:absolute;
		top:0px;
		left:0px;
		right:0px;
	}
	#flashFooter{
		position:absolute;
		bottom:0px;
		left:0px;
		right:0px;
		width:100%;
	}
</style>

</cfsavecontent>


<cfscript>
	/*
loc=GLOBAL&
tf=PROJECTED_2020&
sc=A1F1 &
fund=1&
ptype=1&
pop=1&
fa_min=10000&
fa_max=25000&
sd_min=1980&
sd_max=2000&
d_min=2&
d_max=4&
x=-60.293&
y=-28.4591&
z=4&
q=5&
v=*&
sel=157|158|159|160"; 
*/
if(isDefined('url.country') AND len(url.country)){
	myCountry=application.gateway.business.getCountryByID(trim(url.country));	
	//myPoint=application.utils.ags.degrees_to_mercator_meters(lon:myCountry.x,lat:myCountry.y);
	url.x=myCountry.x;
	url.y=myCountry.y;
	url.z=5;
}
flashVars="";
if(isDefined('url.restOptions'))flashVars=listAppend(flashVars,"restOptions=#url.restOptions#","&");
if(isDefined('url.loc_name'))	flashVars=listAppend(flashVars,"loc_name=#url.loc_name#","&");
if(isDefined('url.tf'))			flashVars=listAppend(flashVars,"tf=#url.tf#","&");
if(isDefined('url.tf_name'))	flashVars=listAppend(flashVars,"tf_name=#url.tf_name#","&");
if(isDefined('url.sc'))			flashVars=listAppend(flashVars,"sc=#url.sc#","&");
if(isDefined('url.fund'))		flashVars=listAppend(flashVars,"fund=#url.fund#","&");
if(isDefined('url.ptype'))		flashVars=listAppend(flashVars,"ptype=#url.ptype#","&");
if(isDefined('url.pop'))		flashVars=listAppend(flashVars,"pop=#url.pop#","&");
if(isDefined('url.fa_min'))		flashVars=listAppend(flashVars,"fa_min=#url.fa_min#","&");
if(isDefined('url.fa_max'))		flashVars=listAppend(flashVars,"fa_max=#url.fa_max#","&");
if(isDefined('url.sd_min'))		flashVars=listAppend(flashVars,"sd_min=#url.sd_min#","&");
if(isDefined('url.sd_max'))		flashVars=listAppend(flashVars,"sd_max=#url.sd_max#","&");
if(isDefined('url.d_min'))		flashVars=listAppend(flashVars,"d_min=#url.d_min#","&");
if(isDefined('url.d_max'))		flashVars=listAppend(flashVars,"d_max=#url.d_max#","&");


if(isDefined('url.x'))			flashVars=listAppend(flashVars,"x=#url.x#","&");
if(isDefined('url.y'))			flashVars=listAppend(flashVars,"y=#url.y#","&");
if(isDefined('url.z'))			flashVars=listAppend(flashVars,"z=#url.z#","&");
if(isDefined('url.q'))			flashVars=listAppend(flashVars,"q=#url.q#","&");
if(isDefined('url.v'))			flashVars=listAppend(flashVars,"v=#url.v#","&");
if(isDefined('url.sel'))		flashVars=listAppend(flashVars,"sel=#url.sel#","&");

								flashVars=listAppend(flashVars,"jsessionid=#session.sessionid#","&");
</cfscript>

<cf_header headContent="#headContent#" body='scroll="no" style="margin: 125px 0px 25px 0px;"' id="flashHeader">


<cf_flashObject id="GAtlas_Main" flashVars="#flashVars#" width="100%" height="100%">

<cf_footer id="flashFooter">
