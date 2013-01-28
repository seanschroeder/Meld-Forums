<cfimport prefix="ui" taglib="../../ui" />
<cfoutput>

<!--- update --->
<cfif rc.conferenceBean.getBeanExists()>
	<form action="#buildURL('admin:conferences.edit?btaction=update')#" method="post">	
<cfelse><!--- save --->
	<form action="#buildURL('admin:conferences.edit?btaction=save')#" method="post">	
</cfif>
	
	<input type="hidden" name="conferenceID" value="#rc.conferenceBean.getConferenceID()#">
			
	<span id="msg"></span>
		
	<div class="tabbable tabs-left">

		<ul class="nav nav-tabs tabs initActiveTab">
			<li><a href="##tabBasic" data-toggle="tab"><span>#rc.mmRBF.key('general')#</span></a></li>
			<li><a href="##tabOptions" data-toggle="tab"><span>#rc.mmRBF.key('options')#</span></a></li>
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
					<ui:TextArea key="description" 	name="conferencebean_description" />


				</div><!--- /fieldset ---> 
		
				<div class="load-inline tab-preloader"></div>
		
				<div class="form-actions">
				
					<a href="#buildURL('admin:conferences.default')#" class="btn"><i class="icon-remove"></i> Cancel</a>
					<button type="submit" class="btn" ><i class="icon-check"></i> save</button>
					 
				</div><!--- /form-actions --->

			</div><!--- /tabbasic --->

			
			<div id="tabOptions" class="tab-pane">
	
				<span id="extendset-container-tabbasictop" class="extendset-container"></span>

				<div class="fieldset">

					<!--- active --->
					<ui:Checkbox key="isactive" 		name="conferencebean_isactive" />

					<!--- permissions --->
					<div class="control-group">

						<div class="span2">

							<label class="control-label">
								<a href="##" rel="tooltip" title="#request.context.mmRBF.key('configuration','tip')#">#request.context.mmRBF.key('configuration')# <i class="icon-question-sign"></i></a>
							</label>
													
							<div class="controls">
								<!--- inherit --->
								<label for="conferencebean_configurationid" class="radio"><input name="conferencebean_configurationid" id="conferencebean_configurationid" type="radio" value="" class="radio radio-tab" 
									<cfif !len(trim(form.conferencebean_configurationid))>checked</cfif>
									> #rc.mmRBF.key('inherit')#</label>
								<!--- other choices --->
								<cfloop from="1" to="#arrayLen(rc.aConfiguration)#" index="local.iiX">
									<label for="conferencebean_configurationid#rc.aConfiguration[local.iiX].getConfigurationID()#" class="radio"><input name="conferencebean_configurationid" id="conferencebean_configurationid#rc.aConfiguration[local.iiX].getConfigurationID()#" type="radio" value="#rc.aConfiguration[local.iiX].getConfigurationID()#" class="radio radio-tab" 
									<cfif listFindNoCase(form.conferencebean_configurationid, rc.aConfiguration[local.iiX].getConfigurationID())>checked</cfif>
									> #rc.aConfiguration[local.iiX].getName()#</label>
								</cfloop>
							</div>
							
						</div><!--- /span2 --->
						
						<div class="span1">&nbsp;</div>

						<!--- permission display --->
						<div class="span9 radio-tab-content">

							<div class="conferencebean_configurationid">
								<h2>#rc.mmRBF.key('selectedconfiguration')#: #rc.mmRBF.key('inherit')#</h2>
							</div>

							<cfloop from="1" to="#arrayLen(rc.aConfiguration)#" index="local.iiX">
								<cfset config = rc.aConfiguration[local.iiX] />
								<div class="conferencebean_configurationid#config.getConfigurationID()#">
									<h2>#rc.mmRBF.key('selectedconfiguration')#: #config.getName()#</h2>


									<table class="table table-striped table-condensed table-bordered mura-table-grid">

										
										<tbody>
										
										<cfif rc.qGroupsPrivate.recordcount>

											<tr> 
												<th class="var-width">#rc.mmRBF.key('globalconfiguration')#</th>
												<th>#rc.mmRBF.key('AllowRead')#</th>
												<th>#rc.mmRBF.key('AllowContribute')#</th>
												<th>#rc.mmRBF.key('AllowModerate')#</th>
											</tr>
											<cfloop query="rc.qGroupsPrivate">
												<tr>
													<td class="var-width">#rc.qGroupsPrivate.groupname#</td>
													<td><i class="icon-ok"></i></td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
											</cfloop>
										

										</cfif>


										<cfif rc.qGroupsPublic.recordcount>
						
							<!--- 
							<cfloop query="rc.qGroupsPublic">
														<option value="#groupname#" <cfif listfind(form.configurationbean_RestrictModerateGroups,groupname)>selected</cfif>>#groupname#</option>
														</cfloop> --->
							
											<tr> 
												<th class="var-width">#rc.mmRBF.key('membergroups')#</th>
												<th>#rc.mmRBF.key('AllowRead')#</th>
												<th>#rc.mmRBF.key('AllowContribute')#</th>
												<th>#rc.mmRBF.key('AllowModerate')#</th>
											</tr>
											<cfloop query="rc.qGroupsPublic">
												<tr>
													<td class="var-width">#rc.qGroupsPublic.groupname#</td>
													<td><i class="icon-ok"></i></td>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
											</cfloop>
										</cfif>

										<tr>
											<td class="var-width" colspan="4">#rc.mmRBF.key('admingroups')#</td>
										</tr>

										</tbody>

									</table>
								</div>
							</cfloop>

						</div><!--- /span3 --->

					</div><!--- /permissions row --->					
	
				</div><!--- /fieldset ---> 
		
				<div class="load-inline tab-preloader"></div>
		
				<div class="form-actions">
					<a href="#buildURL('admin:conferences.default')#" class="btn"><i class="icon-remove"></i> Cancel</a>
					<button type="submit" class="btn" ><i class="icon-check"></i> save</button>
				</div><!--- /form-actions --->

			</div><!--- /tabbasic --->


		</div><!--- /content-tab --->
	</div><!--- /tabbable --->

</form>
<cfdump var="#rc.aConfiguration#" />
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