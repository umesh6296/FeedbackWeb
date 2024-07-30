package com.feedback.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feedback.dao.UserDAO;
import com.feedback.entity.UserEntity;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        UserDAO userDAO = new UserDAO();

        // Check if the email is already taken
        if (userDAO.checkEmailExists(email)) {
            request.setAttribute("registrationMessage", "Email already exists. Please use a different email.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Create a new UserEntity object and insert it into the database
        UserEntity newUser = new UserEntity(email, name, password, role);
        boolean success = userDAO.insert(newUser);

        if (success) {
        	 session.setAttribute("user", newUser);
            // Redirect based on user role
            if ("s".equalsIgnoreCase(role)) {
                response.sendRedirect("student.jsp");
            } else if ("a".equalsIgnoreCase(role)) {
                response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("registrationMessage", "Invalid role specified. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("registrationMessage", "Registration failed. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
