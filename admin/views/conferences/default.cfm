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
		<table class="table table-striped table-condensed table-bordered mura-table-grid">

		<thead>
		<tr> 
			<th class="var-width"><a href="">#rc.mmRBF.key('name')#</a></th>
			<th><a href="">#rc.mmRBF.key('forumcount')#</a></th>
			<th><a href="">#rc.mmRBF.key('threadcount')#</a></th>
			<th>#rc.mmRBF.key('status')#</th>
			<th class="actions"></th>
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
					<td class="var-width">#c.getName()#</td>
					<td>#c.getForumCount()#</td>
					<td>#c.getThreadCount()#</td>
					<td>#c.getIsActive()#</td>
					<td></td>
				</tr>
			</cfloop>
		</cfif>	
		</tbody>

		</table>
    </div>
</div>

<!--- <cfdump var="#rc.getConferences#" /> --->

<!--- 

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
