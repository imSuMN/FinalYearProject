<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<Link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>Login</title>
</head>
<style>
.left {
	background-color: #ececec;
	font-size: 2.5rem;
	display: flex;
	flex-direction: column;
	height: 100vh;
	/* Cover the entire viewport height */
}

/*.welc{
    	padding-left: 15px;
    	padding-top: -5px;
    	font-size: 2rem;
    	
    }*/
.marvel {
	padding-top: 90px;
	font-size: 4rem;
	color: #162f65;
}

.elem {
	padding-left: 20px;
}

#element {
	color: #5da2d5;
}

/*.right {
        display: flex;
    	background-color: #5da2d5;
    	flex-direction: column;
    	justify-content: center;
    	align-items: center;
    	height: 100vh;
    	/* Cover the entire viewport height */

/*.error-text {
        margin: 0px 0px 15px 100px;
        background: #fffff;
        color: #fceae8;
        font-size: 15px;
        padding: 8px;
        border-radius: 5px;
        width: 200px;
        text-align: center;
        display: none;
        max-width: 300px; /* Set a maximum width for the error message */
/*word-wrap: break-word;  Allow words to be wrapped if they don't fit 
    }*/
.error-pass {
	margin: -10px 0px 15px 105px;
	background: #e74c3c;
	color: #fceae8;
	font-size: 10px;
	padding: 8px;
	border-radius: 4px;
	width: 200px;
	text-align: center;
	display: none;
	max-width: 200px;
	/* Set a maximum width for the error message */
	word-wrap: break-word;
} /* Allow words to be wrapped if they don't fit */

/*.icon{
    	width: 15px;
    	height: 15px;
   
    }*/
#form-box {
	width: 90%;
	background: #fff;
	padding: 1.5rem;
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.right {
	display: flex;
	align-items: center;
	justify-content: center;
}

.form-box h1 {
	font-size: 30px;
	margin-bottom: 60px;
	color: #3c00a0;
	position: relative;
}

.form-box h1::after {
	content: '';
	width: 30px;
	height: 4px;
	border-radius: 3px;
	background: #3c00a0;
	position: absolute;
	bottom: -12px;
	left: 50%;
	transform: translateX(-50%);
}

.input-field {
	background: #eaeaea;
	margin: 15px 0;
	border-radius: 3px;
	display: flex;
	align-items: center;
	max-height: 65px;
	transition: max-height 0.5s;
	overflow: hidden;
	width: 100%;
}

input {
	width: 100%;
	background: transparent;
	border: 0;
	outline: 0;
	padding: 18px 15px;
}

.input-field i {
	margin-left: 15px;
	color: #999;
}

form p {
	text-align: left;
	font-size: 13px;
}

form p a {
	text-decoration: none;
	color: #3c00a0;
}

.btn-field {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin: 1.5rem;
}

.btn-field button {
	flex-basis: 48%;
	background: #3c00a0;
	color: #fff;
	height: 40px;
	border-radius: 20px;
	border: 0;
	outline: 0;
	cursor: pointer;
	transition: background 1s;
}


.btn-field button.disable {
	background: #eaeaea;
	color: #555;
}
</style>

