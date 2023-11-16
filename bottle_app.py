from bottle import run, route, request, response,  jinja2_template, static_file, error, redirect, default_app
import bottle
import sqlite3

import mysql.connector
from mysql.connector import Error

import itertools
import statistics
from statistics import mode

import time
import random
import os
import csv


per_page = 8
meta_obj = open("/home/labrador/mysite/meta.txt","r")
header_obj = open("/home/labrador/mysite/header.txt","r")

meta = meta_obj.read()
header = header_obj.read()

abs = "/home/labrador/mysite"

host = "labrador.mysql.pythonanywhere-services.com"
database = "labrador"
db_user = "labrador"
db_pwd = "lambdasifu"

def featured_func(connection, count):
	connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
	cursor = connection.cursor(buffered=True)

	month = time.strftime("%B")
	year = time.strftime("%Y")

	cursor.execute("SELECT DISTINCT(p_id) FROM comments WHERE month = %s AND year = %s", (month, year))
	post_id = cursor.fetchall()

	ps_com_count = []
	for i in post_id:
		cursor.execute("SELECT COUNT(*) FROM comments WHERE p_id = %s", (i[0],))
		ty = cursor.fetchone()[0]
		ps_com_count.append(int(ty))

	ps_com_count.sort()

	high_id = []


	if len(ps_com_count) >= count:
		highest = []
		for i in range(1,count+1):
			highest.append(ps_com_count[-i])
		for i in post_id:
			cursor.execute("SELECT COUNT(*) FROM comments WHERE p_id = %s", (i[0],))
			ty = cursor.fetchone()[0]
			if ty in highest:
				high_id.append(i[0])

	else:
		count = len(ps_com_count)
		highest = []
		for i in range(1,count+1):
			highest.append(ps_com_count[-i])
		for i in post_id:
			cursor.execute("SELECT COUNT(*) FROM comments WHERE p_id = %s", (i[0],))
			ty = cursor.fetchone()[0]
			if ty in highest:
				high_id.append(i[0])

	#print(count, high_id)
	if count == 3:
	    cursor.execute("SELECT * FROM posts WHERE p_id = %s  OR p_id = %s OR  p_id = %s ORDER BY p_id DESC", (high_id[0], high_id[1], high_id[2]))
	    brew = cursor.fetchall()

	elif count == 2:
		cursor.execute("SELECT * FROM posts WHERE p_id = %s  OR p_id = %s ORDER BY p_id DESC", (high_id[0], high_id[1]))
		brew = cursor.fetchall()

	elif count == 1:
		cursor.execute("SELECT * FROM posts WHERE p_id = %s ORDER BY p_id DESC", (high_id[0],))
		brew = cursor.fetchall()
	else:
		brew = ""

	connection.close()
	return brew



#####ADMIN
@route('/login')
def login():
    connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
    cursor = connection.cursor(buffered=True)

    cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
    popular_tags = cursor.fetchall()

    cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
    all_tags = cursor.fetchall()

    parameters = {
		'meta': meta,
		'header': header,
		'all_tags': all_tags,
		'brew': featured_func(connection, 3),
		'popular_tags': popular_tags,
		'yr': time.strftime("%Y"),
	}

    connection.close()
    return jinja2_template('login', **parameters)

@route("/dashboard")
@route("/dashboard/<page:int>")
def dashboard (page=0):
	if request.get_cookie("account", secret="polka"):
		connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
		cursor = connection.cursor(buffered=True)

		start, end = page * 30, (page+1)*30

		cursor.execute('SELECT * FROM posts ORDER BY p_id DESC LIMIT %s, 30', (start,))
		posts = cursor.fetchall()

		cursor.execute('SELECT COUNT(*) FROM posts')
		count = cursor.fetchone()

		cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
		popular_tags = cursor.fetchall()

		cursor.execute('SELECT COUNT(*) FROM popular_tags ORDER BY id DESC')
		popular_tags_count = cursor.fetchone()
		cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
		all_tags = cursor.fetchall()

		parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'home': home,
			'page': page,
			'posts': posts,
			'popular_tags': popular_tags,
			'tag_addable': popular_tags_count[0] <= 23,
			'has_next': end < count[0],
		}

		connection.commit()
		connection.close()
		return jinja2_template("dashboard", **parameters)
	else:
	    redirect("/404")


