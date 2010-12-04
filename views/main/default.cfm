<cfset Local.ExampleFieldOne = rc.ExampleFieldOne />
<cfset Local.ExampleFieldTwo = rc.ExampleFieldTwo />

<cfoutput>
	<div class="maindefault">
		<p>This is an example form that can be submitted via the fw1AjaxAdapter</p>
		<form method="post" onsubmit="return fw1AjaxFormSubmit();">
			<input type="hidden" name="action" value="main.default" />
			<dl>
				<dt>Example Field One Input</dt>
				<dd><input name="ExampleFieldOne" value="#Local.ExampleFieldOne#" /></dd>
			</dl>
			<dl>
				<dt>Example Field Two Input</dt>
				<dd><input name="ExampleFieldTwo" value="#Local.ExampleFieldTwo#" /></dd>
			</dl>
			<button type="submit">Submit</button>
		</form>
		<hr />
		<cfif Local.ExampleFieldOne neq "" or Local.ExampleFieldTwo neq "">
			<p>Here are the results from the Ajax form submit</p>
			<dl>
				<dt>Example Field One</dt>
				<dd>#Local.ExampleFieldOne#</dd>
			</dl>
			<dl>
				<dt>Example Field Two</dt>
				<dd>#Local.ExampleFieldTwo#</dd>
			</dl>
			<hr />
		</cfif>
	</div>
</cfoutput>