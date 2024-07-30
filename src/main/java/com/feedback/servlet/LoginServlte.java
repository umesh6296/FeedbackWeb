package com.feedback.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.feedback.dao.UserDAO;
import com.feedback.entity.UserEntity;

@WebServlet("/LoginServlet")
public class LoginServlte extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlte() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();

        // Validate email format
        if (!userDAO.isValidEmail(email)) {
            request.setAttribute("loginMessage", "Invalid email format");
            RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
            rd.forward(request, response);
            return;
        }

        // Check credentials
        UserEntity userEntity = userDAO.find(email, password);

        if (userEntity != null) {
            session.setAttribute("user", userEntity);
            String role = userEntity.getRole();
            if ("s".equalsIgnoreCase(role)) {
                response.sendRedirect("student.jsp"); // Redirect to student page
            } else if ("a".equalsIgnoreCase(role)) {
                response.sendRedirect("admin.jsp"); // Redirect to admin page
            } else {
                request.setAttribute("loginMessage", "Unknown role");
                RequestDispatcher rd = request.getRequestDispatcher("loginPage.jsp");
                rd.forward(request, response);
            }
        } else {
            request.setAttribute("loginMessage", "Invalid email or password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
