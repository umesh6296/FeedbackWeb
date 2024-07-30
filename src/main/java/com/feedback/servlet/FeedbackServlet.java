package com.feedback.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.feedback.dao.FeedbackDao;
import com.feedback.entity.FeedbackEntity;
import com.feedback.entity.UserEntity;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FeedbackServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserEntity user = (UserEntity) session.getAttribute("user");
        String email = user.getEmail();
        String course = request.getParameter("course");
        String suggestion = request.getParameter("suggestion");
        float rating = Float.parseFloat(request.getParameter("rating"));

        FeedbackDao feedbackDao = new FeedbackDao();

        if (feedbackDao.checkCourse(email, course)) {
            request.setAttribute("errorMessage", "Feedback for this course has already been given.");
            request.getRequestDispatcher("student.jsp").forward(request, response);
        } else {
            FeedbackEntity feedback = new FeedbackEntity(email, course, suggestion, rating);
            if (feedbackDao.insert(feedback)) {
                response.sendRedirect("thanks.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to submit feedback. Please try again.");
                request.getRequestDispatcher("student.jsp").forward(request, response);
            }
        }
    }
}
