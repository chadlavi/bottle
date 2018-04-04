<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>{{get('title', 'No Title')}}</title>
  <meta name="description" content="{{get('meta', '')}}">

  <link rel="stylesheet" href="css/styles.css">

</head>

<body>
	<h1>Files</h1>
	<div>
		<%
			from os import listdir
			from os.path import isfile, join
			filepath = '/root/files'
			onlyfiles = [f for f in listdir(filepath) if isfile(join(filepath, f))]
		%>
		% for file in onlyfiles:
		<p><a href="/static/{{file}}">{{file}}</a></p>
		% end
		<p><a href="/upload">upload a file</a></p>
	</div>
</body>
</html>
