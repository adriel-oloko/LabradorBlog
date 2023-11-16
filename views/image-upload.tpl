{{meta}}

		<title>Labrador || Image upload</title>
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


		<div id="main">


	    <br />

		<div style="width: 70%; height: auto; border: 3px solid #00182B; margin: auto; border-radius: 25px; box-shadow: 0px 0px 14px #00182B;">
			<div style="width: 100%; height: auto; margin: auto; margin-bottom: 25px;">
				<div style="margin: auto; border-radius: 50%; border: 1px solid #010070; width: 70px; height: 70px;position: relative; top: 15px; background-color: #fff; box-shadow: 0px 0px 10px #001895; padding: 13px;">

				</div>
			</div>

			<hr />

			<h4 style="font-family: 'Nunito', sans-serif ; text-align: center;">Login</h4>
			<div style="width: 80%; height: auto; margin: auto;">
				<form action="/image-upload" method="post" enctype="multipart/form-data">
					<div style="outline: none; width: 100%; height: 30px; border: 1px solid #00182B; border-radius: 20px; margin: auto; margin-bottom: 10px; padding: 10px;">
					<input type="file" name="h" style="outline: none; width: 100%; height: 30px; margin: auto;" />
					</div>
					<input type="submit" style="outline: none; width: 50%; height: 30px; border: 1px solid white; border-radius: 20px; margin: auto; margin-bottom: 10px;" />
				</form>


				<br />
			</div>
		</div>

		</div>

		<br /><br />
		<br /><br />
		<br />


			<div style="width: 70%; margin: auto;">

			</div>


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
						<a href="/{{br[11]}}"><div><p style="text-align: left; font-size: 13px; position: relative; top: -5px;">{{br[2]}}</p></div></a>
						</th>
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