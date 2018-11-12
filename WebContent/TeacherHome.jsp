<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css' integrity='sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns' crossorigin='anonymous'>

  <link rel="stylesheet" href="registration.css">



<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 -->
<style>


img {
    border-radius: 50%;
  margin-left: auto;
    margin-right: auto;
}

 


</style>
 

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>


</head>
<body style="background-color:black;">

<form action="LogoutServlet" method="post">

<input type="submit" class="btn btn-primary btn-lg" value="Log Out">
</form>

<form action="DownloadQuestionPaperServlet" method="post">




<div  ng-app=""  class="container border border-dark w-100 p-3" style="background-color:lightblue;padding:50px;">



<h1>Download Question Paper</h1>


<div class="row">
    <div class="col-sm">
      <label for="u">Enter Title: </label>
    </div>
    <div class="col-sm">  
	<input type="text" name="title" required>
    </div>
   
  </div>
  
    <div class="row">
    <div class="col-sm">
      <label for="u">Category :  </label>
    </div>
    <div class="col-sm">  

 <select name="category">
    <option value="Java">Java</option>
    <option value="Testing">Testing</option>
    <option value="BIDW">BIDW</option>
  </select>
  <br>

    </div>
   
  </div>
  
  <div class="row">
    <div class="col-sm">
      <label for="u">Enter no of hours: </label>
    </div>
    <div class="col-sm">  
	<input type="number" name="hours" min=0 required>
    </div>
   
  </div>
  
    <div class="row">
    <div class="col-sm">
      <label for="u">Enter Difficulty: </label>
    </div>
    <div class="col-sm">  
	<input type="number" name="difficulty" min=1 max=5 required>
    </div>
   
  </div><br>
   
  <div class="row">
    <div class="col-sm">
      <label for="u">Enter no of questions: </label>
    </div>
    <div class="col-sm">  
	<input type="number" name="noofquestions" min=0 required>
    </div>
   
  </div>
  
  <br>

<div class="row w-100 p-3" >
<input style="width:80%;  margin-left: auto; margin-right: auto;" type="submit"  class = "btn btn-primary btn-lg" value="Submit"> 
  </div>
  </form>
  <br><br>
  
  <a href="download.jsp" class="btn btn-info">Click here to download Question Paper</a>  <br><br>
  
  <a href="downloadsolution.jsp" class="btn btn-info">Click here to download Solution</a>  
  
</div>








</body>
</html>

