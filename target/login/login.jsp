<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff); /* Background gradient */
            height: 100vh; /* Full height */
            display: flex; /* Flex display */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            font-family: Arial, sans-serif; /* Font family */
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1); /* Semi-transparent background */
            border-radius: 20px; /* Rounded corners */
            backdrop-filter: blur(10px); /* Frosted glass effect */
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1); /* Shadow effect */
            padding: 30px; /* Padding inside the container */
            width: 400px; /* Fixed width */
            text-align: center; /* Center text */
            color: white; /* White text */
        }

        h2 {
            margin-bottom: 20px; /* Space below the title */
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2); /* Semi-transparent input fields */
            border: none; /* Remove border */
            border-radius: 10px; /* Rounded corners */
            color: white; /* White text */
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3); /* Lighter background on focus */
            color: white; /* White text on focus */
            box-shadow: none; /* Remove box shadow on focus */
        }

        .btn {
            background-color: #0072ff; /* Button color */
            border: none; /* Remove border */
            border-radius: 10px; /* Rounded corners */
            margin-top: 10px; /* Space above the button */
        }

        .btn:hover {
            background-color: #0056b3; /* Darker button on hover */
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" placeholder="username" name="search" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" placeholder="Password" name ="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <p class="mt-3">Don't have an account? <a href="#a" style="color: #0072ff;">Sign up</a></p>
    </div>
</body>
</html>