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
		<%
			import re, os
			from os import listdir
			from os.path import isfile, join
			curdir = os.getcwd()
			filepath = bottle_home+'files'
			onlyfiles = [f for f in listdir(filepath) if isfile(join(filepath, f))]
			os.chdir(filepath)
			onlyfiles.sort(key=os.path.getmtime, reverse=True)
			os.chdir(curdir)
			images = []
			links = []
			for file in onlyfiles:
				if not re.match(r"^\.", file): 
					if re.match(r".*\.jpe?g$|.*\.gif$|.*\.png$", file):
						images.append(file)
					else:
						links.append(file)
					end
				end
			end
			image_count = len(images)
			link_count = len(links)
		%>
		% if len(images) > 0:
		<h2>Images ({{image_count}})</h2>
		<div class="container">
		% for image in images:
		<div class="image">
			<a href="/static/{{image}}"><img src="/static/{{image}}" title="{{image}}"></a>
			<form action="/static/{{image}}/delete" method="post">
				<button type="submit" value="Submit">delete</button>
			</form>
		</div>
		% end
		</div>
		% end
		% if len(links) > 0:
		<h2>Other Files ({{link_count}})</h2>
		<div class="container">
		% for link in links:
		<div class="link">
			<a href="/static/{{link}}">{{link}}</a> 
			<form action="/static/{{link}}/delete" method="post"> 
				<button type="submit" value="Submit">delete</button> 
			</form>
		</div>
		% end
		</div>
		% end
		% if len(images) == 0 and len(links) == 0:
		<div class="container">
		<p>No files.</p>
		<div>
		%end
	<h2>Upload More Files</h2>
	<div class="upload">
                <form action="/upload" method="post" enctype="multipart/form-data">
                        <input type="file" id="file" name="upload" onchange="form.submit()" />
                        <label for="file">Choose File</label>
                </form>
        </div>
</body>
</html>
