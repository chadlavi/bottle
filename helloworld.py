# cf. https://bottlepy.org/docs/dev/tutorial.html

from bottle import route, run, template, get, post, request, static_file, error, redirect, response, os

# route to index
@route('/')
def index():
    return template('index')

@get('/css/styles.css')
def returnstyles():
    return static_file('styles.css', root='/root/bottle/css')

# set a cookie, read it
@route('/hello')
def hello_again():
    if request.get_cookie("visited"):
        return "Welcome back! Nice to see you again"
    else:
        response.set_cookie("visited", "yes")
        return "Hello there! Nice to meet you"

# route with variable in url path
@route('/hello/<name>')
def index(name):
    return template('<b>Hello {{name}}</b>!', name=name)

# route with filtered variable in url path
# filters include
# :int for integers
# :re for regex
#    example: @route('/show/<name:re:[a-z]+>')
# :float for floats
# :path for unescaped path (with slashes)
# cf. https://bottlepy.org/docs/dev/tutorial.html#dynamic-routes
@route('/int/<id:int>')
def callback(id):
    if isinstance(id, int):
        return template('you entered {{id}}', id=id)

# route for a GET;
# besides route() there are get(), post(), put(), delete() and patch()
@get('/login') # or @route('/login')
def login():
    return '''
        <form action="/login" method="post">
            Username: <input name="username" type="text" />
            Password: <input name="password" type="password" />
            <input value="Login" type="submit" />
        </form>
    '''

# route for a POST
@post('/login') # or @route('/login', method='POST')
def do_login():
    username = request.forms.get('username')
    password = request.forms.get('password')
    if check_login(username, password):
        return "<p>Your login information was correct.</p>"
    else:
        return "<p>Login failed.</p>"
def check_login(x, y):
    return True

# upload file
@get('/upload')
def uploadform():
    return template('upload')
@post('/upload')
def do_upload():
    upload     = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)

    upload.save('/root/files') # appends upload.filename automatically
    redirect('/')

# route for serving a static file from a given directory
@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='/root/files')

# error routing
@error(404)
def error404(error):
    return 'Nothing here, sorry'
# or can redirect:
#    redirect('/')

run(host='', port=8080)
