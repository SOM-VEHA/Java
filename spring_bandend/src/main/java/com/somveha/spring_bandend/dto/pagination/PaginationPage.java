package com.somveha.spring_bandend.dto.pagination;

import lombok.Data;

@Data
public class PaginationPage {
    private int pageSize;
    private int pageNumber;
    private int totalPages;
    private long totalElements;
    private long numberOfElements;
    private boolean first;
    private boolean last;
    private boolean empty;
}
