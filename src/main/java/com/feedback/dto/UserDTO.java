package com.feedback.dto;

import com.feedback.entity.UserEntity;

public class UserDTO extends GenDTO{
    UserEntity userEntity;
    public UserDTO(boolean status, String msg, Exception ex,  UserEntity userEntity) {
        super(status, msg, ex);
        this.userEntity = userEntity;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "userEntity=" + userEntity +
                '}';
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }
}
