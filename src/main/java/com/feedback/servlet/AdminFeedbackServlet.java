package com.feedback.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.feedback.dao.FeedbackDao;
import com.feedback.entity.FeedbackEntity;

@WebServlet("/AdminFeedbackServlet")
public class AdminFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminFeedbackServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String course = request.getParameter("course");
        if (course != null && !course.isEmpty()) {
            FeedbackDao feedbackDao = new FeedbackDao();
            List<FeedbackEntity> feedbackList = feedbackDao.findByCourse(course);
            request.setAttribute("feedbackList", feedbackList);
        }
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
