<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="quuery.UserQuery,loginVar.sampleVariable.*,java.util.*"%>
<%@page import="quuery.UserQuery"%>
<%@page import="loginVar.sampleVariable"%>
<jsp:useBean id="u" class="loginVar.sampleVariable"></jsp:useBean>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>FOOD AND DRUG | INSPECTION</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" media="all">
<link href="bootstrap/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="bootstrap/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/datatables.min.css" />
<script src="bootstrap/js/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/datatables.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/style.js"></script>
<script type="text/javascript">
	function Delete() {
		return confirm("Are you sure do you want to delete..?");
	}
	$(document).ready(function() {
		$("#data").dataTable({
			dom : 'Bfrtip',
			buttons : [ {
				extend : 'pdf',
				text : 'Print PDF'
			} ]
		});

	});
</script>
</head>
<%
try{
	 response.setHeader("Cache-Control","no-cache");
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader ("Expires", 0);
	if(session.getAttribute("username") == null || session.getAttribute("username").equals("") || session.getAttribute("password") == null || session.getAttribute("username").equals("")){
		response.sendRedirect("logout.jsp");
	}else{
%>
<body>
<div class="wrapper">
	<div class="wrapper_inner">
		<!--************************** LEFT SIDE BAR********************* -->
		<div class="vertical_wrap">
			<div class="vertical_bar">
				
				<!--********************************************************************************* -->
				     <jsp:include page="Menu.jsp" />
					<!--********************************************************************************* -->
			</div>
		</div>
		<!--*********************** END LEFT SIDE BAR**************************** -->
		<div class="main_container">
			<!--***********************  TOP BAR**************************** -->
			<div class="top_bar">
				<div class="hamburger">
					<i class="fa fa-bars"></i>
				</div>
				<div class="logo">
					FOOD & DRUG INSPECTION <span>USING BARCODE</span>
				</div>
			</div>
			<!--***********************  DIV CONTENT **************************** -->
			<%
				List<sampleVariable> list = UserQuery.allreceiveSample();
				request.setAttribute("list", list);
			%>
			<div class="content"
				style="height: 690px; width: 100%; background: #E3F2F1; padding: 9px 35px">
				<h3 style="margin-left: -12px;">Resulted Samples</h3>
				<div class="row"
					style="background: #fff; height: 600px; padding: 80px 50px 50px 50px; overflow: auto;"
					class="table-responsive;">
					<!-- Content -->
					<table class="table table-striped table-bordered table-responsive"
						style="text-align: center;" id="data">
						<thead style="text-align: center; background: #E3F2F1;">
							<tr>
								<th id="th">Sample Code</th>
								<th id="th">Sample Name</th>
								<th id="th">Received</th>
								<th id="th">CustType</th>
								<th id="th">CustCode</th>
								<th id="th">Lab Sumited</th>
								<th id="th">Remark</th>
								<th id="th">Approval</th>
								<th id="th">Result Date</th>
								<th id="th">View</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="u">
								<tr>
									<td>${u.getSCode()}</td>
									<td>${u.getSName()}</td>
									<td>${u.getSubmDate()}</td>
									<td>${u.getCustType()}</td>
									<td>${u.getCCode()}</td>
									<td>${u.getSType()} Lab</td>
									<td>${u.getRemark()}</td>
									<td>${u.getApproval()}</td>
									<td>${u.getSampDate()}</td>
									<td><a
										href="printSampleResult.jsp?SCode=${u.getSCode()}&CCode=${u.getCCode()}"><i
											class="fa fa-eye"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- *********** -->
				</div>
			</div>
			<script type="text/javascript">
				$(document).ready(function() {
					$("#foodLab").modal("show");
				});
			</script>
			<div
				style="height: 35px; background: #fff; padding: 12px 25px; color: #000000; font-weight: bold;">
				<span>Copyright � 2021 | Mohd. M. Seif</span>
			</div>
		</div>
	</div>
</div>
<script>
	var hamburger = document.querySelector(".hamburger");
	var wrapper = document.querySelector(".wrapper");
	var backdrop = document.querySelector(".backdrop");

	hamburger.addEventListener("click", function() {
		wrapper.classList.add("active");
	})

	backdrop.addEventListener("click", function() {
		wrapper.classList.remove("active");
	})
</script>
</body>
	<%
	}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</html>