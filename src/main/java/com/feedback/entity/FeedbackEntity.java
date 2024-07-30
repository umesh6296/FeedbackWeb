package com.feedback.entity;

public class FeedbackEntity {
    String email, course, suggestion, name;
    float rating;

    public FeedbackEntity(String email, String course, String suggestion, float rating) {
        this.email = email;
        this.course = course;
        this.suggestion = suggestion;
        this.rating = rating;
    }
    
    public FeedbackEntity() {}

    public String getEmail() {
        return email;
    }

    public String getCourse() {
        return course;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public float getRating() {
        return rating;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
