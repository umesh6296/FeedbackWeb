<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Animate.css -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #000; /* Set the background color to black */
        color: #fff; /* Set the text color to white for better contrast */
        animation: fadeIn 1s ease-in-out;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    .container {
        text-align: center;
        padding: 20px;
    }
    .header {
        width: 100%;
        background-color: #b3ffb3; /* Background color for the header */
        padding: 20px;
        border-radius: 5px;
        border: 2px solid #1aff1a; /* Header border color */
        margin-bottom: 20px;
        animation: fadeInDown 1s ease-in-out;
    }
    .header h1 {
        margin: 0;
        color: #000; /* Text color for the heading */
        font-weight: bold;
    }
    .form-group {
        margin: 20px auto;
        max-width: 300px;
        text-align: left;
        animation: fadeInUp 1s ease-in-out;
    }
    label {
        color: #62c8e1; /* Label text color */
    }
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #a366ff;
        border-radius: 5px;
        background-color: #333; /* Slightly lighter background for input fields */
        color: #fff; /* Input text color */
        animation: fadeInUp 1s ease-in-out;
    }
    input[type="email"]:focus,
    input[type="password"]:focus {
        border-color: #62c8e1; /* Change border color on focus */
    }
    .btn-custom {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #e0ccff; /* Button background color */
        border: 2px solid #a366ff; /* Button border color */
        border-radius: 5px; /* Rounded corners for the button */
        color: #000; /* Button text color */
        transition: background-color 0.3s ease; /* Smooth transition for hover effect */
        animation: fadeInUp 1s ease-in-out;
        display: block;
        margin: 10px auto; /* Center the buttons */
    }
    .btn-custom:hover {
        background-color: #3d0099; /* Darker shade on hover */
    }
    .form-footer {
        margin-top: 20px;
        animation: fadeInUp 1s ease-in-out;
    }
    .form-footer a {
        color: #62c8e1; /* Link color */
        text-decoration: none;
    }
    .form-footer a:hover {
        text-decoration: underline;
    }
    .icon {
        width: 20px; /* Adjust the width as needed */
        height: 20px; /* Adjust the height as needed */
        border-radius: 50%; /* Make the image round */
        margin-right: 10px; /* Add some space between the icon and the input field */
        vertical-align: middle; /* Align the icon vertically with the input field */
        border: 2px solid #006600; /* Icon border color */
    }
    .icon-above {
        display: block;
        margin: 10px auto 5px; /* Center the icon above the button */
    }
    @media (max-width: 576px) {
        .form-group {
            max-width: 100%; /* Make form group full width on small screens */
        }
        .btn-custom {
            width: 100%; /* Make buttons full width on small screens */
        }
    }
    .error-message {
        color: red;
        margin-top: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header animate__animated animate__fadeInDown">
            <h1>Final Year Project</h1>
        </div>

        <form action="LoginServlet" method="post">
             <div class="form-group animate__animated animate__fadeInUp">
                <img src="img/gmail.png" alt="email icon" class="icon"><label for="email">Email</label>
                <div class="input-group">
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
            <div class="form-group animate__animated animate__fadeInUp">
                <img src="img/reset.png" alt="password icon" class="icon"><label for="password">Password</label>
                <div class="input-group">
                    <input type="password" id="password" name="password" required>
                </div>
            </div>
             <div class="form-group animate__animated animate__fadeInUp">
                <img src="img/login.png" alt="sign in icon" class="icon icon-above">
                <button type="submit" class="btn btn-custom">Login</button>
            </div>
            <div class="form-group animate__animated animate__fadeInUp">
                <img src="img/account.png" alt="sign up icon" class="icon icon-above">
                <a href="register.jsp" class="btn btn-custom">Sign Up</a>
            </div>
            <div class="form-footer animate__animated animate__fadeInUp">
                <a href="forgetPassword.jsp">Forget Password?</a>
            </div>
            <% 
                String loginMessage = (String) request.getAttribute("loginMessage");
                if (loginMessage != null) { 
            %>
            <div class="error-message"><%= loginMessage %></div>
            <% } %>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
