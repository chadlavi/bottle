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
	<div class="upload">
		<form action="/upload" method="post" enctype="multipart/form-data">
			<input type="file" id="file" name="upload" onchange="form.submit()" />
			<label for="file">Choose File</label>
		</form>
		<p><a href="/">Cancel</a></p>
	</div>
</body>
</html>