@route("/analytics")
@route("/analytics/<page:int>")
def dashboard (page=0):
	if request.get_cookie("account", secret="polka"):
		connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
		cursor = connection.cursor(buffered=True)

		start, end = page * 30, (page+1)*30

		cursor.execute('SELECT * FROM posts ORDER BY p_id DESC LIMIT %s, 30', (start,))
		posts = cursor.fetchall()

		cursor.execute('SELECT COUNT(*) FROM posts')
		count = cursor.fetchone()

		cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
		popular_tags = cursor.fetchall()

		cursor.execute('SELECT COUNT(*) FROM popular_tags ORDER BY id DESC')
		popular_tags_count = cursor.fetchone()
		cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
		all_tags = cursor.fetchall()

		parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'home': home,
			'page': page,
			'posts': posts,
			'popular_tags': popular_tags,
			'tag_addable': popular_tags_count[0] <= 23,
			'has_next': end < count[0],
		}

		connection.commit()
		connection.close()
		return jinja2_template("analytics", **parameters)
	else:
	    redirect("/404")

@route("/editor")
def home():
	if request.get_cookie("account", secret="polka"):
		connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
		cursor = connection.cursor(buffered=True)
		cursor.execute('SELECT DISTINCT (tag) FROM tags')
		all_tags = cursor.fetchall()

		parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'yr': time.strftime("%Y"),
			'x': '',
			'all': '',
		}
		connection.close()
		return jinja2_template("editor", **parameters)
	else:
		redirect("/404")


@route("/editor/<id>/<file>/<status>")
def home(id, file, status):
	if request.get_cookie("account", secret="polka"):
		connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
		cursor = connection.cursor(buffered=True)

		cursor.execute('SELECT * FROM posts WHERE p_id = %s AND fle = %s',(id, file))
		all = cursor.fetchone()

		cursor.execute('SELECT * FROM tags WHERE p_id = %s',(id, ))
		tx = cursor.fetchall()

		tag = ""
		for b in range(len(tx)):
			y = tx[b]
			tag= tag+y[1]+" "
		file1= open(abs+"/"+status+'/'+file+'.txt', "r")
		x = file1.read()
		file1.close()

		cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
		all_tags = cursor.fetchall()

		parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'yr': time.strftime("%Y"),
			'x': x,
			'all': all,
			'tag': tag,
		}

		connection.close()
		return jinja2_template("editor", **parameters)
	else:
	    redirect("/404")


@route('/editor', method='POST')
def do_save():
	if request.get_cookie("account", secret="polka"):
		connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
		db_Info = connection.get_server_info()
		cursor = connection.cursor(buffered=True)

		author = request.forms.get('author')
		title = request.forms.get('title')
		header = request.files.get('header')
		catch = request.forms.get('summary')
		text = request.forms.get('txt_save')
		tags = request.forms.get('tags')

		text = text.replace("[script]", "<script>")
		text = text.replace("[/script]", "</script>")
		text = text.replace("[script", "<script")
		text = text.replace("[ins", "<ins")
		text = text.replace("[ins]", "<ins>")
		text = text.replace("[/ins]", "<ins>")

		text = text.replace("[button]", "<button>")
		text = text.replace("[/button]", "</button>")
		text = text.replace("[button", "<button")
		text = text.replace("][/button]", "></button>")
		text = text.replace("]</button>", "></button>")

		text = text.replace("][/script]", "></script>")
		text = text.replace("]</script>", "></script>")
		text = text.replace("]</ins>", "></ins>")


		header_img = str(header)
		file =title.replace(" ","-")
		fle = file
		file = file+'.txt'

		cursor.execute("SELECT * FROM posts WHERE file = %s", (file, ))
		mij = cursor.fetchone()
		if mij == None:
			mij = 'qwertyuiopasdfg'

		if os.path.isfile(abs+'/draft/'+file) == True:
			os.remove(abs+'/draft/'+file)

		if os.path.isfile(abs+'/images/'+mij[9]) == True:
			os.remove(abs+'/draft/images/'+mij[9])

		cursor.execute('DELETE FROM posts WHERE p_id = %s AND file = %s', (mij[0], file))
		connection.commit()

		if os.path.isfile(abs+'/post/'+file) == True:
			os.remove(abs+'/post/'+file)

		if os.path.isfile(abs+'/post/images/'+ mij[9]) == True:
			os.remove(abs+'/post/images/'+mij[9])
		cursor.execute('DELETE FROM posts WHERE p_id = %s AND file = %s', (mij[0], file))
		cursor.execute('DELETE FROM tags WHERE p_id = %s',(mij[0],))
		connection.commit()



		hour = time.strftime("%H")
		minute = time.strftime("%M")
		month = request.forms.get('month')
		day = request.forms.get('day')
		year = request.forms.get('year')
		tags = list(tags.split(","))


		file1 = open(abs+'/post/'+file,"w")#write mode
		file1.write(str(text))
		file1.close()

		size = int(round(os.path.getsize(abs+'/post/'+file)/1024))

		cursor.execute('INSERT INTO posts (author, title, file, hour, minute, month, day, year, header_img_url, catch, fle, status, size, tag) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);', (author, title, file, hour, minute, month, day, year, header.filename, catch, fle, 'post', size, tags[0]))
		connection.commit()

		j = '0'
		cursor.execute("SELECT p_id FROM posts ORDER BY p_id DESC")
		p_id = cursor.fetchone()
		for i in p_id:
			j = i


		for t in tags:
			cursor.execute('INSERT INTO tags (p_id, tag) VALUES (%s, %s)', (j, t))
			connection.commit()

		name, ext = os.path.splitext(header.filename)
		if ext not in ('.png','.jpg','.jpeg', '.webp'):
			return 'File extension not allowed.'

		#save_path = (category)
		header.save(abs+'/post/images', overwrite=True) # appends upload.filename automatically

		connection.close()

		redirect('/')
	else:
	    redirect("/404")


