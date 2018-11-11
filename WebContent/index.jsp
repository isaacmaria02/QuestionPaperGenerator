<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Question Paper Generator</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">




<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'
	integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns'
	crossorigin='anonymous'>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style>
body {
	background-color: black;
}
</style>
</head>
<body>



	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">
		<div class="w3-center">
			<img src="asset\lti.jpg" height="10%" width="10%"><br>
			<h2 class="w3-xxxlarge w3-animate-bottom">QUESTION PAPER
				GENERATOR</h2>
			<span class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id01').style.display='block'"
					style="font-weight: 900; padding: 100px;">Admin Login</button>
			</span> <span class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id02').style.display='block'"
					style="font-weight: 900; padding: 100px;">Teacher Login</button>
			</span>
		</div>
	</header>




	<!-- Modal -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top"
			style="margin: 0 auto; background-color: lightblue;">
			<header class="w3-container w3-theme-l1">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="w3-button w3-display-topright">×</span>
				<h4>Admin Login</h4>

			</header>
			<div class="w3-padding">


				<form action="LoginServlet">

					<div class="container border border-dark">






						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class='fas fa-user'></i> Username:
								</label>
							</div>
							<div class="col-sm">
								<input autocomplete="off" name="user" type="text" value=""
									required>
							</div>

						</div>


						<div class="row">
							<div class="col-sm">
								<label for="reg"><i class='fas fa-key'></i> Password :</label>
							</div>
							<div class="col-sm">
								<input name="pass" type="password" value="" required>
							</div>

						</div>


						<input type="hidden" name="type" value="admin"> <a
							href="ForgotPassword.jsp">Forgot Password?</a> <br>


						<div class="row w-100 p-3">
							<input style="margin-left: auto; margin-right: auto;"
								type="submit" class="btn btn-primary btn-lg" value="Submit">
						</div>

					</div>

				</form>
			</div>

		</div>
	</div>


    

	<!-- Modal -->
	<div id="id02" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top"
			style="margin: 0 auto; background-color: lightblue;">
			<header class="w3-container w3-theme-l1">
				<span onclick="document.getElementById('id02').style.display='none'"
					class="w3-button w3-display-topright">×</span>
				<h4>Teacher Login</h4>

			</header>
			<div class="w3-padding">


				<form action="LoginServlet">

					<div class="container border border-dark">






						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class='fas fa-user'></i> Username:
								</label>
							</div>
							<div class="col-sm">
								<input autocomplete="off" name="user" type="text" value=""
									required>
							</div>

						</div>


						<div class="row">
							<div class="col-sm">
								<label for="reg"><i class='fas fa-key'></i> Password :</label>
							</div>
							<div class="col-sm">
								<input name="pass" type="password" value="" required>
							</div>

						</div>

						<input type="hidden" name="type" value="teacher"> <a
							href="ForgotPassword.jsp">Forgot Password?</a> <br>


						<div class="row w-100 p-3">
							<input style="margin-left: auto; margin-right: auto;"
								type="submit" class="btn btn-primary btn-lg" value="Submit">
						</div>

					</div>
				</form>

			</div>

		</div>
	</div>





</body>
</html>
