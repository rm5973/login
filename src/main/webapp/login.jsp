<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            text-align: center;
            color: white;
        }

        h2 {
            margin-bottom: 20px;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 10px;
            color: white;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            color: white;
            box-shadow: none;
        }

        .btn {
            background-color: #0072ff;
            border: none;
            border-radius: 10px;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="login-form" action="login" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" placeholder="Username" name="search" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" placeholder="Password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
        <p class="mt-3">Don't have an account? <a href="./registration.jsp" style="color: #0072ff;">Sign up</a></p>
    </div>
    <script>
        const loginForm = document.getElementById("login-form");

        loginForm.addEventListener("submit", function(event) {
            const usernameInput = document.getElementsByName("search")[0];
            const username = usernameInput.value;

            // Store the username in sessionStorage
            sessionStorage.setItem("username", username);

            // Allow the form submission to proceed after setting the username
        });
    </script>
</body>
</html>
