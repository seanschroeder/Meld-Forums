<cfimport prefix="ui" taglib="../../ui" />
<cfoutput>

<!--- update --->
<cfif rc.configurationBean.getBeanExists()>
	<form action="#buildURL('admin:configurations.edit?btaction=update')#" method="post">	
<cfelse><!--- save --->
	<form action="#buildURL('admin:configurations.edit?btaction=save')#" method="post">	
</cfif>
	
	<input type="hidden" name="configurationID" value="#rc.configurationBean.getConfigurationID()#">
			
	<span id="msg"></span>
		
	<div class="tabbable tabs-left">

		<ul class="nav nav-tabs tabs initActiveTab">
			<li><a href="##tabBasic" 		data-toggle="tab"><span>#rc.mmRBF.key('general')#</span></a></li>
			<li><a href="##tabPermissions" 	data-toggle="tab"><span>#rc.mmRBF.key('permissions')#</span></a></li>
			<li><a href="##tabOptions" 		data-toggle="tab"><span>#rc.mmRBF.key('options')#</span></a></li>
		</ul><!--- /nav-tabs --->

		<div class="tab-content row-fluid">
			
			<div id="tabBasic" class="tab-pane">
	
				<span id="extendset-container-tabbasictop" class="extendset-container"></span>

				<div class="fieldset">

					<!--- name --->
					<ui:TextInput key="configurationname"	name="configurationbean_name" />

					<!--- title --->
					<ui:TextArea key="description"			name="configurationbean_description" />


				</div><!--- /fieldset ---> 
		
				<div class="load-inline tab-preloader"></div>
		
				<div class="form-actions">
				
					<a href="#buildURL('admin:configurations.default')#" class="btn"><i class="icon-remove"></i> Cancel</a>
					<button type="submit" class="btn" ><i class="icon-check"></i> save</button>
					 
				</div><!--- /form-actions --->

			</div><!--- /tabbasic --->

			<div id="tabPermissions" class="tab-pane">

				<span id="extendset-container-tabbasictop" class="extendset-container"></span>

				<div class="fieldset padded">

					<label class="control-label">#rc.mmRBF.key('admingroups')#</label>
					<table class="table table-striped table-condensed table-bordered mura-table-grid">
					<tr> 
						<th>#application.rbFactory.getKeyValue(session.rb,'permissions.inherit')#</th>
						<th>#rc.mmRBF.key('AllowRead')#</th>
						<th>#rc.mmRBF.key('AllowContribute')#</th>
						<th>#rc.mmRBF.key('AllowModerate')#</th>
						<th>#rc.mmRBF.key('Groups')#</th>
					</tr>

					<cfif rc.qGroupsPrivate.recordcount>
					<cfloop query="rc.qGroupsPrivate">
						<tr> 
							<td><input name="" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictReadGroups,groupname)>checked</cfif>></td>
							<td><input name="" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictReadGroups,groupname)>checked</cfif>></td>
							<td><input name="" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictContributeGroups,groupname)>checked</cfif>></td>
							<td><input name="" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictModerateGroups,groupname)>checked</cfif>></td>
							<td nowrap class="var-width">#groupname#</td>
						</tr>
					</cfloop>
					<cfelse>
						<tr> 
							<td class="noResults" colspan="5">#application.rbFactory.getKeyValue(session.rb,'permissions.nogroups')#</td>
						</tr>
					</cfif>
					</table>

					<label class="control-label">#rc.mmRBF.key('membergroups')#</label>
					<table class="table table-striped table-condensed table-bordered mura-table-grid">
					<tr> 
						<th>#application.rbFactory.getKeyValue(session.rb,'permissions.inherit')#</th>
						<th>#rc.mmRBF.key('AllowRead')#</th>
						<th>#rc.mmRBF.key('AllowContribute')#</th>
						<th>#rc.mmRBF.key('AllowModerate')#</th>
						<th>#rc.mmRBF.key('Groups')#</th>
					</tr>

					<cfif rc.qGroupsPublic.recordcount>
					<cfloop query="rc.qGroupsPublic">
						<tr> 
							<td><input name="#groupname#" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictReadGroups,groupname)>checked</cfif>></td>
							<td><input name="#groupname#" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictReadGroups,groupname)>checked</cfif>></td>
							<td><input name="#groupname#" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictContributeGroups,groupname)>checked</cfif>></td>
							<td><input name="#groupname#" type="radio" class="checkbox" value="none" <cfif listfind(form.configurationbean_RestrictModerateGroups,groupname)>checked</cfif>></td>
							<td nowrap class="var-width">#groupname#</td>
						</tr>
					</cfloop>
					<cfelse>
						<tr> 
							<td class="noResults" colspan="5">#application.rbFactory.getKeyValue(session.rb,'permissions.nogroups')#</td>
						</tr>
					</cfif>
					</table>

				</div><!--- /fieldset ---> 
		
				<div class="load-inline tab-preloader"></div>

				<div class="form-actions">
				
					<a href="#buildURL('admin:configurations.default')#" class="btn"><i class="icon-remove"></i> Cancel</a>
					<button type="submit" class="btn" ><i class="icon-check"></i> save</button>
					 
				</div><!--- /form-actions --->

			</div><!--- /tabPermissions --->

			<div id="tabOptions" class="tab-pane">

				<span id="extendset-container-tabbasictop" class="extendset-container"></span>

					<div class="fieldset">

						<!--- active --->
						<ui:Checkbox key="active" 					name="configurationbean_isactive" />

						<!--- closed --->
						<ui:Checkbox key="doClosed" 				name="configurationbean_doClosed" />

						<!--- avatars allowed? --->
						<ui:Checkbox key="AllowAvatars" 			name="configurationbean_doavatars" />

						<!--- avatars allowed? --->
						<ui:Checkbox key="AllowAttachments" 		name="configurationbean_doattachments" />

						<!--- allowed extentions --->
						<ui:TextInput 	key="allowedextensionslist"	name="configurationbean_allowattachmentextensions"
										helptext="#rc.mmRBF.key('masterallowedextensions')#: #rc.settingsBean.getAllowedExtensions()#" />

						<!--- filesize limits --->
						<ui:TextInput 	key="filesizeLimit"			name="configurationbean_filesizeLimit"
										required="true"				validate="number"
										classlist="span2" />


						<!--- <legend>#rc.mmRBF.key('imageattachments')#</legend> --->
						<!--- inline images allowed? --->
						<ui:Checkbox key="InlineImageAttachments" 	name="configurationbean_doInlineImageAttachments" />


						<!--- width max limit --->
						<ui:TextInput 	key="ImageWidthLimit"		name="configurationbean_ImageWidthLimit"
										required="true"				validate="number"
										classlist="span2" />

						<!--- height max limit --->
						<ui:TextInput 	key="ImageHeightLimit"		name="configurationbean_ImageHeightLimit"
										required="true"				validate="number"
										classlist="span2" />

				</div><!--- /fieldset ---> 

				<div class="load-inline tab-preloader"></div>
		
				<div class="form-actions">
				
					<a href="#buildURL('admin:configurations.default')#" class="btn"><i class="icon-remove"></i> Cancel</a>
					<button type="submit" class="btn" ><i class="icon-check"></i> save</button>
					 
				</div><!--- /form-actions --->

			</div><!--- /tabOptions --->

		</div><!--- /content-tab --->
	</div><!--- /tabbable --->

