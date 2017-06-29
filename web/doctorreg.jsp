<%-- 
    Document   : doctorreg
    Created on : 29 Jun, 2017, 10:48:55 AM
    Author     : PoojaBamane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medpal</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
            body {
    font-family: 'Text Me One', sans-serif;
    background: url(bg.png)repeat rgba(41, 176, 126, 0.89);
    background-attachment: fixed;
/*  color: #5D5F63;
  background: #293949;
  font-family: 'Open Sans', sans-serif;
  padding: 0;
  margin: 0;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;*/
}
.sidebar-toggle {
  margin-left: -240px;
}
.sidebar {
  width: 240px;
  height: 100%;
  background: #293949;
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
/*dept regitration*/ 
.red{
        color:red;
        }
        .form-control{
            background:#3e5871;
            color:white;
        }
    .form-area
    {
        border-radius: 5px;
        background: #2C3E50;
         border-top: 3px solid #434a52;
          border-bottom: 3px solid #434a52;
    	padding: 10px 40px 60px;
    	
    	border: 1px solid GREY;
    	color:white;
    	}
        body {
      background: #f7f6f3;
      font-family: sans-serif;
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
        <aside class="sidebar">
            <div id="leftside-navigation" class="nano">
                <ul class="nano-content">
                    <li>
                    <a href="adminportal.jsp"><i class="fa fa-dashboard"></i><span>Home</span></a>
                </li>
                    <li class="sub-menu">
                    <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>Settings</span><i class="arrow fa fa-angle-right pull-right"></i></a>                
                    <ul>
                        <li>
                            <a href="ui-alerts-notifications.html">Sms Settings</a>
                            <!--//Alerts &amp;-->
                        </li>
                        <li>
                            <a href="ui-panels.html">Email Settings</a>
                        </li>
                        <li>
                            <a href="ui-buttons.html">Notification Settings</a>
                        </li>
                </ul>
                    <li class="sub-menu">
                      <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>Hospital Details</span><i class="arrow fa fa-angle-right pull-right"></i></a>                  
                      <ul>
                          <li>
                              <a href="#">Hospital Registration</a>
                          </li>
                          <li>
                              <a href="#">Staff Registration</a>
                          </li>
                      </ul>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:void(0);"><i class="fa fa-cogs"></i><span>Doctor Details</span><i class="arrow fa fa-angle-right pull-right"></i> </a>
                        <ul>
                            <li>
                                <a href="deptreg.jsp">Department Registration</a>
                            </li>
                            <li>
                                <a href="#">Doctor Registration</a>
                            </li>
                        </ul>
                    </li>
            </div>
        </aside>
        <div class="member" style="margin-left:135px;">
                <!--get username from session <i class="men">-->
            <p style="margin-left: 95px;"></i><a><% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                if(session.getAttribute("user")==null){
                    response.sendRedirect("index.html");
                }
                else{                   
                     String user=(String)session.getAttribute("user");out.print(user);
                }
                %></a> 
            </p>
            <div id="dd" class="wrapper-dropdown-2" tabindex="1" style="margin-left: 500px;"><span><img src="settings.png"/></span>
                <ul class="dropdown">
                    <li><a href="#">View Profile </a></li>		
                    <form> <li><a href="index.html">Log out</a></li> </form>
<!--                                                                            <input type="submit" value="Logout" class="btn" formaction="Patportal" method="post">-->
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
                <h2 style="color:white;">Doctor Registration</h2>
                <hr class="divider">
            </div>
        </div>
    </div>
            <div class='container'>
                <div class="col-md-6 col-md-offset-3">
                    <div class="form-area">
                        <div role="form">
                            <br style="clear: both">
                            <div id="datepicker" class="calendar"></div>
                            <div class="form-group">
                                <form action="doctor" method="post">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <input type="text" class="form-control" id="doc" name="docname" placeholder="Doctor Name" style="background:#3e5871;color:#eee;border-color:#3e5871"><br>
                                            <input type="text" class="form-control" id="doc" name="docCode" placeholder="Doctor Code" style="background:#3e5871;color: #eee;border-color: #3e5871"><br>
                                            <input type="text" class="form-control" id="doc" name="docadd" placeholder="Address" style="background:#3e5871;color: #eee;border-color: #3e5871"><br>
                                            <input type="number" class="form-control" id="doc" name="docc" placeholder="Contact No" style="background:#3e5871;color: #eee;border-color: #3e5871"><br>
                                            <select class="form-control" name="DoctorDepartment" style="background:#3e5871;color: #eee;border-color: #3e5871">
                                                <option value="-1"> - - Select Department - -</option>   
                                            </select>
                                            <br>
                                            <label style="font-weight:normal;margin-bottom:5px;">Date of Join.</label>
                                             <input type="date" class="form-control" id="doc" placeholder="Date of Join" style="background:#3e5871;color: #eee;border-color: #3e5871">
                                             <br>
                                             <input type="email" class="form-control" id="doc" name="docemail" placeholder="Email" style="background:#3e5871;color: #eee;border-color: #3e5871"><br>
                                             <input type="text" class="form-control" id="doc" name="docusername" placeholder="Username" style="background:#3e5871;color: #eee;border-color: #3e5871"><br>
                                             <input type="password" class="form-control" id="doc" name="docpass" placeholder="Password" style="background:#3e5871;color: #eee;border-color: #3e5871"><br>
                                             
                                        </div>
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                        <input type="submit" align="left" class=button value="Submit" name="save" style="width:150px;margin-left:15px"> 
                                        <input type="reset" align="center" class="button" value="Clear" name="clear" style="width:120px;margin-left:15px;background:#b02932;border: 0;
                                        font-family: 'Open Sans', Arial, sans-serif;font-size: 16px;height: 40px;border-radius: 3px;color: white;cursor: pointer;
                                        margin-top: 10px;transition: background 0.3s ease-in-out;">    
                                        <input type="submit" align="right" class="button" value="View Doctor" name="" style="width:160px;margin-left:15px">
                                    </div>
                                </form>
                            </div>
                            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
    <script src="index.js"></script>
                    </div>
                        
                </div>
            </div>
    </body>
</html>
