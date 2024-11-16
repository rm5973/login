
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
   <%
   String name=(String)session.getAttribute("user");
   %>
   
    <h1 > welcome to the home page <%= name%></h1>
    <a href="aboutus.jsp">about us</a>
    <a href="profile.jsp">profile</a>


</body>
</html>