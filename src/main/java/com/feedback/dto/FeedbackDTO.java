package com.feedback.dto;

import com.feedback.entity.FeedbackEntity;

public class FeedbackDTO extends  GenDTO{
    FeedbackEntity feedback;
    public FeedbackDTO(boolean status, String msg, Exception ex,   FeedbackEntity feedback) {
        super(status, msg, ex);
        this.feedback = feedback;
    }

    @Override
    public String toString() {
        return "FeedbackDTO{" +
                "feedback=" + feedback +
                '}';
    }

    public FeedbackEntity getFeedback() {
        return feedback;
    }
}
