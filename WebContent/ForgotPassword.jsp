<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.4/angular.min.js"></script>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<script src="scripts\pwCheckDirective.js"></script>

<style>
.error {
		color: red;
	}
</style>
  
</head>

<body>

<div  id="enterEmail" class="container">
  <h2>Please enter your Email ID</h2>
  <form action="ForgotPasswordServlet">
    <div class="form-group">
      <label for="usr">Enter email:</label>
      <input id="emailval" type="email" class="form-control" name="email">
    </div>
  
    <div class="form-group">
      <input type="submit" class="form-control" value="Submit">
    </div>
  </form>
</div>


<%
if(session.getAttribute("isEmailCorrect") != null){

      if((boolean)session.getAttribute("isEmailCorrect")){  
	
	   %>
	   
	   <div id="qna"  class="container">
  <h2>Question Answer</h2>
  <form action="UpdatePasswordServlet">
   <div class="form-group">
      <label for="usr">Question :</label>
      <label for="usr"><%=session.getAttribute("question") %></label>
      
    </div>
  
  
    <div class="form-group">
      <label for="usr">Answer : </label>
      <input type="text" class="form-control" name="answer">
    </div>
  
    <div class="form-group">
      <input type="submit" class="btn btn-primary btn-lg" value="Submit">
    </div>
  </form>
</div>

		  	   <script>document.getElementById("enterEmail").style.display="none";</script>

	   
	   <%	
      }
	

}



if(session.getAttribute("isAnswerCorrect") != null)
{

	
	if((boolean)session.getAttribute("isAnswerCorrect"))
	{
		  %>
		  			  	   <script>document.getElementById("qna").style.display="none";</script>
		  
		   
	<div id="newpassword" ng-app="forbode" class="container">
	<H2>Reset Password</H2>
	<form onsubmit="return validate()" name="testForm" action="ChangePassword" ng-controller="testController">
				
	
		
		
		<label for="password">Set Password</label> 
		<input id="pw1" type="password" name="password"
			ng-model="password" placeholder="New Password" pw-check="confirmPassword"/> 
		<br/> 
		<br/> 
		<label for="confirmPassword">Confirm Password</label> 
		<input  id="pw2"  type="password" name="confirmPassword" placeholder="Confirm Password" ng-model="confirmPassword"/> 
		<br> 
		    <input type="hidden" name="email" value=<%=session.getAttribute("emailid") %>>
		
		<span class="error" ng-show="testForm.password.$error.pwmatch"> Passwords don't match. </span>
		<br>
		
		<input  type="submit"  value="submit">
	</form>
</div>


<script>
function validate() {
    
    
    
    if(document.getElementById("pw1").value != document.getElementById("pw2").value)
    	{
    	alert('Please enter same password');
    	return false;
    	}
    else
    	{
    	return true;
    	}
    
    
    return false;
    
}
</script>

		   
		   <%	
	}
}

%>








</body>
</html>