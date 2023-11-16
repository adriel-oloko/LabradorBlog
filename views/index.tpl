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
		    <div class="b-screen"><a href="/{{spec[11]}}">
		        <img src="/post/images/{{spec[9]}}" style="width: 100%; height: auto; border-radius: 8px;" />
		        <h2 style="color: black;">{{spec[2]}}</h2>
		        <p style="font-size: x-large;">Global survival expert and adventurer, Bear Grylls, has told CNBC that role models including his own father taught him that there was more to life than just top grades.</p>
		        <p style="color: lightgrey;"><b><i class="fa fa-clock-o" style="color:lightgrey;"></i> {{spec[7]}} {{spec[6]}} {{spec[8]}}</b></p>
		    </a></div>
		    <hr />
			<div class="post-head-banner" style="color: white; background-image: url('/post/images/{{spec[9]}}'); padding: 10px;">
				<div style="position: relative; top: 50%; color: white;">
				<p style="color: #ccc;">{{spec[14]}}</p>
				<h3 style="color: white;">{{spec[2]}}</h3>

				<p style="padding: 0px; margin: 0px; font-size: 12px; color: white;">{{spec[10]}}</p>
				</div>
				<br />
				<a href="/{{spec[11]}}"><button style="background-repeat: no-repeat; background-image: url('/post/images/{{spec[9]}}'); background-position: center;  background-repeat: no-repeat;  background-size: cover; position: relative; border-radius: 5px; float: right; color: white; padding: 5px; border: 1px solid #ccc;">Read more..</button></a>
			</div>

			<br />
			<hr />

			<div class="b-screen">
			{% for post in posts %}
	            <div style="position: relative; background-image: url('/post/images/{{post[9]}}'); background-position: center;background-repeat: no-repeat; background-size: cover; height: 250px; border-radius: 8px;">
					<br /><br /><br />
					<div style="position: absolute; bottom: 0; background: #FFF; height: auto; width: 85%;border-radius: 0px 8px 0px 0px; padding: .1px 7px 2px 7px; border: 0px solid red;">
					    <h4 style="border: 0px solid #999; margin-top: 7px; margin-bottom: 5px;">{{post[2]}}</h4>
				        <table style="width: 100%; border: None; font-size: 90%; position: relative; left: -2px;"><tr><td style="color: #FF4C41;"><a href="/query/{{post[14]}}" style="color: #FF4C41;"><b>{{post[14]}}</b></a></td><td style="color: #DDD; text-align: right;"><b><i class="fa fa-clock-o" style="font-size: 10px;color:lightgrey;"></i> {{post[7]}} {{post[6]}} {{post[8]}}</b></td></tr></table>
				    </div>
				</div>

				<br />
				<hr />
				<br />
            {% endfor %}
            </div>

            <div class="s-screen">
			<table style="width: 100%; padding-bottom: 8px;">

			{% for post in posts %}
				<tr>
					<th style="width: 30%; border: 0px solid #ddd; border-radius: 5px;"><img src="/post/images/{{post[9]}}" style="height: 70px; width: auto; border-radius: 5px;" /></th>

					<th style="width: 69%; padding-left: 7px;">
						<a href="/query/{{post[14]}}"><p style="color: #ccc; text-align: left; font-size: 13px; position: relative; top: 0px; margin-bottom: 0px; line-height: 1px;">{{post[14]}}</p>
						<a href="/{{post[11]}}"><p style="color: #000; text-align: left; font-size: 13px; position: relative; top: -4px; margin-bottom: 0px;">{{post[2]}}</p>

						<p style="text-align:left; color:lightgrey; font-size:10px; line-height: 0px; position: relative; top: -6px;"><i class="fa fa-clock-o" style="font-size: 10px;color:lightgrey;"></i> {{post[7]}} {{post[6]}} {{post[8]}}</p>
					</th></a>
				</tr>

				{% endfor %}

			</table>
            </div>

		{% if page > 0%}
		<br />
			{% if page == 1 %}
				<button style="float:left;border:1px solid black; height:25px; background-color:white; margin-left: 25px; border-radius: 5px;"><a href="/">Next</a></button>
			{% else %}
				<button style="float:left;border:1px solid black; height:25px; background-color:white; margin-left: 25px; border-radius: 5px;"><a href="/{{ page-1 }}">Next</a></button>
			{% endif %}
		{% endif %}

		{% if has_next %}
			<button style="float:right;border:1px solid black; height:25px; background-color:white; margin-right: 25px;border-radius: 5px;"><a href="/{{ page+1 }}">Previous</a></button>
		{% endif %}


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

	</body>
</html>