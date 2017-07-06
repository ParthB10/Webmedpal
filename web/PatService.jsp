<%-- 
    Document   : PatService
    Created on : 15 Jun, 2017, 12:26:41 PM
    Author     : ParthBheda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Medpal Patient Services</title>
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
    body {
    font-family: 'Text Me One', sans-serif;
    background: url(bg.png)repeat rgba(41, 176, 126, 0.89);
    background-attachment: fixed;
}
</style>
    </head>
    <body>
        <div class="total-content">
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
<!--				<ul>
					<li><a href="#"><i class="user"></i></a></li>
					<li><a href="#">Users Update</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="mail"></i></a></li>
					<li><a href="#">Function 3</a></li>
				</ul>
				<ul>
					<li><a href="#"><i class="page"></i></a></li>
					<li><a href="#">Logout</a></li>
				</ul>-->
                </div>            
        </div>        
            <div class="member">
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
			<div class="clearfix"></div>	
</div>
    </body>
</html>

