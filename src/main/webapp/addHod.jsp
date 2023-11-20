<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.form-main {
	background-color: white;
	align-items: center;
	justify-content: center;
	gap: 2rem;
	flex-wrap: wrap;
	width: 90%;
	margin: 0 auto;
}

.width-half {
	width: 45%;
}

.form-element {
	font-weight: bold;
	font-size: 1.25rem;
}
</style>
</head>
<body>
	<%@ include file="nav.jsp"%>
	<%@page import="java.util.*,ProjMyDetails.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="add-hod-form">
		<h2 class="text-center bg-info p-3">Add Head Of Department</h2>
		<form class="d-flex form-main rounded p-5">
			<div class="width-half form-element">
				<label class="m-2" for="dept">Select Department :</label> <input
					id="dept" name="department" class="d-none" type="text" />
				<!-- Example split danger button -->
				<div class="btn-group">
					<button id="department-btn" type="button" class="btn btn-primary">Select
						Department</button>
					<button type="button"
						class="btn btn-primary dropdown-toggle dropdown-toggle-split"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="sr-only">Toggle Dropdown</span>
					</button>
					<div class="dropdown-menu">
						<a onClick="setDepartment('Information Technology')" class="dropdown-item" href="#">Information Technology</a> 
						<a onClick="setDepartment('Computer Science and Engineering')" class="dropdown-item" href="#">Computer Science and Engineering</a> 
						<a onClick="setDepartment('Electrical Engineering')" class="dropdown-item" href="#">Electrical Engineering</a>
					</div>
				</div>
			</div>

			<div class="width-half form-element">
				<label class="m-2" for="fac">Select Faculty :</label> <input
					id="faculty" name="faculty" class="d-none" type="text" />
				<div class="btn-group">
					<button id="faculty-btn" type="button" class="btn btn-primary">Select
						Faculty</button>
					<button type="button"
						class="btn btn-primary dropdown-toggle dropdown-toggle-split"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<span class="sr-only">Toggle Dropdown</span>
					</button>
					<div class="dropdown-menu" id="faculty-list">
					</div>
				</div>
			</div>
			

			<button type="button" onClick="handleHodSubmit()" class="btn btn-success py-3 px-5">Promote to HOD</button>
		</form>
	</div>
	
	
	<script>
		const departmentBtn = document.getElementById('department-btn')
		const facultyBtn = document.getElementById('faculty-btn')
		const dept = document.getElementById('dept')
		const faculty = document.getElementById('faculty')	
		var response;
		const setDepartment = (deprt)=>{
			//console.log(dept)
			departmentBtn.textContent = deprt;
			response = ['Faculty 1','Faculty 2','Faculty 3','Faculty 4','Faculty 5']
			dept.value = deprt;
			const div = document.getElementById('faculty-list')
			for(var i=0; i<response.length;i++){
				const a = document.createElement('a');
				console.log(response[i])
				a.classList.add('dropdown-item')
				a.innerText = response[i];
				a.setAttribute('href','#')
				a.id=i
				console.log(i)
				a.addEventListener('click',	()=>setFaculty(a.id)	)
				div.appendChild(a)
			}
		}
		
		const setFaculty = (fac)=>{
			console.log(fac)
			facultyBtn.textContent = response[fac]
			
			
			faculty.value = response[fac]
		}
		
		function handleHodSubmit(e){
			//e.preventDefault()
			console.log('submitted')
			console.log(dept.value)
			console.log(faculty.value)
		}
	</script>

</body>
</html>