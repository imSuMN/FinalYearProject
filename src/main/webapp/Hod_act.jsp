<head>
<style>
.out {
	width:95%;
	margin: auto;
}

.c_card {
	padding: 2rem;
	height: auto;
	width: auto;
	background: #5da2d5;
	color: white;
	font-weight:bold;
	border-radius:8px;
}
</style>
</head>


<body>
	<%@page import="java.util.*,ProjMyDetails.*"%>

	<%@ include file="nav.jsp"%>
	<%
	myDetailsDaw mdw = new myDetailsDaw();
	String user = (String) session.getAttribute("user");
	MyDetailsData userInfo = mdw.getAllInfo(user);
	%>

	<div class="out">
		<div class="c_card">
			<div class="label">
				<p>
					Name: <%=userInfo.getaName()%></p>
				<p>
					TCSION ID: <%=userInfo.getTcsionId()%>
				</p>
				<p>
					Date-of-birth: <%=userInfo.getudob()%></p>
				<p>
					Designation: <%=userInfo.getDesignation()%></p>


				<div class="label_2 text-center" id="last_div">
					<button type="button" class="btn btn-success">Accept</button>
					<button type="button" class="btn btn-danger">Decline</button>
				</div>
			</div>
		</div>
	</div>
</body>