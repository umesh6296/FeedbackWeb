<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.feedback.entity.UserEntity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thank You</title>
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
 </style>
</head>
<body>
    <div class="container">
        <div class="header animate__animated animate__fadeInDown">
            <h1>Final Year Project</h1>
        </div>
        <div class="message animate__animated animate__fadeInUp">
            <p>Thank you, <%= (session.getAttribute("user") != null) ? ((UserEntity)session.getAttribute("user")).getName() : "Student" %>, for giving your feedback!</p>
        </div>
        <form action="student.jsp" method="post" class="animate__animated animate__fadeInUp">
            <input type="hidden" name="email" value="<%= (session.getAttribute("user") != null) ? ((UserEntity)session.getAttribute("user")).getEmail() : "" %>">
            <button type="submit" class="btn btn-custom">Finish</button>
        </form>
    </div>

    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
