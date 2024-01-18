<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <title>Admin | MARVEL</title>
    <style>
      body {
        font-family: "Inter", sans-serif;
      }
      .new-notification{
      	color:white;
      	font-weight:bold;
      	display:block;
      	background:green;
      	width:98%;
      	margin:auto;
      	border-radius:5px;
      	padding:0.5rem;
      }
      .new-notification:hover{
      	color:white;
      }
    </style>
  </head>

  <body>
    <%@page import="java.util.*,ProjMyDetails.*"%> <% myDetailsDaw mdw = new
    myDetailsDaw(); String user = (String) session.getAttribute("user");
    MyDetailsData userInfo = mdw.getAllInfo(user); %>
    <%
	myDetailsDaw rg = new myDetailsDaw();
	ArrayList<String> arr = rg.getTempUsers();
	//System.out.println(arr.get(0));
	%>
    <div style="height: 80vh; display: flex; justify-content: space-evenly">
      <div
        class="dashboard"
        style="
          width: 70%;
          background-color: #f2f2f2;
          border-radius: 10px;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        "
      >
        <h5
          class="card-header text-center"
          style="background: #f78888; border-radius: 10px 10px 0 0"
        >
          Welcome to Dashboard
        </h5>
        <div class="d-flex flex-wrap justify-content-between p-5">
          <div class="other areas">
            <a onClick="{handleAddHOD()}" style="cursor: pointer"> ADD HOD </a>
          </div>
        </div>
      </div>
      <div
        id="notification-panel"
        style="
          width: 25%;
          min-height: 400px;
          background-color: #c1d5dd;
          border-radius: 8px;
          padding:1rem;
        "
      >
        <h4 class="text-center py-3" id='notification'>Notifications</h4>
        
      </div>
    </div>
    <script>
      const handleAddHOD = () => {
        console.log("clicked");
        window.location = "addHod.jsp";
      };
      var len =`<%=arr%>`
  		var size = len.length-1
  		if(size<10){
  			console.log("empty")
  		}else{
  			const notification = document.getElementById('notification-panel');
  			const a = document.createElement('a');
  			a.innerHTML = `<a href="Hod_act.jsp" class="new-notification">
  	        	New Signup request!
  		        </a>`
  		    notification.appendChild(a);
  		}
      
      
    </script>
  </body>
</html>
