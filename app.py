bottle_home = '/root/bottle/' #change this to the location of your bottle dir

from bottle import route, run, template, get, post, request, static_file, error, redirect, response, os

# route to index
@route('/')
def index():
    return template('app', bottle_home=bottle_home, title="Images", meta="shhh.")

# route for css
@get('/css/<file>')
def returnstyles(file):
    return static_file(file, root=bottle_home+'css/')

# upload file
@post('/upload')
def do_upload():
    import hashlib
    import time
    hash = hashlib.sha1()
    hash.update(str(time.time()))
    upload = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)
    upload.filename = hash.hexdigest()[:10] + ext
    upload.save(bottle_home+'files') # appends upload.filename automatically
    redirect('/')

# delete file
@post('/static/<name>/delete')
def recipe_delete( name="Mystery Recipe" ):
	os.remove(bottle_home+'files/'+name)
	redirect('/')	

# route for serving a static file from a given directory
@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root=bottle_home+'files')

# error routing
@error(404)
def error404(error):
    return 'Nothing here, sorry'
# or can redirect:
#    redirect('/')

run(host='', port=8080)
