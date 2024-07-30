<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
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
    .welcome-image {
        max-width: 100%;
        height: auto;
        max-height: 200px; /* Adjust the max-height as needed */
    }
    h1 {
        margin: 20px 0;
        color: #62c8e1; /* Text color for the heading */
        font-weight: bold;
    }
    .project-info {
        margin-top: 20px;
        padding: 20px;
        border: 3px solid #B1D24D;
        border-radius: 10px;
        background-color: #333; /* Slightly lighter background for contrast */
        display: inline-block;
        text-align: left;
        max-width: 400px;
        margin-left: auto;
        margin-right: auto;
    }
    .project-info p {
        margin: 5px 0;
        font-style: italic; /* Italicize the project information */
    }
    form {
        margin-top: 20px;
    }
    button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #e0ccff; /* Button background color */
        border: none;
        border-radius: 5px; /* Rounded corners for the button */
        color: #000; /* Button text color */
        transition: background-color 0.3s ease; /* Smooth transition for hover effect */
    }
    button:hover {
        background-color: #3d0099; /* Darker shade on hover */
    }
</style>
</head>
<body>
    <div class="container">
        <img src="img/welcom.jpg" alt="Welcome Image" class="welcome-image animate__animated animate__fadeInDown">
        <h1 class="animate__animated animate__fadeInUp">Welcome to the <b><i>Feedback System</i></b> Project</h1>
        <div class="project-info animate__animated animate__fadeInUp">
            <p><strong>Project Name:</strong><i> Feedback System</i></p>
            <p><strong>Developed By:</strong><i> Umesh Pandey</i></p>
            <p><strong>Class:</strong><i> B.C.A 3rd year</i></p>
        </div>
        <form action="login.jsp" method="get">
            <button type="submit" class="btn btn-primary animate__animated animate__fadeInUp">Start</button>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
