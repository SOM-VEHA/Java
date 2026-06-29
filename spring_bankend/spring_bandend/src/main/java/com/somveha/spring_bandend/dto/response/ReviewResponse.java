package com.somveha.spring_bandend.dto.response;

import lombok.Data;

@Data
public class ReviewResponse {
    private Long id;
    private Integer rating;
    private String comment;
    private String username;
}
