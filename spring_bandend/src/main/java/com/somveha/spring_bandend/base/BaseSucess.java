package com.somveha.spring_bandend.base;
import com.somveha.spring_bandend.dto.pagination.PaginationPage;
import lombok.Builder;
import lombok.Data;
// @Builder
@Data
public class BaseSucess<T> {
    private boolean status;
    private int code;
    private String message;
    private String timestamp;
    private T data;
    private PaginationPage pagination;
}
