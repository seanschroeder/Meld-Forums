<cfimport prefix="ui" taglib="../../ui" />
<cfoutput>

<!--------------------------------------------------------------------------------------------
	PAGE BUTTONS / CONTROLS 
--------------------------------------------------------------------------------------------->
<div class="row">
	<div class="span12">

		<a href="#buildURL('admin:configuration.edit')#" title="#rc.mmRBF.key('addnewconfiguration','tip')#" class="btn pull-right"><i class="icon-plus-sign"></i> #rc.mmRBF.key('addnewconfiguration')#</a>

		<div class="input-append">
			<input id="search-input" name="search" type="text" placeholder="#rc.mmRBF.key('searchforconfiguration')#">
		</div>
		
	</div>
</div>

<br/>


<!--- <cfdump var="#rc.getMasterConfiguration#" /> --->
<!--- 
<cfdump var="#rc.getConfigurations#" />
<cfabort> --->



<!--------------------------------------------------------------------------------------------
	MAIN CONTENT: TABLE
--------------------------------------------------------------------------------------------->
<div class="row">
	<div class="span12">
		<table id="configTable" class="table table-striped table-condensed table-bordered mura-table-grid clickable">

		<thead>
		<tr> 
			<th class="var-width"><a href="">#rc.mmRBF.key('name')#</a></th>
			<th>#rc.mmRBF.key('master')#</th>
			<!--- 
			<th class="var-width"><a href="">#rc.mmRBF.key('conference')#</a></th>
						<th><a href="">#rc.mmRBF.key('threadcount')#</a></th>
						<th><a href="">#rc.mmRBF.key('postcount')#</a></th>
						<th><a href="">#rc.mmRBF.key('viewcount')#</a></th>
						<th>#rc.mmRBF.key('status')#</th>
						<th>#rc.mmRBF.key('configuration')#</th> --->
			
			<th class="actions">&nbsp;</th>
		</tr>
		</thead>

		<tbody>
		<cfif !arrayLen(rc.getConfigurations)>
			<tr>
				<td colspan="8" class="noResults">#rc.mmRBF.key('emptyconferences')#</td>
			</tr>
		<cfelse>
			<cfloop array="#rc.getConfigurations#" index="c">
				<!--- TODO: consider an iterator here --->
				<tr>
					<td class="var-width" href="#buildURL('admin:configurations.edit?configurationid=#c.getConfigurationID()#')#">#c.getName()#</td>
					<td><cfif c.getIsMaster() ><i class="icon-ok"></i></cfif></td>
					<!--- 
					<td>#rc.conferenceService.getConference(f.getConferenceID()).getName()#</td>
					
										<td>#f.getThreadCount()#</td>
										<td>#f.getPostCount()#</td>
										<td>#f.getViewCount()#</td>
					
										<td><cfif f.getIsActive() >#rc.mmRBF.key('active1')#<cfelse>#rc.mmRBF.key('active1')#</cfif></td>
										<td><cfif len(trim(f.getConfigurationID()))>#rc.configurationService.getConfiguration(f.getConfigurationID()).getName()#<cfelse>#rc.mmRBF.key('inherit')#</cfif></td><!--- TODO: this is poor form, move helper for this to the conference bean? ---> --->
					
					<td>
						<a href="#buildURL('admin:configurations.edit?configurationid=#c.getConfigurationID()#')#"><i class="icon-pencil"></i></a>
						<a href="#buildURL('admin:configurations.delete?configurationid=#c.getConfigurationID()#')#"><i class="icon-remove-sign"></i></a>
					</td>
				</tr>
			</cfloop>
		</cfif>	
		</tbody>

		</table>

    </div>
</div>

<!--------------------------------------------------------------------------------------------
	PAGE SPECIFIC JAVASCRIPT
--------------------------------------------------------------------------------------------->
<ui:javascript>
$(function(){

	$('##search-input').focus();

	var oTable = $('##configTable').dataTable({
		'sDom':'t', <!--- only show the table, not other controls --->
		'bLengthChange': false, <!---user cannot change length--->
		'iDisplayLength': #arrayLen(rc.getConfigurations)# <!--- include all items --->
	});

	$('##search-input').keyup( function (e) {
		oTable.fnFilter( $(this).val() );
	});

});
</ui:javascript>
</cfoutput>


<!--- 
<cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
	#view("configurations/includes/default_list")#
</div>	
<!--- end content --->
</cfoutput>  --->
