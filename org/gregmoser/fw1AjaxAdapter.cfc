<cfcomponent>
	<cffunction name="fw1AjaxPost" access="remote">
		<cfset var result = "" />
		<cfset var fw1 = createObject("component","Application") />
		
		<cfset structAppend(form, arguments) />
		<cfset request.layout = false />
		<!--- call the frameworks onRequestStart --->
		<cfset fw1.onRequestStart("index.cfm") />
		
		<!--- we save the results via cfsavecontent so we can display it in mura --->
		<cfsavecontent variable="result">
			<cfset fw1.onRequest("index.cfm") />
		</cfsavecontent>
		
		<cfreturn result />
	</cffunction>
</cfcomponent>