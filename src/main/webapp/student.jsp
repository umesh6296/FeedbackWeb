<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.feedback.entity.UserEntity" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Form</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- FontAwesome for star rating -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

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
    select,
    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #a366ff;
        border-radius: 5px;
        background-color: #333; /* Slightly lighter background for input fields */
        color: #fff; /* Input text color */
    }
    select:focus,
    input[type="text"]:focus,
    textarea:focus {
        border-color: #62c8e1; /* Change border color on focus */
    }
    .rating {
        direction: rtl;
        font-size: 30px;
        unicode-bidi: bidi-override;
    }
    .rating > span {
        display: inline-block;
        position: relative;
        width: 1.1em;
        cursor: pointer;
    }
    .rating > span:hover:before,
    .rating > span:hover ~ span:before {
        /* Unicode star character */
        position: absolute;
        color: gold;
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
</style>
</head>
<body>
    <div class="container">
        <div class="header">
             <h1>Final Year Project</h1>
        </div>
             <p><b>Please give your feedback</b></p>
        <form id="feedbackForm" action="FeedbackServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="course">Course</label>
                <select id="course" name="course" required>
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
            <div class="form-group">
                <label for="suggestion">Suggestion</label>
                <textarea id="suggestion" name="suggestion" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="rating">Rating</label>
                <div class="rating">
                    <span><input type="radio" name="rating" value="5" required></span>
                    <span><input type="radio" name="rating" value="4" required></span>
                    <span><input type="radio" name="rating" value="3" required></span>
                    <span><input type="radio" name="rating" value="2" required></span>
                    <span><input type="radio" name="rating" value="1" required></span>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-custom">Submit Feedback</button>
            </div>
            <div class="error-message" id="errorMessage">
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) {
                        out.print(errorMessage);
                    }
                %>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function validateForm() {
            const ratingChecked = document.querySelector('input[name="rating"]:checked');
            if (!ratingChecked) {
                document.getElementById('errorMessage').textContent = "Please select a rating.";
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
