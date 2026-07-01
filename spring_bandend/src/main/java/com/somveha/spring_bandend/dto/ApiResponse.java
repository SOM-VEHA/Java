package com.somveha.spring_bandend.dto;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.somveha.spring_bandend.dto.pagination.PaginationPage;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {
    private boolean status;
    private int code;
    private String message;
    private String timestamp;
    private T data;
    private PaginationPage pagination;
}
