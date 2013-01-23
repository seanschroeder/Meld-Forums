<cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="meld-body">
	<!-- CONTENT HERE -->
	<cfif not rc.hasConferences>
		<div class="error">
		#rc.mmRBF.key('createconferencesfirst','error')#
		</div>
	<cfelse>
		#view("forums/includes/default_list")#
	</cfif>
</div>	
<!--- end content --->
</cfoutput> 