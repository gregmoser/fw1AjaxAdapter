<cfcomponent>
	<!---
		Copyright (c) 2010, Greg Moser
	
		Licensed under the Apache License, Version 2.0 (the "License");
		you may not use this file except in compliance with the License.
		You may obtain a copy of the License at
	
			http://www.apache.org/licenses/LICENSE-2.0
	
		Unless required by applicable law or agreed to in writing, software
		distributed under the License is distributed on an "AS IS" BASIS,
		WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
		See the License for the specific language governing permissions and
		limitations under the License.
	--->
	
	<cffunction name="fw1AjaxFormSubmit" access="remote">
		<cfset var result = "" />
		<cfset var fw1 = createObject("component","Application") />
		
		<cfset structAppend(form, arguments) />
		<cfset request.layout = false />
		
		<!--- call the frameworks onRequestStart --->
		<cfset fw1.onRequestStart("/index.cfm") />
		
		<!--- we save the results via cfsavecontent so we can display it in mura --->
		<cfsavecontent variable="result">
			<cfset fw1.onRequest("/index.cfm") />
		</cfsavecontent>
		
		<cfreturn result />
	</cffunction>
</cfcomponent>