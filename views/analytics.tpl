<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0;" />
        <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="./css/reset.css" />
        <!--<link rel="stylesheet" type="text/css" href="./css/style.css" />-->

        <style>
            table {
                border-bottom: 3px solid rgb(0, 8, 39);
                width: 99%;
                height: 50px;
                color: white;
            }

            #bar_table {
                width: 100%;
                height: 100px;
                border-radius: 8px;
                margin-left: 10px;
            }


            .bar_td {
                width: 20%;
                height: 90px;
                border-radius: 8px;
                color: #000;
            }

            .bar_div {
                width: auto;
                height: 55px;
                border-radius: 8px;
                padding: 10px;
                background-color: #5568fe;
                color: #fff;
            }

            .bar_div > h2, .bar_div > p {
               line-height: 0px;
            }

            .bar_space {
                width: 2%;
                height: 100px;
                border-radius: 8px;
                margin-right: 5px;
                z-index: 0;
            }

            .graph_div {
                width: 99%;
                height: auto;
                border-radius: 8px;
                border: 1px solid #000;
                margin-left: 10px;
            }


            #bar_table_ii {
                width: 99%;
                height: 250px;
                border-radius: 8px;
                border: None;
                margin-left: 10px;
            }


            .bar_td_ii {
                width: 45%;
                height: auto;
                border-radius: 8px;
                border: None;
                color: #000;
            }

            .bar_div_ii {
                width: auto;
                height: auto;
                border-radius: 8px;
                border: None;
                padding: 10px;
            }

            .bar_div_ii > h2, .bar_div_ii > p {
               line-height: 0px;
            }

            .bar_space_ii {
                width: 2%;
                height: 100px;
                border-radius: 8px;
                margin-right: 5px;
                z-index: 0;
            }
        </style>
    </head>

    <body>
        <script src="./js/Chart.min.js"></script>

        <div style="background: #313a56;">
            <table>
                <tr>
                    <td style="width: 93%;"><h2 style="margin-left: 10px;">Dashboard</h2></td>
                    <td><div style="background-color: red; width: 15px; height: 15px; border-radius: 100%; float: right;"></div></td>
                    <td><div style="background-color: yellow; width: 15px; height: 15px; border-radius: 100%; float: right;"></div></td>
                    <td><div style="background-color: green; width: 15px; height: 15px; border-radius: 100%; float: right;"></div></td>

                </tr>
            </table>
        </div>

        <br />

        <div style="width: 45%; border: 0px solid red;">
            <table id="bar_table">
                <tr>
                    <td class="bar_td">
                        <div class="bar_div">
                            <h2>26</h2>
                            <!--<i class="fa fa-graph"></i>-->
                            <p>Total posts</p>
                        </div>
                    </td>
                    <td class="bar_space"></td>

                    <td class="bar_td">
                        <div class="bar_div">
                            <h2>11.8k</h2>
                            <p>Total impressions</p>
                        </div>
                    </td>
                    <td class="bar_space"></td>

                    <td class="bar_td">
                        <div class="bar_div">
                            <h2>57</h2>
                            <p>Backlinks</p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <br />

        <div style="width: 99%; border: 0px solid blue;">
            <div class="graph_div">
                <canvas id="line-chart" height="70"></canvas>
            </div>
        </div>

        <br /><br />
        <br /><br />

        <div style=" margin-left: 0px; border: 0px solid red;">
            <table id="bar_table_ii">
                <tr>
                    <td class="bar_td_ii"><div class="bar_div_ii" style="background-color: #e7edff;">
                        <canvas id="line-chart-monthly" height="140"></canvas>
                    </div></td>
                    <td class="bar_space_ii"></td>

                    <td class="bar_td_ii"><div class="bar_div_ii" style="background-color: #f8f1ff;">
                        <canvas id="line-chart-daily" height="140"></canvas>
                    </div></td>
                </tr>
            </table>
        </div>

        <br /><br />

        <div style="width: 99%; border: 0px solid blue;">
            <div class="graph_div" style="padding-left: 10px; height: 630px;">
                <h1>Recent post traffic</h1>
                <div style="border-top: 2px solid #313a56; width: 50%;"></div>

                <br />

                <table style="width: 45%; height: auto;">
                    <thead style="background: #313a56; color: #fff; text-align: left; font-size: large;">
                        <tr>
                            <th style="padding: 5px;">S/N</th>
                            <th style="padding: 5px;">Title</th>
                            <th style="padding: 5px;">Comments</th>
                            <th style="padding: 5px;">Views</th>
                        </tr>
                    </thead>
                    <tbody style="border: 1px solid #313a56;  color: #000;">
                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">1</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">White House Port Envoy Says Nation’s Entire Supply Chains Need 247 Operations</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">935</td>
                        </tr>

                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">2</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Proposed Inland Port in the Mojave Desert Could Help Unsnarl Nation’s Top Port Complex</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">846</td>
                        </tr>

                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">3</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Keppel Terminates More Contracts Linked to 2010s Offshore Boom</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">723</td>
                        </tr>

                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">4</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Norwegian Cruise Line Says Pre Pandemic Occupancy Still a Year Away,Shares Tumble</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">722</td>
                        </tr>

                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">5</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Rhine Water Levels in Germany Leaves Ships Only Part-Loaded</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">646</td>
                        </tr>

                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">6</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Tankers See Strongest Market in 25 Years</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">492</td>
                        </tr>

                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">7</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Bear Grylls on his role models and why there’s more to life than top grades</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">454</td>
                        </tr>
                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">8</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">5 things to know before the stock market opens Wednesday</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">338</td>
                        </tr>
                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">9</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Bitcoin price: Can the cryptocurrency recover in February?</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">323</td>
                        </tr>
                        <tr>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">10</td>
                            <td style="background:rgb(250, 250, 250); padding: 5px; border-bottom: 2px solid #ddd;">Bitcoin has traders expecting a great October</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd;">Null</td>
                            <td style="padding-left: 5px; border-bottom: 2px solid #ddd">320</td>
                        </tr>
                    </tbody>

                </table>
                <div style="position: relative; right: -50%; top: -305px; width: 40%; height: 300px; border: 1px solid #000; border-radius: 8px;">
                    <canvas id="doughnut-chart-posts" height="140"></canvas>
                </div>
            </div>
        </div>

        <br /><br />

        <div style="width: 99%; border: 0px solid blue;">
            <div class="graph_div" style="padding-right: 7px; height: auto;">
                <h1 style="padding-left: 7px;">Traffic information</h1>
                <div style="border-top: 2px solid #313a56; width: 50%; margin-left: 7px;"></div>

                <br /><br />
                <table id="bar_table_ii" style="height: auto;">
                    <tr>
                        <td class="bar_td_ii" style="width: 30%; height: 200px;"><div class="bar_div_ii" style="background-color: #d1ffd5; height: 250px;">
                            <canvas id="horizontal-chart-continent" height="150"></canvas>
                        </div></td>
                        <td class="bar_space_ii" style=" height: 200px;"></td>

                        <td class="bar_td_ii" style="width: 30%; height: 50px;"><div class="bar_div_ii" style="background-color: #e7edff; height: 250px;">
                            <canvas id="horizontal-chart-device" height="150"></canvas>
                        </div></td>
                        <td class="bar_space_ii" style=" height: 200px;"></td>

                        <td class="bar_td_ii" style="width: 30%; height: 200px;"><div class="bar_div_ii" style="background-color: #f8f1ff; height: 250px;">
                            <canvas id="horizontal-chart-source" height="150"></canvas>
                        </div></td>
                    </tr>
                </table>
                <br />

            </div>
        </div>

        <br /><br /><br />

        <div style="background: #313a56; height: auto; margin-bottom: -50px;">
            <table style="border: None;">
                <tr>
                    <td><h2 style="margin-left: 10px;">For Labrador</h2></td>
                    <td><div style="border: 0px solid red; width: 50px; height: 50px; border-radius: 100%; float: right;"></div></td>
                </tr>
            </table>
            <div style="border-top: 2px solid rgb(250, 250, 250); width: 30%; margin: auto;"></div>
            <p style="text-align: center; font-size: small; color:rgb(250, 250, 250);">All Rights Reserved</p>
            <br />
        </div>

        <script>
            // Bar chart
            new Chart(document.getElementById("line-chart"), {
                type: 'line',
                data: {
                  labels: ["Aug", "Sept", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug"],
                  datasets: [
                    {
                        data: [5589, 5765, 5332, 7950, 7949, 7947, 8037, 8845, 9943, 9454, 9684, 10048, 10966],
                        label: "Views",
                        borderColor: "#313a56",
                        fill: false
                    }
                  ]
                },
                options: {
                  legend: { display: false },
                  title: {
                    display: true,
                    text: "Annual site traffic (2022)"
                  }
                }
            });


            new Chart(document.getElementById("line-chart-monthly"), {
                type: 'line',
                data: {
                  labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
                  datasets: [
                    {
                        data: [10048, 9877, 10223, 10323, 10246, 10534, 10353, 10467, 10676, 10468, 10966, 10864],
                        label: "Monthly views",
                        borderColor: "#313a56",
                        fill: false
                    }
                  ]
                },
                options: {
                  legend: { display: false },
                  title: {
                    display: true,
                    text: "Monthly site traffic (Aug)"
                  }
                }
            });


            new Chart(document.getElementById("line-chart-daily"), {
                type: 'line',
                data: {
                  labels: ['0:00', '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', '19:00', '20:00', '21:00', '22:00', '23:00', ],
                  datasets: [
                    {
                        data: [675, 553, 394, 297, 223, 182, 136, 174, 173, 374, 546, 447, 465, 367, 287, 412, 404, 539, 576, 734, 678, 856, 787, 585],
                        label: "Hourly views (GMT)",
                        borderColor: "#313a56",
                        fill: false
                    }
                  ]
                },
                options: {
                  legend: { display: false },
                  title: {
                    display: true,
                    text: "Daily site traffic (12/08/2022)"
                  }
                }
            });


            new Chart(document.getElementById("doughnut-chart-posts"), {
                type: 'doughnut',
                data: {
                  labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                  datasets: [
                    {
                        data: [935, 846, 723, 722, 646, 492, 454, 338, 323, 320],
                        label: "Daily views",
                        backgroundColor: ["#313a56"],
                    }
                  ]
                },
                options: {
                  legend: { display: false },
                  title: {
                    display: true,
                    text: "Recent posts traffic (10)"
                  }
                }
            });

            new Chart(document.getElementById("horizontal-chart-device"), {
                type: 'pie',
                data: {
                  labels: ["Android", "iOS", "MacOS", "Windows", "Linux", "Others"],
                  datasets: [
                    {
                        data: [23.2, 30.2, 13.3, 21.7, 6.7, 4.9],
                        label: "Users",
                        backgroundColor: ["#eab48b", "#63c5e4", "#746cfe", "#ae8cfa", "#4fa3a5", "#fe6f98"],
                    }
                  ]
                },
                options: {
                  legend: { display: true },
                  title: {
                    display: true,
                    text: "Devices"
                  }
                }
            });


            new Chart(document.getElementById("horizontal-chart-continent"), {
                type: 'pie',
                data: {
                  labels: ["Africa", "Asia", "Australia", "Europe", "North America", "South America"],
                  datasets: [
                    {
                        data: [5.4, 15.73, 11.3, 22.5, 22.7, 22.4],
                        label: "Users",
                        backgroundColor: ["#eab48b", "#63c5e4", "#746cfe", "#ae8cfa", "#4fa3a5", "#fe6f98"],
                    }
                  ]
                },
                options: {
                  legend: { display: true },
                  title: {
                    display: true,
                    text: "Traffic region"
                  }
                }
            });

            new Chart(document.getElementById("horizontal-chart-source"), {
                type: 'pie',
                data: {
                  labels: ["Search engine", "Facebook", "Linkedinp", "Twitter", "Other"],
                  datasets: [
                    {
                        data: [19.4, 17.7, 20.3, 20.6, 22],
                        label: "Users",
                        backgroundColor: ["#eab48b", "#63c5e4", "#746cfe", "#ae8cfa", "#4fa3a5"],
                    }
                  ]
                },
                options: {
                  legend: { display: true },
                  title: {
                    display: true,
                    text: "Traffic source chart"
                  }
                }
            });
            </script>
    </body>
</html>