<body>
	<div class="container-fluid">
		<div class="row">
			<!-- Left Container -->
			<div class="col-md-7 left">

				<div class="header">
					<p class="align-top">
						<img src="./collegelogo.png"
							style="width: 45px; height: 45px;">
					</p>

					<h1 class="marvel align-left p-3">MARVEL</h1>
				</div>
				<div class="elem">
					<span id="element"></span>
				</div>

			</div>
			<!-- Right Container -->
			<!--  <div class="col-md-5 right">

                <div class="p-4 d-flex flex-column justify-content-center align-items-center" style="height: 100%;">

                    <form>
                        <div style="text-align: left; margin-top:30px">
                            <div class="mb-5 row">

                                <label for="inputEmail" class="col-sm-3 col-form-label" style="color: #fff;"> <b>
                                        <h4>Email</h4></b></label>
                                <div class="col-sm-11">
                                    <input onkeyup="check()" type="text" name="txtName" class="form-control"
                                        id="inputEmail" style="background-color: #fff;max-width: 300px" required>
                                
                                <div class="error-text text-danger p-2" style="display:none">please enter valid Email Address</div>
								</div>
                            </div>

                            <!--div class="error-text">please enter valid Email Address</div-->
			<!--   <div class="mb-5 row">
                                <label for="inputPassword" class="col-sm-3 col-form-label" style="color: #fff; display: flex; align-items: center;">
    									<b><h4>Password</h4></b>
								</label>
							
                                <div class="col-sm-11">
                                    <input onkeyup="check1()" type="password" name="txtPwd" class="form-control"
                                        id="inputPassword" maxlength="16"
                                        style="background-color: #fff;max-width: 300px" required>
                                        <br>
                                        <div class="error-pass">Must contain at least one number and one uppercase and one lowercase letter,
                                and at least 8 or at most 16 characters and must not contain any special character</div>
                                </div>
                            </div>
                            <!--div class="error-pass">Must contain at least one number and one uppercase and one lowercase
                                letter,
                                and at least 8 or at most 16 characters and must not contain any special character</div-->
			<!-- <div class="error-text">please enter valid Email Address</div> -->
			<!--   <div class="account" id="result" style="width: 100%; display: none; text-align: center; padding: 10px;">

                                <!--svg xmlns="http://www.w3.org/2000/svg">
                                    <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
                                        <path
                                            d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
                                    </symbol>
                                </svg-->
			<!-- <div class="alert alert-primary d-flex align-items-center" role="alert"
                                    style="padding: 5px 10px; margin: 10px 0;">
                                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
                                        aria-label="Info:">
                                        <use xlink:href="#info-fill" />
                                    </svg>
                                    <div>
                                        You have no Account.... Do you want to create....
                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end"
                                            style="height: 36px;width: 74px;margin-left: 120px;">
                                            <table>
                                                <tr>
                                                    <td><input type=button id=yes value=YES></td>
                                                    <td><input type=button id=no value=NO></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="d-flex  col-4 justify-content-start" style="margin-top: 60px;">
                                <button class="btn btn-primary" type="button" id="login"
                                    value="login"><b>Signup/Login</b></button>
                                    
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>-->
			<div class="col-md-5 right">
				<div class="form-box" id="form-box">
					<!-- 	<h1 id="title">Sign Up</h1> -->
					<div class="btn-field">
						<button type="button" id="signupBtn" class="disable">Register</button>
						<button type="button" id="signinBtn">Login</button>

					</div>
					<form>
						<div class="input-group">
							<div class="input-field">
								<i class="fa-solid fa-envelope"></i> <input onkeyup="check()"
									type="text" name="txtName" placeholder="Email" id="inputEmail"
									required>
							</div>
							<div class="input-field" id='role'>
								<i class="fa-solid fa-envelope"></i> <input
									type="text" name="txtName" placeholder="Role" id="inputRole"
									required>
							</div>
							<div class="input-field" id='department'>
								<i class="fa-solid fa-envelope"></i> <input
									type="text" name="txtName" placeholder="Department" id="inputDepartment"
									required>
							</div>
							<div class="input-field" >
								<i class="fa-solid fa-lock"></i> <input onkeyup="check1()"
									type="password" name="txtPwd" id="inputPassword" maxlength="16"
									placeholder="Password" required> <br>
								<div class="error-pass">Must contain at least one number
									and one upper-case and one lower-case letter, and at least 8 or
									at most 16 characters and must not contain any special
									character</div>

							</div>
							
							<div class="input-field" id='confirm-pass'>
								<i class="fa-solid fa-lock"></i> <input onkeyup="check1()"
									type="password" name="txtPwd" id="inputConfirmPassword" maxlength="16"
									placeholder="Confirm Password" required>
							</div>

						</div>
						<div class="">
							<button type="button" id="submit-signup"
								style="width: 100%; margin: auto;" class="btn btn-info">Send Request</button>
							<button type="button" id="submit-signin"
								style="width: 100%; display: none; margin: auto;" class="btn btn-info">Login</button>

						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		let signupBtn = document.getElementById("signupBtn");
		let signinBtn = document.getElementById("signinBtn");
		let submitsignup = document.getElementById("submit-signup");
		let submitsignin = document.getElementById("submit-signin");
		const roles = document.getElementById("role");
		const department = document.getElementById("department");
		const confirmPass = document.getElementById("confirm-pass");
		signinBtn.onclick = function() {
			submitsignup.style.display = "none";
			submitsignin.style.display = "block";
			signupBtn.classList.remove("disable");
			signinBtn.classList.add("disable");
			roles.style.display = 'none';
			department.style.display = 'none';
			confirmPass.style.display = 'none';

		}
		signupBtn.onclick = function() {

			submitsignup.style.display = "block";
			submitsignin.style.display = "none";
			signupBtn.classList.add("disable");
			signinBtn.classList.remove("disable");
			roles.style.display = 'flex';
			department.style.display = 'flex';
			confirmPass.style.display = 'flex';

		}
	</script>


	<script src="https://unpkg.com/typed.js@2.0.16/dist/typed.umd.js"></script>

	<script type="text/javascript">
		var typed = new Typed('#element', {
			strings : [ '  Multimedia Academic Resource', '&amp;',
					' Virtual Exchange for Learning' ],
			typeSpeed : 90,
			loop : true,
		});

		var n = "nothing";
		var p = "nothing";
		var role = '';
		var dept = ''

		let login = document.getElementById('submit-signin');
		login.addEventListener('click', buttonClickHandler)

		function buttonClickHandler() {
			console.log('You have clicked the fetchBtn');

			// Instantiate an xhr object
			const xhr = new XMLHttpRequest();

			// USE THIS FOR POST REQUEST
			xhr.open('POST', 'LoginServlet', true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// What to do when response is ready
			xhr.onload = function() {
				if (this.status === 200) {
					if (this.responseText === "1") {
						console.log("successful");
						sessionStorage.setItem('user', "1");
						window.location = 'index.jsp';
					} else if (this.responseText === "-1") {
						console.log("does not exist");
						document.getElementById('result').style.display = 'block';
						document.getElementById('login').style.display = 'none';
					} else {
						console.log("failed")
						alert("Wrong password");
						window.location = 'login.jsp';
					}
				} else {
					console.log("Some error occured");
				}
			}

			// send the request
			n = document.getElementById("inputEmail").value;
			p = document.getElementById("inputPassword").value;
			

			params = "name=" + n + "&pwd=" + p;

			xhr.send(params);
		}
		
		submitsignup.addEventListener('click',registerRequestHandler)
		function registerRequestHandler(){
			console.log("request sent")
			n = document.getElementById("inputEmail").value;
			p = document.getElementById("inputPassword").value;
			role = document.getElementById("inputRole").value;
			dept = document.getElementById("inputDepartment").value;
			//const data = new URLSearchParams();
			//data.append('uname', n);
			//data.append('pwd', p);
			//data.append('role',role);
			//data.append('dept',dept);
			//fetch('RegisterTemp',{
				//method:'POST',
				//header:{"Content-type":"application/x-www-form-urlencoded"},
				//body : data
			//}).then(result=> console.log(result))
			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'RegisterTemp', true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			params = "name=" + n + "&pwd=" + p+"&role="+role+"&dept="+dept;

			xhr.send(params);
		}

		//let yes = document.getElementById('yes');
		//yes.addEventListener('click', yesClickHandler)

		function yesClickHandler() {
			// Instantiate an xhr object
			const xhr = new XMLHttpRequest();

			// USE THIS FOR POST REQUEST
			xhr.open('POST', 'Register', true);
			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");

			// What to do when response is ready
			xhr.onload = function() {
				consol.log(params);
				window.location = 'login.jsp';
			}

			// send the request
			params = "name=" + n + "&pwd=" + p;

			xhr.send(params);

			alert("Account created please login");
			window.location = 'login.jsp';
		}

		//let no = document.getElementById('no');
		//no.addEventListener('click', noClickHandler)

		function noClickHandler() {
			console.log("inside no")
			window.location = 'login.jsp';
		}
	</script>

	<script>
		const email = document.querySelector("#inputEmail");
		const error = document.querySelector(".error-text");
		const btn = document.querySelector("button");
		let regExp = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		function check() {
			if (email.value.match(regExp)) {
				email.style.borderColor = "#27ae60";
				error.style.display = "none";
				btn.style.display = "block";
			} else {
				email.style.borderColor = "#e74c3c";
				error.style.display = "block";
				btn.style.display = "none";

			}
			if (email.value == "") {
				email.style.borderColor = "rgb(32, 18, 93)";
				error.style.display = "none";
				btn.style.display = "block";
			}
		}

		const password = document.querySelector("#inputPassword");
		const error1 = document.querySelector(".error-pass");
		let regExp1 = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}/;
		function check1() {
			if (password.value.match(regExp1)) {
				password.style.borderColor = "#27ae60";
				error1.style.display = "none";
				//btn.style.display="block";
			} else {
				password.style.borderColor = "#e74c3c";
				error1.style.display = "block";
				//btn.style.display="none";

			}
			if (password.value == "") {
				password.style.borderColor = "rgb(32, 18, 93)";
				error1.style.display = "none";
				//btn.style.display="block";
			}
		}
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

