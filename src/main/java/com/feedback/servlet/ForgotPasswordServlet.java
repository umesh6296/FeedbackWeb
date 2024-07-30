package com.feedback.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.feedback.dao.UserDAO;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ForgotPasswordServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        UserDAO userDAO = new UserDAO();

        // Check if email exists in the database
        if (userDAO.checkEmailExists(email)) {
            // Update the password
            userDAO.updatePassword(email, newPassword);

            // Redirect to login page
            response.sendRedirect("login.jsp");
        } else {
            // Email does not exist, show error message
            request.setAttribute("errorMessage", "Email does not exist. Please check the email and try again.");
            request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        }
    }
}
