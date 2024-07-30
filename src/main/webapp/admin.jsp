<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.feedback.dao.FeedbackDao" %>
<%@ page import="com.feedback.entity.FeedbackEntity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Feedback Page</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth transition for hover effect */
        animation: bounceIn 1s ease-in-out;
        display: block;
        margin: 10px auto; /* Center the buttons */
    }
    .btn-custom:hover {
        background-color: #3d0099; /* Darker shade on hover */
        transform: scale(1.05); /* Slightly enlarge on hover */
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
    .table {
        border: 2px solid #C9990A; /* Table border color */
    }
    .table th {
        background-color: #A8AD2D; /* Table heading background color */
        color: #000; /* Table heading text color */
    }
    .table td {
        color: #5E35B1; /* Table row content color */
    }
    .btn-login {
        padding: 10px 20px;
        font-size: 18px;
        background-color: #ff6f61; /* Button background color */
        border: none;
        border-radius: 5px; /* Rounded corners for the button */
        color: #fff; /* Button text color */
        transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth transitions */
        animation: bounceIn 1s ease-in-out;
        display: block;
        margin: 20px auto; /* Center the button */
    }
    .btn-login:hover {
        background-color: #e94e77; /* Darker shade on hover */
        transform: scale(1.05); /* Slightly enlarge on hover */
    }
    @keyframes bounceIn {
        from {
            opacity: 0;
            transform: scale(0.5);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }
</style>
</head>
<body>
<div class="container">
        <div class="header animate__animated animate__fadeInDown">
            <h1>Final Year Project</h1>
        </div>
        <p><b>Show Feedback Detail</b></p>
    <form action="AdminFeedbackServlet" method="post">
        <div class="form-group">
            <label for="course">Course</label>
            <select class="form-control" id="course" name="course">
                <option value="">Select a course</option>
                    <option value="C">C</option>
                    <option value="C++">C++</option>
                    <option value="Java">Java</option>
                    <option value="Kotlin">Kotlin</option>
                    <option value="JavaScript">Java Script</option>
                    <option value="Python">Python</option>
                    <option value="PHP">PHP</option>
            </select>
        </div>
        <button type="submit" class="btn-custom">Show Details</button>
    </form>

    <% 
        List<FeedbackEntity> feedbackList = (List<FeedbackEntity>) request.getAttribute("feedbackList");
        if (feedbackList != null && !feedbackList.isEmpty()) { 
    %>
    <table class="table table-bordered mt-4">
        <thead>
            <tr>
                <th>Student Name</th>
                <th>Rating</th>
                <th>Suggestion</th>
            </tr>
        </thead>
        <tbody>
            <% 
                for (FeedbackEntity feedback : feedbackList) { 
            %>
            <tr>
                <td><%= feedback.getName() %></td> <!-- Display the student's name -->
                <td><%= feedback.getRating() %></td>
                <td><%= feedback.getSuggestion() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else if (request.getAttribute("feedbackList") != null) { %>
    <p>No feedback available for the selected course.</p>
    <% } %>

    <!-- Button to go to login page -->
    <div class="form-footer">
        <form action="login.jsp" method="get">
            <button type="submit" class="btn-login">Go to Login</button>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
