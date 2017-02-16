<cfcomponent name="textarea">
	<cfset this.metadata.attributetype="mixed">
	<cfset this.metadata.attributes={
		// Standard CFML attributes that match Adobe CF
		name:			{required:true,type:"string"},
		id:      	{required:false,type:"string",default:""},
		height:  			{required:false,type:"string",default:"",hint:""},	
		value: 			{required:false,type:"string",default:"",hint:""},	
		width: 			{required:false,type:"string",default:"",hint:""},	
		style: 			{required:false,type:"string",default:"",hint:""},	
		maxlength: 		{required:false,type:"string",default:"",hint:""},	
		rows: 		{required:false,type:"string",default:"",hint:""},	
		class: 		{required:false,type:"string",default:"",hint:""},	
		required: 			{required:false,type:"string",default:"",hint:""},	
		wrap: 			{required:false,type:"string",default:"",hint:""},	
		cols: 			{required:false,type:"string",default:"",hint:""},	
		placeholder: 			{required:false,type:"string",default:"",hint:""}
	}/>
	<cffunction name="init" output="no" returntype="void" hint="invoked after tag is constructed">
		<cfargument name="hasEndTag" type="boolean" required="yes" />
		<cfargument name="parent" type="component" required="no" hint="the parent cfc custom tag, if there is one" />
		<cfset variables.hasEndTag = arguments.hasEndTag />
	</cffunction>
	<cffunction name="onStartTag" output="yes" returntype="boolean">

		<cfargument name="attributes" type="struct">
		<cfargument name="caller" type="struct">

		<cfif structKeyExists(attributes,"argumentCollection")>
			<cfset arguments.attributes = attributes.argumentCollection />
		</cfif>

		<!--- this sets the defaults for undefined attributes.  Not sure why this is needed. --->
		<cfset variables.attributes=setAttributes(arguments.attributes) />

		<cfif not variables.hasEndTag>
			<cfset onEndTag(variables.attributes,caller,"") />
		</cfif>

		<cfreturn variables.hasEndTag>
	</cffunction>
	<cffunction name="onEndTag" output="yes" returntype="boolean">

		<cfargument name="attributes" type="struct">
		<cfargument name="caller" type="struct">
		<cfargument name="generatedContent" type="string">


		<textarea name="#attributes.name#"
			<cfif attributes.id GT "">id="#attributes.id#"
			<cfelse>id="#attributes.name#"
			</cfif>
			<cfloop list="#structKeyList(attributes)#" index="att"><cfif NOT ListFindNoCase("name,id,value,required",att)><cfif attributes[att] GT "">#att#="#attributes[att]#" </cfif></cfif></cfloop>
			<cfif attributes.required IS "yes">
				 required 
			</cfif>
		><cfif attributes.value GT "">#attributes.value#<cfelse>#arguments.generatedContent#</cfif></textarea>
		<cfreturn false/>
	</cffunction>

	<cffunction name="setAttributes" output="false" access="public" returntype="struct">
		<cfargument name="attributes" required="true" type="struct" />
		<cfloop collection="#this.metadata.attributes#" index="a">
			<cfif NOT structKeyExists(arguments.attributes,a)>
				<cfif structKeyExists(this.metadata.attributes[a],'default')>
					<cfset arguments.attributes[a] = this.metadata.attributes[a]['default'] />
				</cfif>	
			</cfif> 
		</cfloop>
		<cfreturn arguments.attributes />
    </cffunction>
</cfcomponent>
