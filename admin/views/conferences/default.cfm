<!--- 
<cfsilent>
	<!--- rc --->
	<!--- headers --->
	<cfinclude template="headers/jquery-datatable-conference.cfm">
</cfsilent> --->
<cfimport prefix="ui" taglib="../../ui" />
<cfoutput>


<div class="row">
	<div class="span12">

		<a href="#buildURL('admin:conferences.edit')#" title="#rc.mmRBF.key('addnewconference','tip')#" class="btn pull-right"><i class="icon-plus-sign"></i> #rc.mmRBF.key('addnewconference')#</a>

		<div class="input-append">
			<input id="search-input" name="search" type="text" placeholder="Search for Conference">
		</div>
		
	</div>
</div>

<br/>

<!--- <cfdump var="#rc.getConferences#" /> --->

<!--- begin content --->
<div class="row">
	<div class="span12">
		<table id="conferenceTable" class="table table-striped table-condensed table-bordered mura-table-grid clickable">

		<thead>
		<tr> 
			<th class="var-width"><a href="">#rc.mmRBF.key('name')#</a></th>
			<th><a href="">#rc.mmRBF.key('forumcount')#</a></th>
			<th><a href="">#rc.mmRBF.key('threadcount')#</a></th>
			<th>#rc.mmRBF.key('status')#</th>
			<th>#rc.mmRBF.key('configuration')#</th>
			<th class="actions">&nbsp;</th>
		</tr>
		</thead>

		<tbody>
		<cfif !arrayLen(rc.getConferences)>
			<tr>
				<td colspan="6" class="noResults">#rc.mmRBF.key('emptyconferences')#</td>
			</tr>
		<cfelse>
			<cfloop array="#rc.getConferences#" index="c">
				<!--- TODO: consider an itterator here --->
				<tr>
					<td class="var-width" href="#buildURL('admin:conferences.edit?conferenceid=#c.getConferenceID()#')#">#c.getName()#</td>
					<td>#c.getForumCount()#</td>
					<td>#c.getThreadCount()#</td>
					<td><cfif c.getIsActive() >#rc.mmRBF.key('active1')#<cfelse>#rc.mmRBF.key('active1')#</cfif></td>
					<td><cfif len(trim(c.getConfigurationID()))>#rc.configurationService.getConfiguration(c.getConfigurationID()).getName()#<cfelse>#rc.mmRBF.key('inherit')#</cfif></td><!--- TODO: this is poor form, move helper for this to the conference bean? --->
					<td>
						<a href="#buildURL('admin:conferences.edit?conferenceid=#c.getConferenceID()#')#"><i class="icon-pencil"></i></a>
						<!--- <a href="#buildURL('admin:conferences.permissions?conferenceid=#c.getConferenceID()#')#"><i class="icon-group"></i></a> --->
						<a href="#buildURL('admin:conferences.delete?conferenceid=#c.getConferenceID()#')#"><i class="icon-remove-sign"></i></a>
					</td>
				</tr>
			</cfloop>
		</cfif>	
		</tbody>

		</table>

    </div>
</div>

<!--- page specific JS --->
<ui:javascript>
$(function(){

	$('##search-input').focus();

	var oTable = $('##conferenceTable').dataTable({
		'sDom':'t', <!--- only show the table, not other controls --->
		'bLengthChange': false, <!---user cannot change length--->
		'iDisplayLength': #arrayLen(rc.getConferences)# <!--- include all items --->
	});

	$('##search-input').keyup( function (e) {
		oTable.fnFilter( $(this).val() );
	});

});
</ui:javascript>



<!--- <cfdump var="#rc.getConferences#" /> --->

<!--- original meld AOP code to generate table
<ul class='table-buttons three'>
			<li><span title='#mmResourceBundle.key('conferenceedit')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-pencil' href='?action=conferences.edit&amp;ConferenceID=#cConference.ConferenceID#'></a></span></li>
			<li><span title='#mmResourceBundle.key('forumadd')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-plusthick' href='?action=forums.edit&amp;ConferenceID=#cConference.ConferenceID#'></a></span></li>
			<li><span title='#mmResourceBundle.key('forumslist')#' class='sb-button ui-state-default'><a class='ui-icon ui-icon-folder-open' href='?action=forums&amp;ConferenceID=#cConference.ConferenceID#'></a></span></li>
			</ul>
			" ) />
			<cfset ArrayAppend(aConference,"<a title='#mmResourceBundle.key('conferenceview')#' href='?action=forums&amp;ConferenceID=#cConference.ConferenceID#'>#cConference.name#</a>" ) /> --->


<!--- original code for this page
<div class="section clearfix">
	<table class="ms-datatable display hideTable" id="ms-datatable"
		data-url="#$.globalConfig().getContext()#/plugins/#rc.pluginConfig.getDirectory()#/com/meldsolutions/meldforums/remote/MeldForumsRemoteAOP.cfc?siteID=#rc.siteID#&method=getConferenceList&data&returnFormat=json">
		<thead class="headers">
		<tr>
			<th class="nosort nopad ui-state-active" data-class="nopad">&nbsp;</th>
			<th class="varWidth ui-state-active">#rc.mmRBF.key('name')#</th>
			<th class="minWidth ui-state-active" data-class="center">#rc.mmRBF.key('forumcount')#</th>
			<th class="minWidth ui-state-active" data-class="center">#rc.mmRBF.key('threadcount')#</th>
			<th class="nosort minWidth ui-state-active" data-class="center">#rc.mmRBF.key('status')#</th>
		</tr>
		</thead>
		<thead class="search" id="ms-datatable_search">
		<tr>
			<th>
			<ul class='table-buttons two'>
				<li><span title="#rc.mmRBF.key('clearfilter')#" id="clearFilter" class="sb-button ui-state-active"><span class="ui-icon ui-icon-arrowreturnthick-1-w"></span></span></li>
				<li><span title="#rc.mmRBF.key('setfilter')#" id="setFilter" class="sb-button ui-state-active"><span class="ui-icon ui-icon-check"></span></span></li>
			</ul>
			</th>
			<th><input class="searchable text full" type="text" id="flt_name" data-column="name"></th>
			<th></th>
			<th></th>
			<th>
			<select class="select" name="isactive" id="flt_isactive" data-column="isactive">
				<option value="1">#rc.mmRBF.key('active1')#</option>
				<option value="0">#rc.mmRBF.key('active0')#</option>
			</select>
			</th>
		</tr>
		</thead>
		<tbody>
	</table>
</div> --->


<!--- end content --->
</cfoutput> 