package com.somveha.spring_bandend.base;
import com.somveha.spring_bandend.dto.pagination.PaginationPage;
import lombok.Builder;
import lombok.Data;
import java.util.List;
@Builder
@Data
public class BasePagination<T> {
    private boolean status;
    private int code;
    private String message;
    private String timestamp;
    private List<T> data;
    private PaginationPage pagination;
}
