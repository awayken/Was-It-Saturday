<cfset message = "">
<cfset status = "">
<cfif isDefined('url.date')>
	<cfif IsDate(url.date) AND DayOfWeek(url.date) EQ 7>
		<cfset message = "YES, this date <em>was</em> a Saturday!<br>(It was " & DateFormat(url.date, "full") & ", to be exact.)">
		<cfset status = "success">
	<cfelse>
		<cfset message = "No, this date was not a Saturday.">
		<cfif IsDate(url.date)>
			<cfset message &= "<br>(It was " & DateFormat(url.date, "full") & ", to be exact.)">
		</cfif>
		<cfset status = "failure">
	</cfif>
</cfif>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Was It Saturday?</title>
		<link href='http://fonts.googleapis.com/css?family=Amatic+SC' rel='stylesheet' type='text/css'>
		<link href="_styles/screen.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<h1>Was It Saturday?</h1>
		
		<cfif Len(message)>
			<cfoutput>
				<div class="message #status#">#message#</div>
			</cfoutput>
		</cfif>
		
		<form action="" method="get">
			<fieldset>
				<label for="date">Enter a date:</label>
				<input type="textbox" name="date" id="date"<cfif isDefined('url.date') AND IsDate(url.date)> value="<cfoutput>#DateFormat(url.date, "m/d/yyyy")#</cfoutput>"</cfif>>
			</fieldset>
			<fieldset>
				<button type="submit">Was It Saturday?</button>
			</fieldset>
		</form>
	</body>
</html>