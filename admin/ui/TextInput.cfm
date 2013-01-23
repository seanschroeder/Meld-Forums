<!--- default params --->
<cfparam name="attributes.key" 	default="" /><!--- key for resource bundles --->
<cfparam name="attributes.name" default="" />

<cfif thisTag.executionMode eq 'start'>

<cfoutput>
	<div class="control-group">
		<label class="control-label" for="#attributes.name#">
			<cfif request.context.mmRBF.keyExists(attributes.key,'tip')>
				<a href="##" rel="tooltip" title="#request.context.mmRBF.key(attributes.key,'tip')#">#request.context.mmRBF.key(attributes.key)# <i class="icon-question-sign"></i></a>
			<cfelse>
				#request.context.mmRBF.key(attributes.key)#
			</cfif>
		</label>
		<div class="controls">
			<input type="text" id="#attributes.name#" name="#attributes.name#" value="#form[attributes.name]#"  maxlength="255" class="span12" data-required="true" data-validate="string" 
			<cfif request.context.mmRBF.keyExists('#attributes.key#','validation')>data-message="#request.context.mmRBF.key(attributes.key,'validation')#"</cfif>
			/>
		</div>
	</div>
</cfoutput>

</cfif>