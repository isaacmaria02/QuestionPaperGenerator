<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"   import="java.util.ArrayList,com.model.Registration"%>
	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<%

response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

if(session!=null)
{
	if(session.getAttribute("isLoggedIn")==null)
	{
		
		response.sendRedirect("index.jsp");
	}
}


%>

	
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="css\table.css">



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


table,th,tr,td{
border: 1px solid black;
}
</style>
</head>
<body>

<form action="LogoutServlet" method="post">

<input type="submit" class="btn btn-primary btn-lg" value="Log Out">
</form>


	<!-- Header -->
	<header class="w3-container w3-theme w3-padding" id="myHeader">
		<div class="w3-center">
			<img src="asset\lti.jpg" height="10%" width="10%"><br>
			<h2 class="w3-xxxlarge w3-animate-bottom">ADMIN PANEL</h2>



			<span class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id02').style.display='block'"
					style="font-weight: 900; padding: 100px;">Add Teacher</button>
			</span> 
			<span class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id01').style.display='block'"
					style="font-weight: 900; padding: 100px;">Remove Teacher</button>
			</span>
         <br><br>
			<span class="w3-padding-32">
				<button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					onclick="document.getElementById('id03').style.display='block'"
					style="font-weight: 900; padding: 100px;">Display Details</button>
			</span>
			
						<span class="w3-padding-32">
							<a class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey"
					  href="AddQuestions.jsp"
					style="font-weight: 900; padding: 100px;">Add Questions</a>
				
			</span>


		</div>
	</header>


	
	<!-- Modal -->
	<div id="id03" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top"
			style="margin: 0 auto; background-color: lightblue;">
			<header class="w3-container w3-theme-l1">
				<span onclick="document.getElementById('id03').style.display='none'"
					class="w3-button w3-display-topright">×</span>
				<h4>Display Details</h4>

			</header>
			<div class="w3-padding">
                    




<h2>Teacher Details</h2>


<form action="DisplayServlet" method="post">

<input type="submit" value="Display">
</form>


<%

	
	

	if(session.getAttribute("display") != null)
	{
		%><script>document.getElementById('id03').style.display='block';</script>
		<%
		
		
		%>
	<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">
	
    	<table style="width:100%;"" id="myTable">
      <th>Teacher ID</th>
      <th>First Name</th>
       <th>Last Name</th>
      <th>User Name</th>
       <th>Gender</th>
      <th>Email</th>
      <th>Phone</th>
      <c:forEach items="${display}" var="current">
        <tr>
          <td><c:out value="${current.getTid()}"/></td>
          <td><c:out value="${current.getFname()}"/></td>
          <td><c:out value="${current.getLname()}"/></td>
          <td><c:out value="${current.getUser()}"/></td>
          <td><c:out value="${current.getGender()}"/></td>
          <td><c:out value="${current.getEmail()}"/></td>
          <td><c:out value="${current.getPhone()}"/></td>    
          
        </tr>
      </c:forEach>
    </table>
    
    
        <%
        
        session.removeAttribute("display");
	}
	
	



%>


<!--
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

<table id="myTable">
  <tr class="header">
    <th style="width:60%;">Name</th>
    <th style="width:40%;">Country</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Berglunds snabbkop</td>
    <td>Sweden</td>
  </tr>
  <tr>
    <td>Island Trading</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Koniglich Essen</td>
    <td>Germany</td>
  </tr>
  <tr>
    <td>Laughing Bacchus Winecellars</td>
    <td>Canada</td>
  </tr>
  <tr>
    <td>Magazzini Alimentari Riuniti</td>
    <td>Italy</td>
  </tr>
  <tr>
    <td>North/South</td>
    <td>UK</td>
  </tr>
  <tr>
    <td>Paris specialites</td>
    <td>France</td>
  </tr>
</table>  -->


<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script> 








			</div>

		</div>
	</div>


	
	
	


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


				<form action="DeleteServlet" method="post">

					<div class="container border border-dark">






						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class='fas fa-user'></i> Please enter
									the Teacher ID :
								</label>
							</div>
							<div class="col-sm">
								<input autocomplete="off" name="tid" type="number" value=""
									required>
							</div>

						</div>

						<br>

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
				<h4>Teacher's Details</h4>

			</header>
			<div class="w3-padding">


				<form action="RegistrationServlet" method="post">

					<div class="container border border-dark">


						<div class="row">
							<div class="col-sm">
								<label for="reg">Teacher ID :</label>
							</div>
							<div class="col-sm">
								<input name="tid" type="number" size="30" required>
							</div>

						</div>

						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class='fas fa-user'></i> First Name :
								</label>
							</div>
							<div class="col-sm">
								<input name="fname" type="text" value="" size="30" required>
							</div>

						</div>

						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class='fas fa-user'></i> Last Name :
								</label>
							</div>
							<div class="col-sm">
								<input name="lname" type="text" value="" size="30" required>
							</div>

						</div>


						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class='fas fa-user'></i> Username :
								</label>
							</div>
							<div class="col-sm">
								<input name="user" type="text" value="" size="30" required>
							</div>

						</div>


						<div class="row">
							<div class="col-sm">
								<label for="reg"><i class='fas fa-key'></i> Password :</label>
							</div>
							<div class="col-sm">
								<input name="pass" type="password" value="" size="30" required>
							</div>

						</div>

						<div class="row">
							<div class="col-sm">
								<label for="reg"><i class="fas fa-venus-mars"></i>
									Gender :</label>
							</div>
							<div class="col-sm">

								<input type="radio" name="gender" value="male"> Male <input
									type="radio" name="gender" value="female"> Female

							</div>

						</div>






						<div class="row">
							<div class="col-sm">
								<label for="reg"> </span> <span
									class="glyphicon glyphicon-envelope"></span> Email :
								</label>
							</div>
							<div class="col-sm">
								<input type="email" name="email" size="30" required>
							</div>

						</div>

						<div class="row">
							<div class="col-sm">
								<label for="reg"><i class="fa fa-phone"
									aria-hidden="true"></i> Phone :</label>
							</div>
							<div class="col-sm">
								<input name="phone" pattern="[789][0-9]{9}" type="text" value=""
									size="30" required>
							</div>

						</div>

						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class="fa fa-question-circle"
									aria-hidden="true"></i> Question :
								</label>
							</div>
							<div class="col-sm">
								<input name="quest" type="text" value="" size="30" required>
							</div>

						</div>

						<div class="row">
							<div class="col-sm">
								<label for="u"> <i class="fal fa-caret-right"></i>
									Answer :
								</label>
							</div>
							<div class="col-sm">
								<input name="answer" type="text" value="" size="30" required>
							</div>

						</div>
						<br>
						<div class="row w-100 p-3">
							<input margin-left: auto; margin-right: auto;" type="submit"
								class="btn btn-primary btn-lg" value="Submit">
						</div>








					</div>
				</form>

			</div>

		</div>
	</div>






</body>
</html>

<%



%>
