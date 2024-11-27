<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tubelight Effect</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

  <style>
    /* General Reset */
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      width: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      background: #0d0d17; /* Dark background */
      font-family: 'Arial', sans-serif;
      overflow: hidden;
    }
  
    /* Full-page container */
    .tubelight-effect {
      position: relative;
      width: 60%;
      height: 100%;
      background: #0d0d17;
      text-align: center;
    }
  
    /* Tubelight effect bar at the top */
    .tubelight-effect:before {
      content: '';
      position: absolute;
      top: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80%;
      height: 30px;
      background: linear-gradient(90deg, rgba(138, 43, 226, 0.8), rgba(138, 43, 226, 0.3), rgba(138, 43, 226, 0.8));
      border-radius: 15px;
      box-shadow: 0px 0px 40px 15px rgba(138, 43, 226, 0.8);
      z-index: 2;
    }
  
    /* Main content */
    .content h1 {
      color: white;
      font-size: 3rem;
      text-shadow: 0px 4px 8px rgba(138, 43, 226, 0.8);
    }
  
    /* Seat grid */
    .seat-grid {
      display: grid;
      grid-template-columns: repeat(8, 1fr);
      gap: 10px;
      margin-top: 90px;
      justify-items: center;
    }
  
    .seat {
      text-align: center;
      position: relative;
      width: 80px;
      height: 100px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;
    }
  
    .seat.available {
      color: #8a2be2;
    }
  
    .seat.unavailable {
      color: red;
      cursor: not-allowed;
    }
  
    .seat i {
      font-size: 3rem;
    }
  
    /* Hover effect for available seats */
    .seat.available:hover {
      transform: scale(1.1);
      
      /* box-shadow: 0px 0px 15px 5px rgba(138, 43, 226, 0.5); */
    }
  
    .buttons {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 20px;
    }
  
    .buttons button {
      padding: 10px 20px;
      font-size: 1.2rem;
    }
  </style>
  
</head>

<body>
  <div class="tubelight-effect">
    

    <!-- Seat grid dynamically generated -->
    <div class="seat-grid">
      <% 
        ResultSet rs = (ResultSet) request.getAttribute("resultset");
        while (rs.next()) {
          String sno = rs.getString("seatnumber");
          boolean ava = rs.getBoolean("availablity");
          String seatClass = ava ? "available" : "unavailable";
      %>
        <div class="seat <%= seatClass %>">
          <i class="fas fa-couch seaticon" data-seat="<%= sno %>"></i>
          <span class="seat-number"><%= sno %></span>
        </div>
      <% 
        } 
      %>
    </div>

    <!-- Buttons positioned below the seat grid -->
    <div class="buttons">
      <input type="hidden" id="movie-name" value="<%= request.getAttribute("moviename" ) %>">
      <button id="continue-btn" class="btn btn-outline-primary">Continue</button>
      <button id="cancel-btn" class="btn btn-outline-danger">Cancel</button>
    </div>
  </div>

  <!-- Include Bootstrap JS and dependencies -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <script>
    // Array to store selected seats
    const selectedSeats = [];

    // Select all icons with the class 'seaticon'
    const seatIcons = document.querySelectorAll(".seaticon");

    // Add a click event listener to each icon
    seatIcons.forEach((icon) => {
        icon.addEventListener("click", () => {
            const seatNumber = icon.dataset.seat; // Get the seat number from the data attribute

            if (icon.style.color === "green") {
                // Deselect the seat
                icon.style.color = "#8a2be2"; // Default color for available seats
                const index = selectedSeats.indexOf(seatNumber);
                if (index > -1) {
                    selectedSeats.splice(index, 1);
                }
            } else {
                // Select the seat
                icon.style.color = "green";
                selectedSeats.push(seatNumber);
            }
        });
    });

    // Add event listener to the "Continue" button
    document.getElementById("continue-btn").addEventListener("click", () => {
    if (selectedSeats.length === 0) {
        alert("Please select at least one seat to continue.");
        return;
    }

    // Retrieve the movie name from the hidden input
    const movieName = document.getElementById("movie-name").value;

    // Retrieve the username from session storage
    const username = sessionStorage.getItem("username");
    if (!username) {
        alert("User is not logged in. Please log in first.");
        return;
    }

    // Submit the form using a POST request
    const form = document.createElement("form");
    form.method = "POST";
    form.action = "book/booknow";

    // Add selected seats to the form
    selectedSeats.forEach((seat) => {
        const input = document.createElement("input");
        input.type = "hidden";
        input.name = "seat";
        input.value = seat;
        form.appendChild(input);
    });

    // Add movie name to the form
    const movieInput = document.createElement("input");
    movieInput.type = "hidden";
    movieInput.name = "moviename";
    movieInput.value = movieName;
    form.appendChild(movieInput);

    // Add username to the form
    const usernameInput = document.createElement("input");
    usernameInput.type = "hidden";
    usernameInput.name = "username";
    usernameInput.value = username;
    form.appendChild(usernameInput);

    // Append and submit the form
    document.body.appendChild(form);
    form.submit();
});

    // Add event listener to the "Cancel" button
    document.getElementById("cancel-btn").addEventListener("click", () => {
        selectedSeats.length = 0;
        seatIcons.forEach((icon) => {
            if (icon.style.color === "green") {
                icon.style.color = "#8a2be2";
            }
        });
    });
</script>

</body>
</html>
