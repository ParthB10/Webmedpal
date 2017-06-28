<%-- 
    Document   : deptv
    Created on : 22 Jun, 2017, 4:02:50 PM
    Author     : ParthBheda
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    	margin: 10px 0px 60px;
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
/*            -main content for table style*/
            .wrapper{
                margin-top: 0px;
            }
            .table-agile-info{
/*	background: url(bg.png) repeat rgba(41,176,126,0.89);*/
        padding: 2em;
        border-radius: 4px;
        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.panel {
    border: none ! important;
    margin-top: 110px;
    margin-left: 212px;
}
.panel-default>.panel-heading {
/*    color: #000000 ! important;
    background-color: #ddede0 ! important;
    border-color: #ddede0 ! important;
background: url(bg.png) repeat rgba(41,176,126,0.89);*/

    font-size: 20px;
}
.row {
		margin-right: 0;
		margin-left: 0;
	}
        .w3-res-tb {
    padding: 2em 1em 0;
}
.col-sm-5{
    position:relative;min-height:1px;padding-right:15px;padding-left:15px
}
.m-b-xs {
    margin-bottom: 5px;
}
select.input-sm {
    height: 30px;
    line-height: 30px;
}
.form-control{display:block;width:100%;height:34px;padding:6px 12px;font-size:14px;line-height:1.42857143;color:#555;background-color:#fff;background-image:none;border:1px solid #ccc;border-radius:4px;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075);-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s
.w-sm {
    width: 150px;
}
.inline {
    display: inline-block !important;
}
.v-middle {
    vertical-align: middle !important;
}
.btn-sm{padding:5px 10px;font-size:12px;line-height:1.5;border-radius:3px}
.btn-default{color:#333;background-color:#fff;border-color:#ccc}
.btn-default.focus,.btn-default:focus{color:#333;background-color:#e6e6e6;border-color:#8c8c8c}
.btn-default:hover{color:#333;background-color:#e6e6e6;border-color:#adadad}
.btn-default.active,.btn-default:active,.open>.dropdown-toggle
.btn-default{color:#333;background-color:#e6e6e6;border-color:#adadad}
.btn-default.active.focus,.btn-default.active:focus,.btn-default.active:hover,.btn-default:active.focus,
.btn-default:active:focus,.btn-default:active:hover,.open>.dropdown-toggle.btn-default.focus,.open>.dropdown-toggle.btn-default:focus,.open>.dropdown-toggle
.btn-default:hover{color:#333;background-color:#d4d4d4;border-color:#8c8c8c}
.btn-default.active,.btn-default:active,.open>.dropdown-toggle
.btn-default{background-image:none}
.btn-default.disabled,.btn-default.disabled.active,.btn-default.disabled.focus,.btn-default.disabled:active,
.btn-default.disabled:focus,.btn-default.disabled:hover,.btn-default[disabled],.btn-default[disabled].active,.btn-default[disabled].focus,
.btn-default[disabled]:active,.btn-default[disabled]:focus,.btn-default[disabled]:hover,fieldset[disabled] .btn-default,fieldset[disabled] 
.btn-default.active,fieldset[disabled] 
.btn-default.focus,fieldset[disabled] 
.btn-default:active,fieldset[disabled] .btn-default:focus,fieldset[disabled] .btn-default:hover{background-color:#fff;border-color:#ccc}
.btn-default.badge{color:#fff;background-color:#333}
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
                                <a href="#">Department Registration</a>
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
                <section id="main-content">
	<section class="wrapper">
		<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading" style="margin-top:10px;">
      Department List
    </div>
    <form>
      <div class="col-sm-3">
        <div class="input-group" >
            <input type="text" class="input-sm form-control" name="sv" placeholder="Search by Department Name">
          <span class="input-group-btn">
              <input type="submit" class="btn btn-sm btn-default" name="btnsearch"  value="Go">              
            </form> 
            <!--<button class="btn btn-sm btn-default" type="button">Go!</button>-->
            <!-- <input type="sumbit" class="btn btn-group btn-default" name="btnrefresh" value ="Refresh"> -->
          </span>            
        </div>          
      </div>  
        <div align="right">
            <form>
                <input type="submit" class="btn btn-sm btn-default" name="btnrefresh" alt="refresh" style="float: end;margin-right: 5px;margin-top: 2px;" value="Refresh">
            </form>
            </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Department Name</th>
            <th>Department Code</th>
            <th>Department Category</th>
            <th>Status</th>
            <th style="width:30px;"></th>
          </tr>
        </thead>
        <tbody>
          <tr>
          <%
              if(request.getParameter("btnrefresh")!=null)
              {
              try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10/test_medpal","root","Admin@123");
                PreparedStatement ps = connection.prepareStatement("select DeptCode,DeptName,DeptCategory,ActiveStatus from department");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    %>
                        <td name="dn" value="">
                            <%out.println(rs.getString("DeptName"));%>
                        </td>
                        <td name="dc">
                            <%out.println(rs.getString("DeptCode"));%>                            
                        </td>
                        <td name="dct">
                            <%out.println(rs.getString("DeptCategory"));%>
                        </td>
                        <td name="ds">
                            <%out.println(rs.getString("ActiveStatus"));%>
                        </td>
                        <td>
              <a href="" class="active" ui-toggle-class=""><i class="fa fa-check text-success text-active"></i><i class="fa fa-times text-danger text"></i></a>
            </td>            
                    </tr>
                    <%
                }
            %>
        </tbody>
      </table>
              <%
                rs.close();
                ps.close();
                connection.close();
                }
                catch(Exception ex) {
                   ex.printStackTrace();
                   out.println("<h1> error:"+ex.getMessage()+"</h1>"); 
//("<h1> error: "+ e.getMessage()+"</h1>");
              }
}
else if(request.getParameter("btnsearch")!=null){
String sv = request.getParameter("sv");
            String dn = request.getParameter("dn");
            String dc = request.getParameter("dc");
            String dct = request.getParameter("dct");
            String ds = request.getParameter("ds");
try{
if(request.getParameter(sv)==null){
out.println("<script type=\"text/javascript\">");
out.println("alert('Please fill department name to search records!');");
out.println("location='deptv.jsp';");
out.println("</script>");
}
else
{
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10/test_medpal","root","Admin@123");
                PreparedStatement ps = connection.prepareStatement("select DeptCode,DeptName,DeptCategory,ActiveStatus from department where deptname='"+sv+"'");
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    %>
                        <td name="dn" value="">
                            <%out.println(rs.getString("DeptName"));%>
                        </td>
                        <td name="dc">
                            <%out.println(rs.getString("DeptCode"));%>                            
                        </td>
                        <td name="dct">
                            <%out.println(rs.getString("DeptCategory"));%>
                        </td>
                        <td name="ds">
                            <%out.println(rs.getString("ActiveStatus"));%>
                        </td>
                        <td>
              <a href="" class="active" ui-toggle-class=""><i class="fa fa-check text-success text-active"></i><i class="fa fa-times text-danger text"></i></a>
            </td>            
                    </tr>
                    <%
                }

else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Department with "+sv+" does not exist!');");
                out.println("location='deptv.jsp';");
                out.println("</script>");
}

            %>
        </tbody>
      </table>
              <%
                rs.close();
                ps.close();
                connection.close();
                }
}
                catch(Exception ex) {
                   ex.printStackTrace();
                   out.println("<h1> error:"+ex.getMessage()+"</h1>"); 
//("<h1> error: "+ e.getMessage()+"</h1>");
              }
}
else
             {
              try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://192.168.1.10/test_medpal","root","Admin@123");
                PreparedStatement ps = connection.prepareStatement("select DeptCode,DeptName,DeptCategory,ActiveStatus from department");
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                    String dname=rs.getString("DeptName");
                    %>
                        <td name="dn" value="">
                            <%=dname%>                             
                        </td>
                        <td name="dc">
                            <%out.println(rs.getString("DeptCode"));%>                            
                        </td>
                        <td name="dct">
                            <%out.println(rs.getString("DeptCategory"));%>
                        </td>
                        <td name="ds">
                            <%out.println(rs.getString("ActiveStatus"));%>
                        </td>
                        <td>
<!--                            <a href="" class="active" ui-toggle-class=""><i class="fa fa-check text-success text-active"onclick="active();"></i><i class="fa fa-times text-danger text"></i></a>-->
                            <form action="Department" method="post">
                            <input type="submit" name="btnactive" class="active fa fa-check text-success text-active" value="✓" style="border:none;background: transparent;" ><br>
                            <input type="submit" name="btndeactive" class="fa fa-times text-danger text" value="x" style="border:none;background: transparent;">
                            <input type="hidden" name="dname" value="<%=dname%>">
                            </form>
            </td>            
                    </tr>
                    <%
                }
            %>
        </tbody>
      </table>
              <%
                rs.close();
                ps.close();
                connection.close();
                }
                catch(Exception ex) {
                   ex.printStackTrace();
                   out.println("<h1> error:"+ex.getMessage()+"</h1>"); 
//("<h1> error: "+ e.getMessage()+"</h1>");
              }
}

              %>
    </div>
<!--    <footer class="panel-footer">
      <div class="row">
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
      </div>
    </footer>-->
  </div>
</div>
</section>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
    <script src="index.js"></script>
    </body>
</html>
