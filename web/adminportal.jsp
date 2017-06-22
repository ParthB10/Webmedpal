<%-- 
    Document   : adminportal
    Created on : 17 Jun, 2017, 12:00:30 PM
    Author     : ParthBheda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Medpal Application Administrator</title>
        <link rel='stylesheet prefetch' href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
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
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
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

    </style>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    </head>
    <body>
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
<!--                    <li class="sub-menu">
                        <a href="javascript:void(0);"><i class="fa fa-cogs"><span>User Details</span><i class="arrow fa fa-angle-right pull-right"></i></i> </a>
                        <ul>
                            <li>
                                <a href="#">Portal User Registration</a>
                            </li>                            
                        </ul>
                    </li>-->
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
                
 %></a> </p>
                <div id="dd" class="wrapper-dropdown-2" tabindex="1" style="margin-left: 550px"><span><img src="settings.png"/></span>
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
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
    <script src="index.js"></script>
    </body>
</html>
