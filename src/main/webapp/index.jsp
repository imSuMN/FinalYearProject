<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TINT Digital Resource Library</title>
<style>
  
</style>
</head>
<body>
	<%@ include file="nav.jsp" %>
	<%@page
		import="java.util.*,ProjMyDetails.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ include file="admin.jsp" %>
	<%
	myDetailsDaw indexMdw = new myDetailsDaw();
	String indexUsers = (String) session.getAttribute("user");
	MyDetailsData indexUsersInfo = mdw.getAllInfo(indexUsers);
	%>
	<!-- <p class="text-center">welcome to home page</p> -->
<!-- 	  -->
  <script>
  //var edit="";
  //const sub=document.querySelector("#cb");
  //if(edit==null){
	//  function hideElement() {
		//  sub.style.display = "none";
		//}
  //}
  var edit = `<%= indexUsersInfo.getSubject() %>`;
	edit = (edit === "null") ? "Department:" : "Department: " + edit;

	// Now, you can set the card title with the updated value
	//const cardTitlesub = document.querySelector(".subject");
	//cardTitlesub.textContent = edit;
	
var edit2=`<%= indexUsersInfo.getTcsionId()%>`
   edit2= (edit2 ==="null") ? "Tcsion:" : "Tcsion: "+edit2;
   //const cardTitleion=document.querySelector(".tcs");
   //cardTitleion.textContent = edit2;
  </script>
</body>
</html>
