<head>
<style>
.out {
	width: 95%;
	margin: auto;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: center;
}

.last_div {
	padding: 2rem;
	height: auto;
	width: 45%;
	background: #5da2d5;
	color: white;
	font-weight: bold;
	border-radius: 8px;
	display: flex;
	gap: 1rem;
	margin: 1rem;
	align-items: center;
	justify-content: center;
}

.listItem {
	display: block;
}

.accept {
	background: green;
	color: white;
	font-size: 1.15rem;
	font-weight: bold;
	padding: 0.5rem;
	text-align: center;
	border: none;
	border-radius: 8px;
}

.reject {
	background: red;
	color: white;
	font-size: 1.15rem;
	font-weight: bold;
	padding: 0.5rem;
	text-align: center;
	border: none;
	border-radius: 8px;
}
</style>
</head>


<body>
	<%@page import="java.util.*,ProjMyDetails.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%@ include file="nav.jsp"%>
	<%
	myDetailsDaw rg = new myDetailsDaw();
	ArrayList<String> arr = rg.getTempUsers();
	ArrayList<String> arr1 = rg.getRoles();
	//System.out.println(arr.get(0));
	%>

	<div class="out" id='out'></div>


	<script>
	const acceptRequest = (e)=>{
		console.log(e.target.id);
		
		const xhr = new XMLHttpRequest();

		// USE THIS FOR POST REQUEST
		xhr.open('POST', 'TempRegisterServlet', true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		// What to do when response is ready
		xhr.onload = function() {
			console.log(params);
		}
		var n = e.target.id.substring(2);
		var p = "1"
		// send the request
		params = "name=" + n + "&action=" + p;

		xhr.send(params);

	}
	
	const rejectRequest = (e)=>{
		console.log(e.target.id);
		const xhr = new XMLHttpRequest();

		// USE THIS FOR POST REQUEST
		xhr.open('POST', 'TempRegisterServlet', true);
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");

		// What to do when response is ready
		xhr.onload = function() {
			console.log(params);
		}
		var n = e.target.id;
		n=n.substring(2);
		var p = "0"
		// send the request
		params = "name=" + n + "&action=" + p;

		xhr.send(params);
	}
		const div = document.getElementById('out')
		var len = `<%=arr%>`
		var roleList = `<%=arr1%>`
		
		console.log(len)
		var size = len.length-1
		var roleSize = roleList.length-1
		if(size<10){
			console.log("empty")
		}else{
			
		len=len.substring(1,size)
		len=len.split(',');
		roleList=roleList.substring(1,roleSize)
		roleList=roleList.split(',');
		
		len.forEach(det=>{
			console.log(det)
			var details = det.trim().split(';');
			const newDiv = document.createElement('div')
			newDiv.classList.add('last_div')
			//console.log(details[0]+" "+details[1]+" "+details[2]+" "+details[3] )
			const p1 = document.createElement('p');
			const p2 = document.createElement('p');
			const p3 = document.createElement('p');
			const accept = document.createElement('button')
			const reject = document.createElement('button')
			
			accept.id = 'a_'+details[0];
			reject.id = 'r_'+details[0];
			accept.innerText = 'ACCEPT';
			reject.innerText = 'REJECT';
			accept.classList.add('accept')
			reject.classList.add('reject')
			accept.addEventListener('click',acceptRequest);
			reject.addEventListener('click',rejectRequest);
			p1.classList.add('listItem')
			p2.classList.add('listItem')
			p3.classList.add('listItem')
			
			p1.innerText = details[0]
			p2.innerText = roleList[details[2]].split(';')[1]
			p3.innerText = details[3]
			
			newDiv.appendChild(p1)
			newDiv.appendChild(p2)
			newDiv.appendChild(p3)
			newDiv.appendChild(accept)
			newDiv.appendChild(reject)
			
			div.appendChild(newDiv);
		})
		}
		
		
	
	</script>
</body>