{{meta}}

<style>
body {
font-family: 'Helvetica Neue', 'Helvetica', arial, sans-serif;

}


</style>

		{{header}}

		<a id="bar-4">Tags</a>

			<br />
			<div style="padding: 0px 0px 0px 0px; background-color: #fff;">
				<p style="line-height:1.6; border-right:8px solid #fff;">
					{% for ra in popular_tags %}
						<a href="/query/{{ra[1]}}"><span class="tags" >{{ra[1]}}</span></a>
					{% endfor %}
					</p>
			</div>
		</div>



		<div id="navbar-search">
			<table style="width: 100%; height: 50px; padding: 0px;">
				<tr>
				<th style="width: 15%; text-align: center;padding: 0px; display: none;">

				</th>

				<th style="margin: auto; width: auto; text-align: center; padding: 0px;">
					<h3>Labrador.inc</h3>
				</th>

				<th style="width: 15%; text-align: center; padding: 0px;">
				<div id="header-nav-button">
				<button onclick="Close_search()"><h2><i class="fa fa-close"></i></h2></button>
				</div>
				</th>
				</tr>
			</table>

			<br />

			<div style="padding: 5px; border: 1px solid #ccc; height: 40px; width: 90%; margin: auto; font-size: 14px; border-radius: 15px;">
				<form action="/search/handler" method="post">
				<input name="query" type="text" style="border: 0px solid #ccc;width: 77%; float: left; font-size: 16px; height: 95%; outline: none;"/>
				<button style="width: 29%; float: right;border: 1px solid #ccc; border-radius: 15px; width: 40px; height: 40px; font-size: 14px; background: gold;"><i class="fa fa-search"></i></button>
				</form>
			</div>

			<hr />
			<a id="bar-4">Tags</a>

			<br />
			<div style="padding: 0px 0px 0px 0px; background-color: #fff;">
				<p style="line-height:1.6; border-right:8px solid #fff;">
					{% for rb in all_tags %}
						<a href="/query/{{rb[0]}}"><span class="tags" >{{rb[0]}}</span></a>
					{% endfor %}
				</p>
			</div>

		</div>
		<hr />
		<!-- END OF HEADER -->

		<br />
		<br />

		<form action="/editor" method="post" enctype="multipart/form-data">
		<div style="width:99%;">
			<input style="color: black; background-color:white; border:1px solid white; border-bottom: 1px solid gold; width:70%; height: auto" id="title" name="title" placeholder="Title" value="{{all[2]}}" />


		</div>

<br>
<br>

<script src="https://cdn.tiny.cloud/1/hl4pp34o5nonsppphyg5bd5r5t78za90axbzrk9wj5wgtwld/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<div style="height: auto; width: 100%; box-shadow: 5px 6px 12px #aaa;background: black; border-radius:5px; padding: 12px 0px 12px 0px;">


<textarea name="txt_save" id="myTextarea" >{{x}}</textarea>
</div>

<script type="text/javascript">
tinymce.init({
  selector: '#myTextarea',  // change this value according to your HTML

  content_css: ["/css/rjt.css",
    "https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap",
  ],
  height: 500,
  plugins: [
      'advlist autolink autosave fullpage lists link image charmap print preview hr anchor pagebreak',
      'searchreplace wordcount visualblocks visualchars code fullscreen',
      'insertdatetime media nonbreaking save table contextmenu directionality',
      'emoticons template paste textcolor colorpicker textpattern imagetools'
    ],

  toolbar1: 'insertfile undo redo | styleselect | bold italic fontsizeselect | alignleft aligncenter alignright alignjustify ',
  toolbar2: 'bullist numlist outdent indent | forecolor backcolor emoticons',
    toolbar3: 'save print preview media link image fullpage code',
    image_advtab: true,
    extended_valid_elements : "*[*]"
});


</script>

<br>
<br>

<div style="background-color:lightgrey; padding:4px; border-left:0px solid lightgrey; height: auto; border: 1px solid lightgrey; border-radius: 5px;">

	<input style="color: black; background-color:lightgrey; border:1px solid lightgrey; border-bottom: 1px solid gold; width:70%; height: auto; margin-bottom: 5px;" name="author" placeholder="Author" value="{{all[1]}}" />



	<input type="file" name="header"/>

	<textarea style="margin-top: 5px; border: 1px solid gold; border-radius: 5px; height: 75px; width: 95%;" name="summary" placeholder="A short 20 word excerpt from the post...">{{all[10]}}</textarea>

	<textarea style="margin-top: 5px; border: 1px solid gold; border-radius: 5px; height: 75px; width: 95%;" name="tags" placeholder="Tags seperated by spaces...">{{tag}}</textarea>
	<input name="day" placeholder="Day"/>
<input name="month" placeholder="Month"/>
<input name="year" placeholder="Year"/>

</div>

<br>

<input type="submit" style="bottom: 15px; float: right; background-color: gold; height: 30px; width: 25%; margin-right: 35px; border: 1px solid gold; border-radius: 5px;" placeholder="Submit" ></input>

<br>
<br>
<button type="submit" formaction="/editor/draft" style="bottom: 15px; float: right; background-color: gold; height: 30px; width: 25%; margin-right: 35px; border: 1px solid gold; border-radius: 5px;" >Draft</button>

</form>

		<br /><br /><br />

		<div id="footer">
			<hr />
			<p id="footer">chopped by adrielloks<p>
			<p id="footer">©2021</p>
		</div>
</body>
</html>