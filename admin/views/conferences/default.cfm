<cfsilent>
	
	<!--- rc --->
	<!--- headers --->
	<cfinclude template="headers/jquery-datatable-conference.cfm">
</cfsilent><cfoutput>


<div class="row">
	<div class="span12">
		<a href="#buildURL('admin:conferences.edit')#" title="#rc.mmRBF.key('addnewconference','tip')#" class="btn pull-right"><i class="icon-plus-sign"></i> #rc.mmRBF.key('addnewconference')#</a>
	</div>
</div>

<br/>

<!--- begin content --->
<div class="row">
	<div class="span12">
		<table class="table table-striped table-condensed table-bordered mura-table-grid clickable">

		<thead>
		<tr> 
			<th class="var-width"><a href="">#rc.mmRBF.key('name')#</a></th>
			<th><a href="">#rc.mmRBF.key('forumcount')#</a></th>
			<th><a href="">#rc.mmRBF.key('threadcount')#</a></th>
			<th>#rc.mmRBF.key('status')#</th>
			<th class="actions">&nbsp;</th>
		</tr>
		</thead>

		<tbody>
		<cfif !arrayLen(rc.getConferences)>
			<tr>
				<td colspan="5" class="noResults">#rc.mmRBF.key('emptyconferences')#</td>
			</tr>
		<cfelse>
			<cfloop array="#rc.getConferences#" index="c">
				<!--- TODO: consider an itterator here --->
				<tr>
					<td class="var-width" href="#buildURL('admin:forums.list?conferenceid=#c.getConferenceID()#')#">#c.getName()#</td>
					<td>#c.getForumCount()#</td>
					<td>#c.getThreadCount()#</td>
					<td><cfif c.getIsActive() >#rc.mmRBF.key('active1')#<cfelse>#rc.mmRBF.key('active1')#</cfif></td>
					<td>
						<a href="#buildURL('admin:conferences.edit?conferenceid=#c.getConferenceID()#')#"><i class="icon-pencil"></i></a>
						<a href="#buildURL('admin:conferences.permissions?conferenceid=#c.getConferenceID()#')#"><i class="icon-group"></i></a>
						<a href="#buildURL('admin:conferences.delete?conferenceid=#c.getConferenceID()#')#"><i class="icon-remove-sign"></i></a>

<!--- mura's edit actions icon set
<ul class="#lcase(rc.rstop.type)#">
				<cfif verdict neq 'none'>
				<li class="edit">
					<a title="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.edit')#" class="draftprompt" data-siteid="#rc.siteid#" data-contentid="#rc.rstop.contentid#" data-contenthistid="#rc.rstop.contenthistid#"title="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.edit')#" href="index.cfm?muraAction=cArch.edit&contenthistid=#rc.rstop.ContentHistID#&contentid=#rc.rstop.ContentID#&type=#rc.rstop.type#&parentid=#rc.rstop.parentID#&topid=#URLEncodedFormat(rc.topid)#&siteid=#URLEncodedFormat(rc.siteid)#&moduleid=#rc.moduleid#"><i class="icon-pencil"></i></a></li>
					<li class="version-history"><a title="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.versionhistory')#" href="index.cfm?muraAction=cArch.hist&contentid=#rc.rstop.ContentID#&type=#rc.rstop.type#&parentid=#rc.rstop.parentID#&topid=#URLEncodedFormat(rc.topid)#&siteid=#URLEncodedFormat(rc.siteid)#&moduleid=#rc.moduleid#"><i class="icon-book"></i></a></li>
					<cfif rc.moduleid eq '00000000000000000000000000000000004'>
						<li class="manage-data"><a title="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.managedata')#" href="index.cfm?muraAction=cArch.datamanager&contentid=#rc.rstop.ContentID#&siteid=#URLEncodedFormat(rc.siteid)#&moduleid=#rc.moduleid#&contenthistid=#rc.rstop.ContentHistID#&topid=#URLEncodedFormat(rc.topid)#&parentid=#URLEncodedFormat(rc.parentid)#&type=Form"><i class="icon-wrench"></i></a></li>
					</cfif>
					<cfif listFind(session.mura.memberships,'Admin;#application.settingsManager.getSite(rc.siteid).getPrivateUserPoolID()#;0') or listFind(session.mura.memberships,'S2')>
						<li class="permissions"><a title="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.permissions')#" href="index.cfm?muraAction=cPerm.main&contentid=#rc.rstop.ContentID#&type=#rc.rstop.type#&parentid=#rc.rstop.parentID#&topid=#URLEncodedFormat(rc.topid)#&siteid=#URLEncodedFormat(rc.siteid)#&moduleid=#rc.moduleid#&startrow=#rc.startrow#"><i class="icon-group"></i></a></li>
					</cfif>
				<cfelse>
					<li class="edit disabled"><a><i class="icon-pencil"></i></a></li>
					<li class="version-history disabled"><i class="icon-book"></i></li>
					<cfif rc.moduleid eq '00000000000000000000000000000000004'>
						<li class="manage-dataOff disabled"><i class="icon-wrench"></i></li>
					</cfif>
					<li class="permissions disabled"><a><i class="icon-group"></i></a></li>
				</cfif>
				<cfif ((rc.locking neq 'all') or (rc.parentid eq '#rc.topid#' and rc.locking eq 'none')) and (verdict eq 'editor') and not rc.rsTop.isLocked eq 1>
					<li class="delete"><a title="#application.rbFactory.getKeyValue(session.rb,'sitemanager.content.delete')#" href="index.cfm?muraAction=cArch.update&contentid=#rc.rstop.ContentID#&type=#rc.rstop.type#&action=deleteall&topid=#URLEncodedFormat(rc.topid)#&siteid=#URLEncodedFormat(rc.siteid)#&moduleid=#rc.moduleid#&parentid=#URLEncodedFormat(rc.parentid)#" onClick="return confirmDialog('#jsStringFormat(application.rbFactory.getKeyValue(session.rb,'sitemanager.content.deletecontentconfirm'))#',this.href)"><i class="icon-remove-sign"></i></a></li>
				<cfelseif rc.locking neq 'all'>
					<li class="delete disabled"><i class="icon-remove-sign"></i></li>
				</cfif>
			</ul> --->
					</td>
				</tr>
			</cfloop>
		</cfif>	
		</tbody>

		</table>

    </div>
</div>


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
