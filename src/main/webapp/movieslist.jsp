<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>Seat Booking</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    img {
        width: 20px;
        height: 45vh;
        transition: all 0.5s linear 0s;
    }

    img:hover {
        transform: scale(1.1);
    }

    .card {
        overflow: hidden;
    }
</style>

<body>
    <%
    String successMessage = request.getParameter("successMessage");
    if (successMessage != null) {
    %>
        <div class="alert alert-success"><%= successMessage %></div>
    <%
    }
    %>

    <header class="bg-primary text-white p-3 d-flex justify-content-between align-items-center">
        <h1 class="m-0">Movie Selector</h1>
        <nav class="d-flex align-items-center">
            <a href="#" class="text-white ml-3">Movies</a>
            <a href="#" class="text-white ml-3">Events</a>
            <a href="#" class="text-white ml-3">Plays</a>
            <div class="ml-3" id="userdetails-container">
                <!-- Username will be displayed here if sessionStorage has a username -->
                <h1 id="userdetails"></h1>
                <button class="btn btn-light text-black font-weight-bold mr-2" id="login-btn" onclick="login()">Login</button>
                <button class="btn btn-light text-black font-weight-bold" id="signup-btn" onclick="signup()">Signup</button>
            </div>
        </nav>
    </header>

    <div class="container my-4">
        <div class="row">
            <% 
            ResultSet rs = (ResultSet) session.getAttribute("resultset"); 
            if (rs != null) { 
                while (rs.next()) { 
                    String name = rs.getString("Mname"); 
                    String desc = rs.getString("description");
                    String url = rs.getString("url");
                    String mrating = rs.getString("Mrating");
            %>
                <div class="col-md-3 mb-4">
                    <div class="card h-100">
                        <img src="<%= url %>" class="card-img-top" alt="Movie One Poster">
                        <div class="card-body">
                            <h5 class="card-title">
                                <%= name %>
                            </h5>
                            <p class="card-text"><%= desc %></p>
                        </div>
                        <div class="card-footer d-flex justify-content-between align-items-center">
                            <!-- Form for POST request -->
                            <form action="book" method="POST" style="margin: 0;">
                                <input type="hidden" name="movieName" value="<%= name %>">
                                <button type="submit" class="book-button btn btn-primary">Book Tickets</button>
                            </form>
                            <span style="margin-left: auto"><%= mrating %></span>
                        </div>
                    </div>
                </div>
            <% 
                } 
            } else { 
                out.println("<p>No movies found.</p>");
            }
            %>
        </div>
    </div>

    <script>
        window.onload = function() {
            var username = sessionStorage.getItem("username");
            var userdetailsContainer = document.getElementById("userdetails-container");
            var userdetails = document.getElementById("userdetails");
            var loginBtn = document.getElementById("login-btn");
            var signupBtn = document.getElementById("signup-btn");

            if (username) {
                // If username exists in sessionStorage, display it
                userdetails.textContent = username;

                // Hide login/signup buttons
                loginBtn.style.display = "none";
                signupBtn.style.display = "none";
            } else {
                // If no username in sessionStorage, show login/signup buttons
                userdetails.textContent = "";
                loginBtn.style.display = "inline-block";
                signupBtn.style.display = "inline-block";
            }
        }

        function login() {
            // Add your login logic here
            alert("Login clicked!");
        }

        function signup() {
            // Add your signup logic here
            alert("Signup clicked!");
        }
    </script>

</body>

</html>