</form>

<cfdump var="#form#" />
<cfdump var="#rc.qGroupsPublic#" />
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
<form id="meld-edit-form" class="meld-form" method="post" action="index.cfm">
<input type="hidden" name="action" value="configurations.edit">
<input type="hidden" name="configurationID" value="#rc.configurationBean.getconfigurationID()#">
<div id="msTabs">
	<ul>
		<li><a id="msTabs-General-Tab" href="##msTabs-General">#rc.mmRBF.key('general')#</a></li>
		<li><a id="msTabs-Permissions-Tab" href="##msTabs-Permissions">#rc.mmRBF.key('permissions')#</a></li>
		<li><a id="msTabs-Options-Tab" href="##msTabs-Options">#rc.mmRBF.key('options')#</a></li>
	</ul>
	<div id="msTabs-panels">
		#view("configurations/includes/configurations_edit_general")#
		#view("configurations/includes/configurations_edit_permissions")#
		#view("configurations/includes/configurations_edit_options")#
	</div>
	<div>
		<ul class="form-buttons">
			<li><input name="btaction" type="submit" class="submit ui-state-default" value="cancel"></li>
			<cfif rc.configurationBean.beanExists()>
				<li><input name="btaction" type="submit" class="submit ui-state-default" value="update"></li>
				<li class="right">
					<input type="hidden" id="btdeleteconfirm" name="btdeleteconfirm" value="" />
					<!--- cannot delete the master --->
					<cfif not rc.configurationBean.getIsMaster()>
						<input data-delete="#rc.mmRBF.key('delete')#" data-cancel="#rc.mmRBF.key('cancel')#" data-title="#rc.mmRBF.key('delete')#" data-message="#rc.mmRBF.key('deleteconfiguration-msg')#" id="btdelete" name="btaction" type="submit" class="submit ui-state-highlight" value="delete">
					</cfif>
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
