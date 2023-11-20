<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>TINT Digital Resource Library</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	background: #ececec;
}

.menu-options {
	color: #fff;
	!
	important
}

.menu-options:hover {
	color: #fff;
}

.nav-back {
	background: #5da2d5;
}

.nav-link:hover {
	color: black;
}

.sideways-dropdown {
	position: absolute;
	top: 10px;
	left: 100%;
	display: none;
	float: none;
	min-width: 130px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-top: none;
}

.sideways-dropdown li {
	display: block;
}

.sideways-dropdown li a {
	padding: 5px;
	color: #333;
	text-decoration: none;
	display: block;
}

.sideways-dropdown li:hover {
	background-color: #f5f5f5;
}

.chnage.dropdown-toggle::after {
	display: inline-block;
	transform: rotate(-90deg);
	margin-left: 5px;
	transition: transform 0.3s ease;
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>

	<nav class="navbar navbar-expand-lg nav-back">

		<img src="collegelogo.png" width="40" height="40" alt="">


		<div class="collapse navbar-collapse container-fluid"
			id="navbarNavDropdown">
			<ul class="navbar-nav ">
				<li class="nav-item active"><a class="nav-link menu-options"
					href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle menu-options" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Reports </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="reports.jsp">NACC</a> <a
							class=" dropdown-item dropdown-toggle" role="button"
							data-toggle="dropdown" href="#">Staff Information</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="userInfo.jsp">Basic
									Information</a></li>
							<li><a class="dropdown-item" href="depSelect.jsp">Detailed
									Information</a></li>
						</ul>
					</div></li>

				<!-- <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle menu-options" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
				          Faculty Corner
				        </a>
				        <div class="dropdown-menu">
				          <a class="dropdown-item" href="#">Professional</a>
				          <a class="dropdown-item dropdown-toggle" role="button" data-toggle="dropdown" href="#">Educational</a>
				          <ul class="dropdown-menu">
							  <li><a class="dropdown-item" href="publishBooksInput.jsp">Published Books</a></li>
							  <li><a class="dropdown-item"href="journals.jsp">Journals</a></li>
							</ul>
				          <a class="dropdown-item" href="#">Personal</a>
				        </div>
				      </li> -->

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle menu-options" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Faculty Corner </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Professional</a> <a
							class="dropdown-item dropdown-toggle chnage" role="button"
							data-toggle="dropdown" href="#">Educational</a>
						<ul class="dropdown-menu sideways-dropdown">
							<li><a class="" href="publishBooksInput.jsp">Published
									Books</a></li>
							<li><a class="" href="journals.jsp">Journals</a></li>
						</ul>
						<a class="dropdown-item" href="#">Personal</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle menu-options" href="#"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Institute Corner </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Awards</a> <a
							class="dropdown-item" href="extension.jsp">Extension/Outreach
							Program</a> <a class="dropdown-item" href="#">Collaboration</a> <a
							class="dropdown-item" href="Program">Tech Program</a>
					</div></li>
				<li class="nav-item"><a class="nav-link menu-options" href="">Making
						Committee<span class="sr-only">(current)</span>
				</a></li>
			</ul>

			<div
				class="nav navbar-nav navbar-right d-flex align-items-center justify-content-evenly">
				
				<p class="text-white mr-3 mt-3" id="uname"></p>
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button"
						data-toggle="dropdown" aria-expanded="false"> <img
						src="profile_photo.png" width="40" height="40">
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<a class="dropdown-item" id="opt-atag" href="myDetails.jsp">My
							Details</a> <a class="dropdown-item" id="signout" href="#">Sign
							Out</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<div class="mx-2alert alert-light" role="alert"
		style="background: #f3d250">
		<h1 class="text-center" style="color: black">MARVEL</h1>
	</div>

	<script>
        const name = `<%=session.getAttribute("user")%>
		`;
		let uname = document.getElementById('uname');
		let welcome = "Welcome " + name;
		uname.innerHTML += welcome;
		if (sessionStorage.getItem('user') === null) {
			window.location = 'login.jsp';
		}

		//functionality for signout
		let signout = document.getElementById('signout');
		signout.addEventListener('click', signoutClickHandler)
		function signoutClickHandler() {
			sessionStorage.clear();

			// Instantiate an xhr object
			let xhr = new XMLHttpRequest();

			// USE THIS FOR POST REQUEST
			xhr.open('GET', 'LogoutServlet', true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// What to do when response is ready
			xhr.onload = function() {
				if (this.status === 200) {
					window.location = 'login.jsp';
				} else {
					alert("Some Error Occured");
				}
			}

			// send the request
			xhr.send();
		}

		//functionality of mydetails button
		let myDetails = document.getElementById('opt-atag');
		myDetails.addEventListener('click', myDetailsClickHandler)
		function myDetailsClickHandler() {
			// Instantiate an xhr object
			let xhr = new XMLHttpRequest();

			// USE THIS FOR POST REQUEST
			xhr.open('GET', 'EditServlet', true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// What to do when response is ready
			xhr.onload = function() {
				if (this.status === 200) {
					if (this.responseText === "1") {
						window.location = "edit.jsp"
					} else {
						window.location = "myDetails.jsp";
					}

				} else {
					alert("Some Error Occured");
				}
			}

			// send the request
			xhr.send();
		}
	</script>
	
	<script type="text/javascript">
		const bell = document.getElementById("notification-bell");
		const newNotification = document.getElementById("notification");
		
		bell.addEventListener('click', ()=>{
			const display = newNotification.style.display=='block'?'none':'block';
			newNotification.style.display=display
		})
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

</body>
</html>
