<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('https://source.unsplash.com/random/1920x1080/?dark,blue') no-repeat center center fixed;
            background-size: cover;
        }

        .background {
            position: absolute;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(15px); /* Increased blur for a stronger effect */
            background: rgba(0, 0, 139, 0.7); /* Dark blue overlay */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: rgba(255, 255, 255, 0.1); /* Light transparent background */
            border-radius: 15px;
            padding: 2rem;
            width: 400px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5);
            color: white;
        }

        h2 {
            text-align: center;
            margin-bottom: 1rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
        }

        input {
            width: 100%;
            padding: 0.5rem;
            border: none;
            border-radius: 5px;
            outline: none;
            background: rgba(255, 255, 255, 0.2); /* Slightly lighter for contrast */
            color: white;
        }

        input::placeholder {
            color: #fff;
            opacity: 0.7;
        }

        button {
            width: 100%;
            padding: 0.5rem;
            border: none;
            border-radius: 5px;
            background: rgba(0, 0, 139, 0.8); /* Dark blue button */
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: rgba(0, 0, 139, 1); /* Darker on hover */
        }
    </style>
</head>
<body>
    <div class="background">
        <div class="container">
            <h2>Create Account</h2>
            <form id="registrationForm"  action="register" method="post">
                <div class="form-group">
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" name="firstname" required placeholder="Enter your first name">
                </div>
                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" required placeholder="Enter your last name">
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="text" id="phone" name="phone" required placeholder="Enter your phone number">
                </div>
                <div class="form-group">
                    <label for="usernameEmail">Username or Email:</label>
                    <input type="text" id="usernameEmail" name="usernameEmail" required placeholder="Enter your username or email">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required placeholder="Create a password">
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Re-enter your password">
                </div>
                <button type="submit">Sign Up</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                event.preventDefault(); // Prevent form submission
                alert("Passwords do not match!");
            }
        });
    </script>
</body>
</html>
