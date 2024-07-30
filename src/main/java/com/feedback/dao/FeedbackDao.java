package com.feedback.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.feedback.entity.FeedbackEntity;
import com.feedback.entity.UserEntity;
import com.feedback.utils.dbConnection;

public class FeedbackDao {
    
    public boolean insert(FeedbackEntity feedback) {
        String query = "INSERT INTO feedback (Email, Course, Suggestion, Rating) VALUES (?, ?, ?, ?)";
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, feedback.getEmail());
            stmt.setString(2, feedback.getCourse());
            stmt.setString(3, feedback.getSuggestion());
            stmt.setFloat(4, feedback.getRating());
            stmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public FeedbackEntity find(String email) {
        String query = "SELECT * FROM feedback WHERE Email = ?";
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
             stmt.setString(1, email);
             ResultSet rs = stmt.executeQuery();
             if (rs.next()) {
                return new FeedbackEntity(rs.getString("Email"), rs.getString("Course"), rs.getString("Suggestion"), rs.getFloat("Rating"));
             }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean checkCourse(String email, String course) {
        String query = "SELECT * FROM feedback WHERE Email = ? AND Course = ?";
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, course);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<FeedbackEntity> findByCourse(String course) {
        String query = "SELECT u.name, f.Email, f.Suggestion, f.Rating " +
                       "FROM feedback f " +
                       "JOIN user u ON f.Email = u.email " +
                       "WHERE f.Course = ?";
        List<FeedbackEntity> feedbackList = new ArrayList<>();
        try (Connection conn = dbConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, course);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("Email");
                String suggestion = rs.getString("Suggestion");
                float rating = rs.getFloat("Rating");
                FeedbackEntity feedback = new FeedbackEntity(email, course, suggestion, rating);
                feedback.setName(name); // Assuming FeedbackEntity has a setName method
                feedbackList.add(feedback);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return feedbackList;
    }
}
