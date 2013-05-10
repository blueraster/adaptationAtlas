



<cf_header>

<div id="content">

<h3>Contact Us</h3>


<p>Thank you for your interest in the Global Adaptation Atlas Initiative at Resources for the Future. </p>
<cfif isDefined('url.confirm')>
	<p><strong>You message has been sent.</strong></p>
<cfelse>
<p>Have a question about the website? Need help with the Atlas application? Want to know how it works? Our <a href="faq.cfm">Frequently Asked Questions</a> section on the website may answer many of your questions. Alternatively, please use the form below to contact us directly. </p>
<cfform format="flash" action="contactAction.cfm" height="260" skin="haloBlue" timeout="300"> 
<cfinput name="name" required="true" label="Name" size="30" message="Your name is required">
<cfinput name="Organization" required="false" label="Organization" size="30">
<cfinput name="email" required="true" label="E-mail Address" validate="email"  size="30" message="The email address does not appear valid">
<cfselect name="topic" required="true" label="Topic" width="300" message="A topic is required">
	
<option value="General Inquiries">General Inquiries</option>
<option value="Data Contributions">Data Contributions</option>
<option value="Website">Website</option>
<option value="Map Viewer">Map Viewer</option>
<option value="Partnership and Support Inquiries">Partnership and Support Inquiries</option>
<option value="Other">Other</option>
</cfselect>
<cftextarea name="message" required="true" label="Your Message" width="400" height="100"  message="Your message is required" /> 
<cfinput name="submit" type="submit"  value="Submit">

</cfform>
</cfif>
<!--- <form action="contactAction.cfm">
<table>
	<tr><td>Name*</td>				<td><input name="name" size="30" type="text"></td></tr>
	<tr><td>Organization</td>		<td><input name="organization" size="30" type="text"></td></tr>
	<tr><td>E-mail Address*</td>	<td><input name="email" size="30" type="text"></td></tr>
	<tr><td>Topic*</td>				<td>
									<select name="topic">
										<option value="General Inquiries">General Inquiries</option>
										<option value="Data Contributions">Data Contributions</option>
										<option value="Website">Website</option>
										<option value="Map Viewer">Map Viewer</option>
										<option value="Partnership and Support Inquiries">Partnership and Support Inquiries</option>
										<option value="Other">Other</option>
									</select>
									</td></tr>
	<tr><td>Your Message*</td>		<td><textarea name="message" rows="8" cols="40"></textarea></td></tr>
</table>
</form> --->
			
				

<p>Or you can contact us the old fashioned way at:</p>
<p>
	Resources for the Future<br>
c/o Global Adaptation Atlas <br>
1616 P St. NW,<br>
Washington, DC 20036<br>
Phone: +1-202-328-5000<br>
Fax: +1-202-939-3460<br>
</p>


</div>
<cf_footer>