@route('/editor/draft', method="POST")
def do_save_draft():
    if request.get_cookie("account", secret="polka"):
	    title = request.forms.get('title')
	    connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
	    cursor = connection.cursor(buffered=True)

	    author = request.forms.get('author')
	    header = request.files.get('header')
	    catch = request.forms.get('summary')
	    text = request.forms.get('txt_save')
	    tags = request.forms.get('tags')

	    h = header.filename

	    header_img = str(header)
	    file =title.replace(" ","-")
	    fle = file
	    file = file+'.txt'

	    if os.path.isfile(abs+'/draft/'+file) == True:
		    cursor.execute("SELECT * FROM posts WHERE fle = %s", (fle, ))
		    mij = cursor.fetchone()
		    os.remove(abs+'/draft/images/'+mij[9])
		    os.remove(abs+'/draft/'+mij[3])

		    cursor.execute('DELETE FROM posts WHERE p_id = %s AND file = %s', (id, file))
		    cursor.execute('DELETE FROM tags WHERE p_id = %s', (id,))
		    connection.commit()


	    file1 = open(abs+'/draft/'+file,"w")#write mode
	    file1.write(str(text))
	    file1.close()

	    name, ext = os.path.splitext(header.filename)
	    if ext not in ('.png','.jpg','.jpeg', '.webp'):
	        connection.close()
	        return 'File extension not allowed.'

	    header.save(abs+'/draft/images', overwrite=True)

	    hour = time.strftime("%H")
	    minute = time.strftime("%M")
	    month = time.strftime("%B")
	    day = time.strftime("%d")
	    year = time.strftime("%Y")

	    size = int(os.path.getsize(abs+'/draft/'+file)/1024)

	    cursor.execute('INSERT INTO posts (author, title, file, hour, minute, month, day, year, header_img_url, catch, fle, status, size) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);', (author, title, file, hour, minute, month, day, year, header.filename, catch, fle, 'draft', size))
	    connection.commit()

	    j = '0'
	    cursor.execute("SELECT p_id FROM posts ORDER BY p_id DESC")
	    p_id = cursor.fetchone()
	    for i in p_id:
	        j = i

	    tags = list(tags.split(","))
	    for t in tags:
	        cursor.execute('INSERT INTO tags (p_id, tag) VALUES (%s, %s)', (j, t))
	        connection.commit()

	    connection.close()
	    redirect('/')
    else:
        redirect("/404")



@route("/add-popular-tag", method="POST")
def add_popular():
    if request.get_cookie("account", secret="polka"):
        connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
        cursor = connection.cursor(buffered=True)

        id = str(request.forms.get('id'))

        cursor.execute("INSERT INTO popular_tags ( tag) VALUES (%s)",(id,))
        connection.commit()
        connection.close()

        redirect("/dashboard")
    else:
        redirect("/404")


