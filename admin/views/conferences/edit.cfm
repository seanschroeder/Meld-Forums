<cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm">
<input type="hidden" name="action" value="conferences.edit">
<input type="hidden" name="conferenceID" value="#rc.conferenceBean.getConferenceID()#">
<div id="msTabs">
	<ul>
		<li><a id="msTabs-General-Tab" href="##msTabs-General">#rc.mmRBF.key('general')#</a></li>
		<li><a id="msTabs-Options-Tab" href="##msTabs-Options">#rc.mmRBF.key('options')#</a></li>
		<li><a id="msTabs-Config-Tab" href="##msTabs-Config">#rc.mmRBF.key('configuration')#</a></li>
	</ul>
	<div id="msTabs-panels">
		#view("conferences/includes/conferences_edit_general")#
		#view("conferences/includes/conferences_edit_options")#
		#view("conferences/includes/conferences_edit_config")#
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" type="submit" class="submit ui-state-default" value="cancel"></li>
			<cfif rc.conferenceBean.beanExists()>
				<li><input name="btaction" type="submit" class="submit ui-state-default" value="update"></li>
				<li class="right">
					<input type="hidden" id="btdeleteconfirm" name="btdeleteconfirm" value="" />
					<input data-delete="#rc.mmRBF.key('delete')#" data-cancel="#rc.mmRBF.key('cancel')#" data-title="#rc.mmRBF.key('delete')#" data-message="#rc.mmRBF.key('deleteconference-msg')#" id="btdelete" name="btaction" type="submit" class="submit ui-state-highlight" value="delete">
				</li>
			<cfelse>
				<li><input name="btaction" type="submit" class="submit ui-state-default" value="save"></li>
			</cfif>
		</ul>
	</div>
</div>	
</form>
<!--- end content --->
</cfoutput> 
