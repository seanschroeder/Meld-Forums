<cfimport prefix="ui" taglib="/MeldForums/admin/ui" />

<cfoutput>

<!--- update --->
<cfif rc.conferenceBean.getBeanExists()>
	<form action="#buildURL('admin:conferences.edit')#" method="post">	
<cfelse><!--- save --->
	<form action="#buildURL('admin:conferences.edit')#" method="post">	
</cfif>
	
	<input type="hidden" name="conferenceID" value="#rc.conferenceBean.getConferenceID()#">
			
	<span id="msg">
	
	</span>
		
	<div class="tabbable tabs-left">

		<ul class="nav nav-tabs tabs initActiveTab">
			<li><a href="##tabBasic" data-toggle="tab"><span>#rc.mmRBF.key('general')#</span></a></li>
			<li><a href="##tabTags" data-toggle="tab"><span>#rc.mmRBF.key('options')#</span></a></li>
		</ul><!--- /nav-tabs --->

		<div class="tab-content row-fluid">
			
			<div id="tabBasic" class="tab-pane">
	
				<span id="extendset-container-tabbasictop" class="extendset-container"></span>

				<div class="fieldset">

					<!--- name --->
					<ui:TextInput key="conferencename"	name="conferencebean_name" />

					<!--- title --->
					<ui:TextInput key="conferencetitle"	name="conferencebean_title" />

					<!--- friendlyname --->
					<ui:TextInput key="friendlyname" 	name="conferencebean_friendlyname" />

					<!--- description --->
					<ui:TextInput key="description" 	name="conferencebean_description" />
	
				</div><!--- /fieldset ---> 
		
				<div class="load-inline tab-preloader"></div>
		
				<div class="form-actions">
				
					<a href="#buildURL('admin:conferences.default')#" class="btn"><i class="icon-remove"></i> Cancel</a>
					<button type="submit" class="btn" ><i class="icon-check"></i> save</button>
					 
				</div><!--- /form-actions --->

			</div><!--- /tabbasic --->

			
			<div id="tabTags" class="tab-pane">
	
				<span id="extendset-container-tabbasictop" class="extendset-container"></span>

				<div class="fieldset">
		

<!--- <div id="msTabs-Options">
		<h3>#rc.mmRBF.key('options')#</h3>
		<ul class="form">
			<li class="first">
				<label for="conferencebean_orderno">#rc.mmRBF.key('orderno')#<a href="##" class="tooltip"><span>#rc.mmRBF.key('orderno','tip')#</span>&nbsp;</a></label>
				<input class="text tiny" type="text" name="conferencebean_orderno" id="conferencebean_orderno" value="#form.conferencebean_orderno#" size="30" maxlength="100" data-required="true" data-validate="string" data-message="#rc.mmRBF.key('conferencename','validation')#" />
			</li>
			<li class="checkbox padded">
				<input class="checkbox" type="checkbox" name="conferencebean_isactive" id="conferencebean_isactive" value="1" <cfif form.conferencebean_isactive>CHECKED</cfif>/>
				<label for="conferencebean_isactive">#rc.mmRBF.key('isactive')#<a href="##" class="tooltip"><span>#rc.mmRBF.key('isactive','tip')#</span>&nbsp;</a></label>
			</li>
		</ul>
	</div> --->



	
				</div><!--- /fieldset ---> 
		
				<div class="load-inline tab-preloader"></div>
		
				<div class="form-actions">
				
					 <button type="button" class="btn" onclick="if(siteManager.ckContent(draftremovalnotice)){submitForm(document.contentForm,'add');}"><i class="icon-check"></i> Save Draft</button>
					
					<button type="button" class="btn" onclick="document.contentForm.approved.value=1;if(siteManager.ckContent(draftremovalnotice)){submitForm(document.contentForm,'add');}"><i class="icon-check"></i> Publish</button>
					<input name="btaction" type="submit" class="btn" value="save" />
					 
				</div><!--- /form-actions --->

			</div><!--- /tabbasic --->


		</div><!--- /content-tab --->
	</div><!--- /tabbable --->

</form>
</cfoutput>




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

