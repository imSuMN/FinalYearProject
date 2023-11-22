<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.util.*,ProjMyDetails.*"%>
	<%
	myDetailsDaw mdw = new myDetailsDaw();
	String users = (String) session.getAttribute("user");
	MyDetailsData usersInfo = mdw.getAllInfo(users);
	%>
	<div class="dashboard">

		<h5 class="card-header text-center" style="background: #f78888">Welcome
			to Dashboard</h5>
		<div class="d-flex flex-wrap justify-content-between p-5">
			<div class="other areas">
				<div
					class="d-flex flex-column align-items-center justify-content-center px-5 py-2 rounded text-white"
					style="background-color: #0A91AB;">
					<div class="font-weight-bold m-2">ADD HOD</div>
					<button onClick='handleAddHOD()' class="m-2 btn btn-info px-4">+</button>
				</div>
			</div>
			<div id="notification-panel"
				style="width: 25%; min-height: 400px; background-color: #C1D5DD; border-radius: 8px;">
				<h4 class="text-center py-3">Notifications</h4>
			</div>
		</div>


	</div>
	
	<script>
		const handleAddHOD = ()=>{
			console.log("clicked")
			window.location='addHod.jsp'
		}
	</script>
</body>
</html>