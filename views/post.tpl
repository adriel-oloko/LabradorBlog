{{meta}}

		<title>Labrador || Home</title>
		<meta name="google-site-verification" content="rHzbxyw19LJeMR2uW5W_4CPpKzLmk6UO7qs3h8Ls9o4" />
{{header}}


			<b><a id="bar-4">Tags</a></b>

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
				<input name="query" type="text" style="border: 0px solid #ccc;width: 77%; float: left; font-size: 16px; height: 40px; outline: none;"/>
				<button style="width: 29%; float: right;border: 1px solid #ccc; border-radius: 15px; width: 40px; height: 40px; font-size: 14px; background: gold;"><i class="fa fa-search"></i></button>
				</form>
			</div>

			<hr />
			<b><a id="bar-4">Tags</a></b>

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


        <div id="side" style="padding-left: 17px; height: 700px; border-left: 1px solid #000; float: right;">
            <table style="width: 100%; height: 50px; padding: 0px;">
				<tr>
				<th style="width: 15%; text-align: center;padding: 0px; display: none;">

				</th>

				<th style="margin: auto; width: auto; text-align: center; padding: 0px;">
					<h3>Labrador.inc</h3>
				</th>

				<th style="visibility: hidden; width: 15%; text-align: center; padding: 0px;">
				<div id="header-nav-button">
				<button onclick="Close_search()"><h2><i class="fa fa-close"></i></h2></button>
				</div>
				</th>
				</tr>
			</table>

			<br />

			<div style="padding: 5px; border: 1px solid #ccc; height: 40px; width: 90%; margin: auto; font-size: 14px; border-radius: 15px;">
				<form action="/search/handler" method="post">
				<input name="query" type="text" style="border: 0px solid #ccc;width: 77%; float: left; font-size: 16px; height: 40px; outline: none;"/>
				<button style="width: 29%; float: right;border: 1px solid #ccc; border-radius: 15px; width: 40px; height: 40px; font-size: 14px; background: gold;"><i class="fa fa-search"></i></button>
				</form>
			</div>

			<hr />
			<b><a id="bar-4">Tags</a></b>

			<br />
			<div style="padding: 0px 0px 0px 0px; background-color: #fff;">
				<p style="line-height:1.6; border-right:8px solid #fff;">
					{% for rb in all_tags %}
						<a href="/query/{{rb[0]}}"><span class="tags" >{{rb[0]}}</span></a>
					{% endfor %}
				</p>
			</div>
		</div>

<div id="main">
		<div class="post">
			<h2 style="margin-bottom: 0px; padding:0px 0px;"> {{id[2]}} </h2>
			<pre><i class="fa fa-clock-o" style="text-align:left;color:lightgrey;font-size:10px;"> {{id[6]}} {{id[7]}}, {{id[8]}} {{id[4]}}:{{id[5]}} </i></pre>
			<hr />

			{{xx}}
		</div>
		<!--End-Of-Blog-Content-->

		<br />

		<div class="post">
			<h4>Tags:</h4>
			<div style="padding: 0px 0px 0px 0px; background-color: white;">
				<p style="line-height: 1.5; border-right:10px solid white;">
				{% for t in tags %}
					<a style="color: black;" href="/query/{{t[1]}}"><span style="background-color:lightgrey; padding-left: 2px; padding-right: 2px;">{{t[1]}}</span></a>
				{% endfor %}
				</p>
			</div>
		</div>
		<!--End Of Tags-->


		<!--comments-->
		<div class="post">
			<h4>Comments:</h4>

			{% for c in comments %}
			<h5 style="line-height: 0px; font-size:14px;">{{c[2]}}</h5>
			<p style="line-height: 1.5;font-size:14px;">{{c[3]}}</p>
			<pre style="line-height: 0px;"><i class="fa fa-clock-o" style="text-align:left;color:lightgrey;font-size:10px;"> {{c[6]}} {{c[7]}}, {{c[8]}} {{c[4]}}:{{c[5]}} PM</i></pre>
			<hr />

			{% endfor %}


			<textarea id="p_id" name="p_id" style="visibility: hidden;">{{id[0]}}</textarea>
			<textarea id="author_comment" name="author" type="text" style="margin-bottom:6px; border-radius:.5em;height:1.5em;float:left;" placeholder="Name"></textarea>

			<textarea id="comment_text" name="comment" type="textarea" style="border-radius:.5em; height: 8em; width: 90%;" placeholder="Comment..."></textarea>
			<br />

			<input type="submit" style="border: 1px solid gold; background-color:gold;border-radius:.5em;margin-top: 5px;height: 2em;" onclick="Comment_work()" />

			<br />
			<br />
			<div id="lert" style="width: 70%; margin: auto; background: #00BA40; padding: 2px; border-radius: 5px; font-weight: 150; text-align: center; display: none;">
			<p>Succesfully updated</p>
		</div>

		<div id="faillert" style="width: 70%; margin: auto; background: #FE2323; padding: 2px; border-radius: 5px; font-weight: 150; text-align: center; display: none;">
			<p>Update error!!!</p>
		</div>
		</div>
		<!--End Of Comments-->

		<br />
		<br />


			<div style="background: #fff; padding: 5px; border-radius: 10px;">
			<div class="recents">
				<h2 style="line-height: 0px;">Feautured</h2>
				<hr/>

				{% for br in brew %}
				<table style="border-radius: 10px; border: 1px solid black; width: 100%;box-shadow: 5px 6px 12px #aaa;">

					<tr>
						<th style="width: 30%; padding-bottom: 9px;">
							<a href="/{{br[11]}}"><img src="/post/images/{{br[9]}}" style="width: 60px; height: 60px; border-radius: 100%; margin-bottom: -6px;" /></a>
						</th>

						<th style="width: 69%;">
						<a href="/query/{{br[14]}}"><div><p style="color: #ccc; text-align: left; font-size: 13px; position: relative; top: -5px;">{{br[14]}}</p></div>
						<a href="/{{br[11]}}"><div><p style="text-align: left; font-size: 13px; position: relative; top: -15px;">{{br[2]}}</p></div>
						</th></a>
					</tr>

					</table>

					<br />
					{% endfor %}

				</div><!--colored-->

			</div><!--recents-->
		</div><!--main-->

		<div id="footer">
			<hr />
			<p id="footer">chopped by adrielloks<p>
			<p id="footer">©{{yr}}</p>
		</div>


		<script>
			var httpRequest = new XMLHttpRequest();

			function Comment_work() {
				var author = document.getElementById("author_comment").value;
				var comment = document.getElementById("comment_text").value;

				httpRequest.onreadystatechange = writeContent;

				httpRequest.open('POST', '/{{tt}}');

				httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

				httpRequest.send("author="+author+"&comment="+comment+"&p_id="+{{id[0]}});

				function writeContent() {
					if(httpRequest.readyState === 4) {
						if(httpRequest.status == 200) {
							var response = httpRequest.responseText;
        success();

       }
       else {
        failure();
       }
      }
      else {
       // response not ready yet
      }
     }
    }


			function success(){
				document.getElementById("lert").style.display="";
				setTimeout(remo, 3000);
			}

			function failure(){
				document.getElementById("faillert").style.display="";
				setTimeout(remo, 3000);
			}

			function remo(){
			    document.location.reload(true);
				document.getElementById("lert").style.display="none";
				document.getElementById("faillert").style.display="none";
			}
		</script>
	</body>
</html>