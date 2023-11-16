{{meta}}

		<title>Dashboard</title>

		<style>
			#myInput { background-image: url('/img/search.png');
			 background-position: 5px 10px; background-size:40px;
			  background-repeat: no-repeat; width: 100%;
			  box-sizing: border-box;
			  font-size: 16px;
			  padding: 12px 20px 12px 40px;
			  border: 1px solid #ddd; margin-bottom: 12px;
			 }

			#myTable { border-collapse: collapse; width: 100%; border: 1px solid #ddd; font-size: 13px;
		 }

		 #myTable th, #myTable td {
		 	 text-align: left; padding: 12px; }

		 	#myTable tr {
		 	 border-bottom: 1px solid #ddd;
		 } #myTable tr.header, #myTable tr:hover{ background-color: #f1f1f1; }

			#mt {
				border-collapse: collapse;
				width: 100%;
				border: 1px solid #ddd;
				font-size: 14px;
				border-radius: 10px;
			}

			#mt th, #mt td {
				text-align: left;
				padding: 12px;
		 }

			#my tr {
			 border-bottom: 1px solid #ddd;
		 }

		 #mt tr.header, #my tr:hover{
		 		background-color: #f1f1f1;
		 }


		</style>
{{header}}
<a href="/analytics"><h4>Analytics</h4></a>
<hr />

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



		<script  src="/js/chart.js"></script>


		<div style="padding: 0px;">
			<a href="/editor"><button class="p-add" style="position: fixed; bottom: 35px; right: 35px; background-color: gold; height: 30px; width: 30px; border: 1px solid gold; border-radius: 50%;"><i class="fa fa-plus"></i></button></a>

		<br>

		<button style="background-color: cyan;margin-bottom: 0px; border: 1px solid cyan; font-size: 14px; border-radius: 10px; padding: 05px;" onclick = "document.getElementById('pop_tags').style.display = 'block'; document.getElementById('pop_tags').style.height = 'auto'; ">Popular tags</button>

		<br /><br />

		<a href="/generate"><button style="background-color: cyan;margin-bottom: 0px; border: 1px solid cyan; font-size: 14px; border-radius: 10px; padding: 10px;">Generate newsletter csv</button></a>

		<br>
		<br>


		<div id="pop_tags" style="width:70%;height:0px; display: None;margin: auto; text-align: center; padding: 25px; top: 450px;box-shadow: 0 10px 20px rgba(0, 24, 43, 1); font-size: 13px; border-radius: 10px;" >

			<button style="float: right; background-color: #fff; margin: 0px 7px 7px 0px; border: 1px solid #fff;" onclick="document.getElementById('pop_tags').style.display = 'None'; document.getElementById('pop_tags').style.height = '0px';"><i class="fa fa-close"></i></button>

			<table id="mt">
				<tr class="header">
					<th style="width: 70%">Tag</th>
					<th style="width: 10%"><i class="fa fa-cog" style="margin-left: 25px;"></i>
				</tr>

				{%for pop in popular_tags%}
				<tr>
					<td>{{pop[1]}}</td>
					<td><a href = "/{{pop[1]}}/del-popular-tag"><i class="fa fa-trash" style="margin-left: 25px;"></i></a></td>
				</tr>
				{%endfor%}
			</table>

			<br>

			{%if tag_addable %}
			<form action="/add-popular-tag" method="post">
				<input style="color: black; background-color:white; border:1px solid white; border-bottom: 1px solid gold; width:70%; height: auto; margin-bottom: 15px;" name="id" id="id" placeholder="Tag name" />

			<br>

			<button style="background-color: cyan; border: 1px solid cyan; width: 70%; margin: auto; font-size: 13px;">Add</button>
			</form>
			<br>
		{%endif%}
		</div>




		<br>
		<input type="text" id="myInput" onkeyup="srch()" placeholder= "Search by Name...." title="Type in a name" >

		<table id="myTable">

			<tr class="header">
				<th style="width:5%;">ID</th>
				<th style="width:35%;">Name</th>
				<!--<th style="width:10%;">Size</th>-->

				<th style="width:20%;">Date</th>
				<th style="width:28%; ">Status</th>
				<th style="width:10%; "><i class="fa fa-cog fa-lg" style="margin-left: 5px;"></i></th>
			</tr>


			{%for post in posts%}
			<tr>
				<td>{{post[0]}}</td>
				<td id ="chk">{{post[2]}}</td>
				<!--<td>{{post[13]}}kb</td>-->
				<td>{{post[6]}} {{post[7]}}, {{post[8]}}</td>
				{%if post[12] == "post"%}
					<td>Published</td>
				{%else%}
					<td>Draft</td>
				{%endif%}

				<td style="color: blue;">
					<a href="/editor/{{post[0]}}/{{post[11]}}/{{post[12]}}"><i class="fa fa-edit" style="color: blue;"></i></a>
					<a href="/delete/{{post[2]}}/{{post[0]}}"><i class="fa fa-trash" style="margin-left: 0px; color: blue;"></i></a></td>
			</tr>
			{% endfor %}

		</table>

		</div>

		<br />

		{% if page > 0%}
			{% if page == 1 %}
				<button style="float:left;border:1px solid black; height:25px; background-color:white; margin-left: 25px; border-radius: 5px;"><a href="/dashboard">Next</a></button>
			{% else %}
				<button style="float:left;border:1px solid black; height:25px; background-color:white; margin-left: 25px; border-radius: 5px;"><a href="/dashboard/{{ page-1 }}">Next</a></button>
			{% endif %}
		{% endif %}

		{% if has_next %}
			<button style="float:right;border:1px solid black; height:25px; background-color:white; margin-right: 25px;border-radius: 5px;"><a href="/dashboard/{{ page+1 }}">Previous</a></button>
		{% endif %}


		<br />
		<br />
		<script>

		function srch() { var input, filter, table, tr, td, i; input=document.getElementById("myInput"); filter=input.value.toUpperCase(); table=document.getElementById("myTable"); tr=table.getElementsByTagName("tr"); for (i = 0; i < tr.length; i++) { td = tr[i].getElementsByTagName("td")[1]; if (td) { if (td.innerHTML.toUpperCase() .indexOf(filter) > -1) { tr[i].style.display = ""; } else { tr[i].style.display = "none"; } } } } </script>


		<script>
		new Chart(document.getElementById("line-chart"), {
			type: 'line',
			data: {
				labels : ["Jan","Feb","Mar","Apr","May","June","July","Aug","Sept","Oct","Nov","Dec"],

				datasets : [
					{
						data : [0,50,100,150,200,250,300,350,400,450,500,550,600],
						label: "Monthly traffic", borderColor: "#acc26d", backgroundColor: "#rgba(172,194,132,0.4)", fillColor : "rgba(172,194,132,0.1)", strokeColor : "#ACC26D", pointColor : "#acc26d", pointStrokeColor : "#acc26d"
      }
     ]
    },
   });

   new Chart(document.getElementById("myContinent"), {
			type: 'doughnut',
			data: {
				labels : ["North-America","South-America","Africa","Asia","Europe","Australia"],

				datasets : [
					{
						data : [0,50,50,100,20,100],
						label: "Continent traffic",
						borderColor: [
							'rgba(0, 255, 255, 0.4)',
        'rgba(54, 162, 235, 0.2)',
        'rgb(0, 128, 128)',
        '#B91010',
        '#E61BFF',
        '#30FF89'
						],

						backgroundColor:
						[
        'rgba(0, 255, 255, 0.4)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(37, 197, 219, 1)',
        '#B91010',
        '#E61BFF',
        '#30FF89'
        ],
      }
     ]
    },
   });


   new Chart(document.getElementById("sources"), {
			type: 'doughnut',
			data: {
				labels : ["Organic search","Direct","Email","Social","Other"],

				datasets : [
					{
						data : [30,50,50,100,20],
						label: "Monthly traffic",
						borderColor: [
							'rgba(0, 255, 255, 0.4)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(37, 197, 219, 1)',
							'rgba(89, 164, 294, 1)',
							'rgba(204, 46, 74, 1)'
						],

						backgroundColor:
						[
							'rgba(0, 255, 255, 0.4)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(37, 197, 219, 1)',
							'rgba(89, 164, 294, 1)',
							'rgba(204, 46, 74, 1)'
       ],
      },
     ]
    },
   });


   new Chart(document.getElementById("device"), {
			type: 'doughnut',
			data: {
				labels : ["Desktop","Mobile","Tablet"],

				datasets : [
					{
						data : [50,50,50],
						label: "Monthly traffic",
						borderColor: [
							'rgba(0, 255, 255, 0.4)',
							'rgba(54, 162, 235, 0.2)',
							'rgb(0, 128, 128)'
						],

						backgroundColor:
						[
							'rgba(0, 255, 255, 0.4)',
							'rgba(54, 162, 235, 2)',
							'rgba(37, 197, 219, 1)'
       ],
      },
     ]
    },
   });
        </script>

		<div id="footer">
			<hr />
			<p id="footer">chopped by adrielloks<p>
			<p id="footer">©{{yr}}</p>
		</div>

	</body>
</html>