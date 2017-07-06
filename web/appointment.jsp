<%-- 
    Document   : appointment
    Created on : 5 Jul, 2017, 10:05:33 AM
    Author     : PoojaBamane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medpal Patient Service</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <link href="bootstrap.css" rel="stylesheet" type='text/css' />
        <!-- Custom Theme files -->
        <link href="style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- Custom Theme files -->
        <script src="jquery.min.js"></script>
        <link rel="stylesheet" href="font-awesome.css">
        <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--webfont-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <style>
            @import url('http://fonts.googleapis.com/css?family=Open+Sans:300,400,700');
            @import url('//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css');
            @import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0-rc2/css/bootstrap-glyphicons.css");
            body {
                font-family: 'Text Me One', sans-serif;
                background: url(bg.png)repeat rgba(41, 176, 126, 0.89);
                background-attachment: fixed;
            }
            .sidebar-toggle {
  margin-left: -240px;
}
.sidebar {
  width: 22%;
  height: 100%;
  background: #1C445F;
  position: absolute;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  -ms-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  z-index: 100;
}
.sidebar #leftside-navigation ul,
.sidebar #leftside-navigation ul ul {
  margin: -2px 0 0;
  padding: 0;
}
.sidebar #leftside-navigation ul li {
  list-style-type: none;
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
.sidebar #leftside-navigation ul li.active > a {
  color: #1abc9c;
}
.sidebar #leftside-navigation ul li.active ul {
  display: block;
}
.sidebar #leftside-navigation ul li a {
  color: #aeb2b7;
  text-decoration: none;
  display: block;
  padding: 18px 0 18px 25px;
  font-size: 12px;
  outline: 0;
  -webkit-transition: all 200ms ease-in;
  -moz-transition: all 200ms ease-in;
  -o-transition: all 200ms ease-in;
  -ms-transition: all 200ms ease-in;
  transition: all 200ms ease-in;
}
.sidebar #leftside-navigation ul li a:hover {
  color: #1abc9c;
}
.sidebar #leftside-navigation ul li a span {
  display: inline-block;
}
.sidebar #leftside-navigation ul li a i {
  width: 20px;
}
.sidebar #leftside-navigation ul li a i .fa-angle-left,
.sidebar #leftside-navigation ul li a i .fa-angle-right {
  padding-top: 3px;
}
.sidebar #leftside-navigation ul ul {
  display: none;
}
.sidebar #leftside-navigation ul ul li {
  background: #23313f;
  margin-bottom: 0;
  margin-left: 0;
  margin-right: 0;
  border-bottom: none;
}
.sidebar #leftside-navigation ul ul li a {
  font-size: 12px;
  padding-top: 13px;
  padding-bottom: 13px;
  color: #aeb2b7;
}
            /*date time */
            .form-control{
                background:#3e5871;
                color:white;
            }
            .form-area
            {
                border-radius: 5px;
                background: #1C445F;
                border-top: 3px solid #2F5671;
                border-bottom: 3px solid #2F5671;
                padding: 10px 10px 30px;    	
                border: 1px solid GREY;
                color:white;
            }            
            .option{
                background:white;
                color:black;
            }
            .button[type="submit"] {
                background:#b02932;
                border: 0;
                width: 100%;
                font-family: 'Open Sans', Arial, sans-serif;
                font-size: 16px;
                height: 40px;
                border-radius: 3px;
                color: white;
                align:center;
                cursor: pointer;
                margin-top:10px;
                transition: background 0.3s ease-in-out;
            }
            .button[type="reset"] {
                background:#b02932;
                border: 0;
                width: 100%;
                font-family: 'Open Sans', Arial, sans-serif;
                font-size: 16px;
                height: 40px;
                border-radius: 3px;
                color: white;
                align:center;
                cursor: pointer;
                margin-top:10px;
                transition: background 0.3s ease-in-out;
            }
            .button:hover {
                background: #b02932;
                font-family: 'Open Sans', Arial, sans-serif;
                font-size: 17px;
                font-weight:bold;
            }
            .calendar {
                position: absolute;
                width: 280px;
                left: 50%;
                top: 50%;
                margin: -145px 0px 0px -140px;
                background: #fff;
                border-radius: 4px;
                overflow: hidden;
            }
            .ui-datepicker-header {
                height: 50px;
                line-height: 50px;
                color: #b0aead;
                background: #e9e5e3;
                margin-bottom: 10px;
            }
            .ui-datepicker-prev,
            .ui-datepicker-next {
                width: 20px;
                height: 20px;
                text-indent: 9999px;
                border: 2px solid #b0aead;
                border-radius: 100%;
                cursor: pointer;
                overflow: hidden;
                margin-top: 12px;
            }
            .ui-datepicker-prev {
                float: left;
                margin-left: 12px;
            }
            .ui-datepicker-prev:after {
                transform: rotate(45deg);
                margin: -43px 0px 0px 8px;
            }
            .ui-datepicker-next {
                float: right;
                margin-right: 12px;
            }
            .ui-datepicker-next:after {
                transform: rotate(-135deg);
                margin: -43px 0px 0px 6px;
            }
            .ui-datepicker-prev:after,
            .ui-datepicker-next:after {
                content: '';
                position: absolute;
                display: block;
                width: 4px;
                height: 4px;
                border-left: 2px solid #b0aead;
                border-bottom: 2px solid #b0aead;
            }
            .ui-datepicker-prev:hover,
            .ui-datepicker-next:hover,
            .ui-datepicker-prev:hover:after,
            .ui-datepicker-next:hover:after {
                border-color: #5ed1cc;
            }
            .ui-datepicker-title {
                text-align: center;
            }
            .ui-datepicker-calendar {
                width: 100%;
                text-align: center;
            }
            .ui-datepicker-calendar thead tr th span {
                display: block;
                width: 40px;
                color: #00a8b2;
                margin-bottom: 5px;
                font-size:16px;
            }
            .ui-state-default {
                display: block;
                text-decoration: none;
                line-height: 40px;
                font-size: 16px;
            }
            .ui-state-default:hover {
                background: rgba(0,0,0,0.02);
            }
            .ui-state-highlight {
                color: #8dd391;
            }
            .ui-state-active {
                color: #5ed1cc;
            }
            .ui-datepicker-unselectable .ui-state-default {
                color: #eee;
                border: 2px solid transparent;
            }
            input::placeholder{
                color:white;
            }
            #form-area form input[type=text]{
                color:white;
            }
            label.btn span {
                font-size:16px;
            }
            label input[type="radio"] ~ i.fa.fa-circle-o{
            color: #eee;    display: inline;
            }
            label input[type="radio"] ~ i.fa.fa-dot-circle-o{
                display: none;
            }
            label input[type="radio"]:checked ~ i.fa.fa-circle-o{
                display: none;
            }
            label input[type="radio"]:checked ~ i.fa.fa-dot-circle-o{
                color: rgba(24, 188, 156, 0.9);    display: inline;
            }
            label:hover input[type="radio"] ~ i.fa {
                color: #1bd3af;
            }
            label input[type="checkbox"] ~ i.fa.fa-square-o{
                color: #eee;    display: inline;
            }
            label input[type="checkbox"] ~ i.fa.fa-check-square-o{
                display: none;
            }
            label input[type="checkbox"]:checked ~ i.fa.fa-square-o{
                display: none;
            }
            label input[type="checkbox"]:checked ~ i.fa.fa-check-square-o{
                color: rgba(24, 188, 156, 0.9);    display: inline;
            }
            label:hover input[type="checkbox"] ~ i.fa {
                color: rgba(24, 188, 156, 0.9);
            }
            div[data-toggle="buttons"] label.active{
                color: rgba(24, 188, 156, 0.9);
            }
            div[data-toggle="buttons"] label {
                display: inline-block;
                padding: 6px 12px;
                margin-bottom: 0;
                font-size: 14px;
                font-weight: normal;
                line-height: 2em;
                text-align: left;
                white-space: nowrap;
                vertical-align: top;
                cursor: pointer;
                background-color: none;
                border: 0px solid #eee;
                border-radius: 3px;
                color: #eee;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                -o-user-select: none;
                user-select: none;
            }
            div[data-toggle="buttons"] label:hover {
                color: #1bd3af;
            }
            div[data-toggle="buttons"] label:active, div[data-toggle="buttons"] label.active {
                -webkit-box-shadow: none;
                box-shadow: none;
            }
        </style>
    </head>
    <body style="background:url(bg.png) repeat rgba(41,176,126,0.89);">
        <div class="total-content">
            <aside class="sidebar">
                <div class="logo text-center">
                    <a href="#" style="font-size:23px;color:#FFF;">Medpal Patient Portal</a>
                </div>
                <div class="navigation">
                    <h3>Navigation</h3>
                    <ul>
                        <li><a href="appointment.jsp"><i class="cal"></i></a></li>
                        <li><a href="appointment.jsp">Schedule an Appointment</a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><i class="lab-test"></i></a></li>
                        <li><a href="#">Home visit for Lab test</a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><i class="home"></i></a></li>
                        <li><a href="#">Home Visit - Physiotherapy</a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><i class="lab-result"></i></a></li>
                        <li><a href="#">View or download Lab Reports</a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><i class="healthcheckup"></i></a></li>
                        <li><a href="#">Health Check up - Sign up</a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><i class="bill"></i></a></li>
                        <li><a href="#">View Bill and Pay Online</a></li>
                    </ul>
                </div>
        </aside>
        <div class="member" style="margin-left:24%;">
            <!--get username from session-->
            <p><a href="#"><i class="men"></i></a><a href="#"><% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                if(session.getAttribute("user")==null){
                    response.sendRedirect("index.html");
                }
                else{                   
                     String user=(String)session.getAttribute("user");out.print(user);
                }
                
 %></a> </p>
            <div id="dd" class="wrapper-dropdown-2" tabindex="1"><span><img src="settings.png"/></span>
                <ul class="dropdown">
                    <li><a href="#">View Profile </a></li>		
                    <form> <li><a href="index.html">Log out</a></li> </form>
                    <!--<input type="submit" value="Logout" class="btn" formaction="Patportal" method="post">-->
                </ul>
            </div>
            <!-----end-wrapper-dropdown-2---->
            <!-----start-script---->
            <script type="text/javascript">
							function DropDown(el) {
								this.dd = el;
								this.initEvents();
							}
							DropDown.prototype = {
								initEvents : function() {
									var obj = this;
				
									obj.dd.on('click', function(event){
										$(this).toggleClass('active');
										event.stopPropagation();
									});	
								}
							}
							$(function() {
				
								var dd = new DropDown( $('#dd') );
				
								$(document).click(function() {
									// all dropdowns
									$('.wrapper-dropdown-2').removeClass('active');
								});
				
							});
            </script>
            <div class="clearfix"></div>			
            </div> 
            <div class="container">
                <div class="row"  style="margin-top:230px;">
                    <div class="col-lg-12 text-center">
                        <h2 style="color:white;margin-left: 35%;">Appointment Scheduling</h2>
                        <hr class="divider">
                    </div>
                </div>
            </div>
            
            <div class='container'>
                <div class="col-md-6 col-md-offset-3" style="width:85%;margin-left:23%;">
                    <div class="form-area">
                        <div role="form">
                            <br style="clear: both">
                            <div id="datepicker" class="calendar"></div>
                            <div class="form-group">
                                <form action="doctor" method="post">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group col-md-6 col-sm-6">                                                
                                           <select class="form-control" name="DoctorDepartment" style="background:#3e5871;color: #eee;border-color: #3e5871">
                                                <option value="-1"> - - Select Department - -</option>   
                                            </select>                                            
                                        </div>
                                        <div class="form-group col-md-6 col-sm-6">
                                            <select class="form-control" name="Doctor" style="background:#3e5871;color: #eee;border-color: #3e5871">
                                                <option value="-1"> - - Select Doctor - -</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="col-md-6 col-sm-6">
                                            <div class="col-md-3 col-sm-3 form-control" style="margin:0%;padding: 0%;width: 15%;background:#3e5871;color:#eee;border-color:#3e5871">
                                              <span class="input-group-addon form-control" id="basic-addon1"style="background:#3e5871;color:#eee;border-color:#3e5871"><span class="glyphicon glyphicon-calendar" aria-hidden="true"style="background:#3e5871;color:#eee;border-color:#3e5871"></span></span>  
                                            </div>
                                            <div class="col-md-3 col-sm-3 form-control" style="margin:0%;padding: 0%;width: 85%;background:#3e5871;color:#eee;border-color:#3e5871;margin-bottom: 14px;">
                                                <input class="form-control"  type="date" name="appointdate" style="background:#3e5871;color: #eee;border-color: #3e5871;">
                                            </div>                                                                                                                                                                          
                                        </div>
                                        <div class="col-md-6 col-sm-6">
                                            <div class="col-md-3 col-sm-3 form-control input-group-date" id="datetimepicker3" style="margin:0%;padding: 0%;width: 15%;background:#3e5871;color:#eee;border-color:#3e5871" >
                                               <span class="input-group-addon form-control" id="basic-addon1"style="background:#3e5871;color:#eee;border-color:#3e5871"><span class="glyphicon glyphicon-time" aria-hidden="true"style="background:#3e5871;color:#eee;border-color:#3e5871"></span></span>   
                                            </div>
                                            <div class="col-md-3 col-md-3 form-control"  style="margin:0%;padding: 0%;width: 85%;background:#3e5871;color:#eee;border-color:#3e5871">
                                                <input class="form-control" type="time" name="appointtime" style="background:#3e5871;color: #eee;border-color: #3e5871;">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <script type="text/javascript">
            $(function () {
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'
                });
            });
        </script>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group col-md-6 col-sm-6">
                                           <input type="text" class="form-control" id="patapp" name="patname" placeholder="Patient Name" style="background:#3e5871;margin-top: 4px;color: #eee;border-color: #3e5871">                                            
                                        </div>
                                        <div class="form-group col-md-6 col-sm-6">
                                            <input type="text" class="form-control" id="patapp" name="rel" placeholder="Relaionship with Patient" style="background:#3e5871;margin-top: 4px;color: #eee;border-color: #3e5871">                                            
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group col-md-6 col-sm-6">
                                            <input type="phone" class="form-control" id="patapp" name="contactNo" placeholder="Contact No" style="background:#3e5871;margin-top: 4px;color: #eee;border-color: #3e5871" >                                         
                                        </div>
                                        <div class="form-group col-md-6 col-sm-6">
                                            <input type="email" class="form-control" id="doc" name="docemail" placeholder="Email" style="background:#3e5871;margin-top: 4px;color: #eee;border-color: #3e5871">                                            
                                        </div>
                                    </div>
                                     
                                    
                                        </div>
                                        
                                        <div class="container">
                                            <div class="col-md-12 col-sm-12" style="margin-left:12%;margin-top: 8px;">
                                                <div class="form-group col-md-2 col-sm-2">
                                                    <input type="submit" align="left" class=button value="Submit" name="save" > 
                                                </div>
                                                <div class="form-group col-md-2 col-sm-2">
                                                    <input type="reset" align="center" class="button" value="Clear" name="clear"> 
                                                </div>
                                                <div class="form-group col-md-2 col-sm-2">
                                                    <input type="submit" align="right" class="button" value="View Appointment" name="">
                                                </div>
                                            </div>
                                        </div>
                                       
                                    </div>
                                </form>
                            </div>
                            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
    <script src="index.js"></script>
                    </div>
                        
                </div>
            
        </div>
        
         
             
            
            
         <!--<div class="total-content">
            <div class="col-md-3 side-bar">
                <div class="logo text-center">
                    <a href="#" style="font-size:23px;color:#FFF;">Medpal Patient Portal</a>
                </div>
                <div class="navigation">
                    <h3>Navigation</h3>
                    <ul>
					<li><a href="appointment.jsp"><i class="cal"></i></a></li>
					<li><a href="appointment.jsp">Schedule an Appointment</a></li>
                                        
				</ul>
                                <ul>
                                    <li><a href="#"><i class="lab-test"></i></a></li>
                                    <li><a href="#">Home visit for Lab test</a></li>

                                </ul>
                                <ul>
                                    <li><a href="#"><i class="home"></i></a></li>
                                    <li><a href="#">Home Visit - Physiotherapy</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#"><i class="lab-result"></i></a></li>
                                    <li><a href="#">View or download Lab Reports</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#"><i class="healthcheckup"></i></a></li>
                                    <li><a href="#">Health Check up - Sign up</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#"><i class="bill"></i></a></li>
                                    <li><a href="#">View Bill and Pay Online</a></li>
                                </ul>
                </div>
            </div>
            
                
                <div class="container text-center" style=" margin-right: 0px; ">
                    <div class="row" style="width:50%; margin-top: 230px;">
                        <div class="col-lg-12 text-center">
                            <h2 style="color:white;margin-left: 8%;">Appointment Scheduling</h2>
                            <hr class="divider">
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
               
               <div class="container" style="width:50%">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="form-area">
                            <div role="form">
                                <br style="clear: both">
                                <div id="datepicker" class="calendar"></div>
                                <div class="form-group">
                                    <form action="patient" method="post">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="form-group col-md-6 col-sm-6">
                                                <input type="text" class="form-control" id="doc" name="docname" placeholder="Doctor Name" style="background:#3e5871;color:#eee;border-color:#3e5871; ">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>-->
              
           
    </body>
</html>