@route("/<tag>/del-popular-tag")
def del_popular(tag):
    if request.get_cookie("account", secret="polka"):
        connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
        cursor = connection.cursor(buffered=True)

        cursor.execute("DELETE FROM popular_tags WHERE tag = %s",(tag,))
        connection.commit()
        connection.close()
        redirect("/dashboard")
    else:
        redirect("/404")

@route("/delete/<file>/<id>")
def delete (id, file):
    if request.get_cookie("account", secret="polka"):
        connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
        cursor = connection.cursor(buffered=True)

        data = request.forms.get('title')
        cursor.execute('SELECT * FROM posts WHERE p_id = %s',(id,))
        delete = cursor.fetchone()

        if os.path.isfile('./'+delete [12]+'/images'+delete[9]) == True and os.path.isfile('./'+delete [12]+'/'+delete[3]) == True:

            os.remove(abs+'/'+delete[12]+'/'+delete[3])
        cursor.execute('DELETE FROM posts WHERE p_id = %s AND title = %s', (id, file))
        cursor.execute('DELETE FROM tags WHERE p_id = %s',(id,))

        cursor.execute('DELETE FROM comments WHERE p_id = %s',(id,))
        connection.commit()

        connection.close()
        redirect ('/dashboard')
    else:
        redirect("/404")

#####ADMIN END

#####USER
@route("/favicon.ico")
def fg():
    return ("45")

@route("/image-upload")
def image_upload():
    if request.get_cookie("account", secret="polka"):
        connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
        cursor = connection.cursor(buffered=True)

        cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
        popular_tags = cursor.fetchall()

        cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
        all_tags = cursor.fetchall()

        parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'brew': featured_func(connection, 3),
			'popular_tags': popular_tags,
			'yr': time.strftime("%Y"),
		}
        connection.close()
        return jinja2_template("image-upload", **parameters)
    else:
        redirect("/404")


@route("/image-upload", method="POST")
def image_upload_post():
	cookie = request.get_cookie("account", secret="polka")
	if cookie:
		h = request.files.get('h')

		name, ext = os.path.splitext(h.filename)
		if ext not in ('.png','.jpg','.jpeg', '.webp'):
			return 'File extension not allowed.'

		#save_path = (category)
		h.save(abs+'/post/images', overwrite=True)
		redirect("/")
	else:
	    redirect("/404")



@route("/cookie", method='POST')
def cookie():
	user = request.forms.get('username')
	password = request.forms.get('password')

	if user == 'Rabolac' and password == 'pass':
		response.set_cookie("account", 'login', max_age = 3600 * 24 * 5, secret="polka")

		redirect('/dashboard')
	else:
		return('Login failed')


@route("/")
@route("/<page:int>")
def home(page=0):
	connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
	cursor = connection.cursor(buffered=True)

	cursor.execute('SELECT COUNT(*) FROM posts ')
	total = cursor.fetchone()

	cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')

	popular_tags = cursor.fetchall()

	start, end = (page*8), (page+1)*8

	cursor.execute('SELECT * FROM posts WHERE status = %s  ORDER BY p_id DESC LIMIT %s, 8',('post', start))
	posts = cursor.fetchall()
	spec = posts[0]
	posts.pop(0)

	cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
	all_tags = cursor.fetchall()

	parameters = {
		'meta': meta,
		'header': header,
		'all_tags': all_tags,
		'popular_tags': popular_tags,
		'brew': featured_func(connection, 3),
		'yr': time.strftime("%Y"),
		'page': page,
		'posts': posts,
		'spec': spec,
		'has_next': end < total[0],
		'query_string': '?'+request.query_string,
	}

	connection.close()
	return jinja2_template("index", **parameters)


@route("/<post>")
def post(post):
	connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
	cursor = connection.cursor(buffered=True)

	cursor.execute('SELECT * FROM popular')
	pop_posts = cursor.fetchall()

	popular_posts = []

	cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
	popular_tags = cursor.fetchall()

	for i in range(len(pop_posts)):
		cursor.execute('SELECT * FROM posts WHERE p_id = %s', (pop_posts[i][0],))
		g = cursor.fetchone()
		popular_posts.append(g)

	print("????:",post)
	tt = post
	post_name = tt+'.txt'

	fiu = open(abs+'/post/'+tt+'.txt', "r+")
	xx = fiu.read()

	cursor.execute('SELECT * FROM posts WHERE file = %s',(post_name,))
	pst = cursor.fetchall()
	id = pst[0]

	cursor.execute('SELECT * FROM comments WHERE p_id = %s',(id[0], ))
	comments = cursor.fetchall()

	cursor.execute('SELECT * FROM tags WHERE p_id = %s',(id[0],))
	tags = cursor.fetchall()


	cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
	all_tags = cursor.fetchall()

	parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'brew': featured_func(connection, 3),
			'tt': tt,
			'id': id,
			'xx': xx,
			'yr': time.strftime("%Y"),
			'pst': pst,
			'popular_tags': popular_tags,
			'comments': comments,
			'tags': tags
	}

	connection.close()

	return jinja2_template("post", **parameters)


