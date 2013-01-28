<!---
This file is part of the Meld Forums application.

Meld Forums is licensed under the GPL 2.0 license
Copyright (C) 2010 2011 Meld Solutions Inc. http://www.meldsolutions.com/

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation, version 2 of that license..

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

--->
<cfimport prefix="ui" taglib="../ui" />

<!------------------------------------------------------------------------------------
	things that belong in the HTML head
-------------------------------------------------------------------------------------->
<cfsilent>
<cfsavecontent variable="local.str">
<cfoutput><link rel="stylesheet" href="#rc.$.globalConfig().getContext()#/plugins/#rc.pluginConfig.getDirectory()#/admin/assets/css/admin.css" type="text/css" media="all" /></cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>

<!------------------------------------------------------------------------------------
	Plugin wrapper stuff
-------------------------------------------------------------------------------------->
<cfsavecontent variable="variables.pageContent">
<cfoutput>
<div class="plugincontent">

	<div class="row">
		<div class="span12">
			<a href="http://www.meldsolutions.com" class="pull-right" target="_new"><img class="media-object" src="#rc.$.globalConfig().getContext()#/plugins/#rc.pluginConfig.getDirectory()#/admin/assets/css/images/meld-logo.png"></a>

			<cfparam name="rc.pagetitle" default="#rc.mmRBF.key('productname')#" />
			<h1>#rc.pagetitle#</h1>
		</div>
	</div>

	<!--- 
	<div class="row">
			<div class="span12">
				<ul class="breadcrumb">#rc.breadCrumbString#</ul><!--- breadcrumbs --->
			</div>
		</div> --->
	

	<div class="row">
		<div class="span12 tabbable">
			<ul class="nav nav-tabs">
				<li <cfif findNoCase('main',rc.action)>class="active"</cfif>><a href="#buildURL('admin:main.default')#">#rc.mmRBF.key('dashboard')#</a></li>
				<li <cfif findNoCase('admin:conferences',rc.action)>class="active"</cfif>><a href="#buildURL('admin:conferences')#">#rc.mmRBF.key('conferences')#</a></li>
				<li <cfif findNoCase('admin:forums',rc.action)>class="active"</cfif>><a href="#buildURL('admin:forums')#">#rc.mmRBF.key('forums')#</a></li>
				<!--- <li <cfif findNoCase('admin:users',rc.action)>class="active"</cfif>><a href="#buildURL('admin:users')#">#rc.mmRBF.key('users')#</a></li> --->
				<li <cfif findNoCase('admin:configurations',rc.action)>class="active"</cfif>><a href="#buildURL('admin:configurations')#">#rc.mmRBF.key('configurations')#</a></li>
				<li class="dropdown pull-right<cfif findNoCase('admin:about',rc.action)> active</cfif>">
			   	 	<a class="dropdown-toggle"
			    	   	data-toggle="dropdown"
			        	href="##">#rc.mmRBF.key('About')#<b class="caret"></b></a>
				    <ul class="dropdown-menu">
				      	<li><a href="#buildURL('admin:about.default')#">#rc.mmRBF.key('About')#</a></li>
						<li><a href="#buildURL('admin:about.documentation')#">#rc.mmRBF.key('Documentation')#</a></li>
						<li><a href="#buildURL('admin:about.support')#">#rc.mmRBF.key('Support')#</a></li>
						<li><a href="#buildURL('admin:about.license')#">#rc.mmRBF.key('license')#</a></li>
				    </ul>
				</li>
				<li class="pull-right<cfif findNoCase('admin:settings',rc.action)> active</cfif>"><a href="#buildURL('admin:settings')#">#rc.mmRBF.key('settings')#</a></li>
			</ul>
		</div>
	</div>

	<cfif structKeyExists(rc,"error")>
		<div id="meld-error" class="section clearfix">
			<cfif rc.errorBean.hasErrors("notice")>
				<div class="notice">
					#rc.errorBean.hasErrors.displayErrorsHTML("notice")#
				</div>
			</cfif>
			<cfif rc.errorBean.hasErrors("custom")>
				<div class="error">
					#rc.errorBean.displayErrorsHTML("custom")#
				</div>
			</cfif>
			<cfif rc.errorBean.hasErrors("other")>
				<div class="error">
					#rc.errorBean.displayErrorsHTML("other")#
				</div>
			</cfif>
		</div>
	</cfif>

</div>

#body#

<!--- this really should be at the bottom of the page as a whole, but this is not currently supported by Mura --->
<ui:javascript files="#rc.$.globalConfig().getContext()#/plugins/#rc.pluginConfig.getDirectory()#/admin/assets/js/admin.js" />
<ui:javascript files="#rc.$.globalConfig().getContext()#/plugins/#rc.pluginConfig.getDirectory()#/admin/assets/js/jquery.datatables.min.js" />
<ui:javascript mode="output" /><!--- spit out the javascript --->

</cfoutput>
</cfsavecontent>


<!------------------------------------------------------------------------------------
	Mura wrapper stuff
-------------------------------------------------------------------------------------->
<cfoutput>#replace(application.pluginManager.renderAdminTemplate(body=variables.pageContent,pageTitle=rc.pluginConfig.getName(),jsLib="jquery"),"cPlugins","msPlugins")#</cfoutput>
