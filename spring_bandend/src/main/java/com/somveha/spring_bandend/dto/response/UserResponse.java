package com.somveha.spring_bandend.dto.response;

import java.util.List;

import lombok.Data;
@Data
public class UserResponse {
    private Long id;
    private String username;
    private String email;
    private String phone;
    // private Boolean enabled;
    // private List<RoleResponce> roles;
}
