<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
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
        display: block;
        margin: 10px auto; /* Center the buttons */
    }
    .btn-custom:hover {
        background-color: #3d0099; /* Darker shade on hover */
    }
    .error-message {
        color: red;
        margin-top: 10px;
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
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Final Year Project</h1>
        </div>
    <p><b>Change your password</b></p>
        <form action="ForgotPasswordServlet" method="post">
            <div class="form-group animate__animated animate__fadeInUp">
                <img src="img/gmail.png" alt="email icon" class="icon"><label for="email">Email</label>
                <div class="input-group">
                    <input type="email" id="email" name="email" required>
                </div>
            </div>
            <div class="form-group animate__animated animate__fadeInUp">
                <img src="img/reset.png" alt="password icon" class="icon"><label for="password">Password</label>
                <div class="input-group">
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>
            </div>
        
        
        
        
        
        
        
        
           
            <div class="form-group">
                <button type="submit" class="btn btn-custom">Done</button>
            </div>
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) { 
            %>
            <div class="error-message"><%= errorMessage %></div>
            <% } %>
        </form>
       
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
