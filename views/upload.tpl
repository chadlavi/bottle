<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>Upload</title>
  <meta name="description" content="{{get('meta', '')}}">

  <link rel="stylesheet" href="css/styles.css">

</head>

<body>
	<h1>Upload</h1>
	<div>
		<form action="/upload" method="post" enctype="multipart/form-data">
			Select a file: <input type="file" name="upload" />
			<input type="submit" value="Start upload" />
		</form>
		<p><a href="/">Home</a></p>
	</div>
</body>
</html>