@route('/<post>', method='POST')
def comment(post):
	p_id =  request.forms.get('p_id')

	connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")

	cursor = connection.cursor(buffered=True)

	content = request.forms.get('comment')
	author = request.forms.get('author')
	tt = post

	content = content.replace("<", "(")
	content = content.replace(">", ")")

	hour = time.strftime("%H")
	minute = time.strftime("%M")
	month = time.strftime("%B")
	day = time.strftime("%d")
	year = time.strftime("%Y")

	cursor.execute('INSERT INTO comments (p_id, author, hour, minute, month, day, year, content) VALUES ( %s, %s, %s, %s, %s, %s, %s, %s)', (p_id, author, hour, minute, month, day, year, content))

	connection.commit()
	connection.close()

	return ("True")

@route("/search/handler", method='POST')
def search_handler():
	query = str(request.forms.get("query"))
	url = '/query/'+query
	redirect(url)

@route("/query/<query>")
@route("/query/<query>/<page:int>")
def search(query, page=0):
	connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
	cursor = connection.cursor(buffered=True)

	se = '%'+query+'%'
	per = int(request.query.per or per_page)

	cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
	popular_tags = cursor.fetchall()

	cursor.execute('SELECT DISTINCT p_id FROM tags WHERE tag LIKE %s', (se,))
	all = cursor.fetchall()

	cursor.execute('SELECT COUNT(DISTINCT p_id) FROM tags WHERE tag LIKE %s', (se,))
	cnt = cursor.fetchone()


	posts = []
	for ji in all:
	    print(" ", ji[0])
	    cursor.execute("SELECT * FROM posts WHERE  p_id = %s",(ji[0], ))
	    k = cursor.fetchone()
	    posts.append(k)


	start, end = page*15, (page+1)*15

	cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
	all_tags = cursor.fetchall()

	parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'brew': featured_func(connection, 3),
			'popular_tags': popular_tags,
			'query': query,
			'cnt': cnt,
			'yr': time.strftime("%Y"),
			'page': page,
			'all': all,
			'posts': posts[start:end],
			'has_next': end < cnt[0],
			'query_string': '?'+request.query_string,
			}

	connection.close()
	return jinja2_template("query", **parameters)


@error(500)
@error(404)
def error404(error):
	connection = mysql.connector.connect(host='labrador.mysql.pythonanywhere-services.com', database='labrador$default', user='labrador', password="lambdasifu")
	cursor = connection.cursor(buffered=True)

	cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
	popular_tags = cursor.fetchall()

	cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
	all_tags = cursor.fetchall()

	parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'brew': featured_func(connection, 3),
			'popular_tags': popular_tags,
			'yr': time.strftime("%Y"),
			}

	connection.close()
	return jinja2_template("404", **parameters)

@route("/404")
def err():
	connection = mysql.connector.connect(host='localhost', database='labrador', user='root', password="zxcvb")
	cursor = connection.cursor(buffered=True)

	cursor.execute('SELECT * FROM popular_tags ORDER BY id DESC')
	popular_tags = cursor.fetchall()

	cursor.execute('SELECT DISTINCT tag FROM tags ORDER BY p_id DESC LIMIT 0, 70;')
	all_tags = cursor.fetchall()

	parameters = {
			'meta': meta,
			'header': header,
			'all_tags': all_tags,
			'brew': featured_func(connection, 3),
			'popular_tags': popular_tags,
			'yr': time.strftime("%Y"),
			}

	connection.close()
	return jinja2_template("404", **parameters)


@route("/css/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./css")

@route("/fonts/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./fonts")

@route("/js/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./js")


@route("/images/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./images")

@route("/post/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./post")

@route("/post/images/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./post/images")

@route("/draft/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./draft")

@route("/draft/images/<filepath:path>")
def logo(filepath):
	return static_file(filepath, root="./draft/images")




#run(reloader=True, debug=True)
application = default_app()