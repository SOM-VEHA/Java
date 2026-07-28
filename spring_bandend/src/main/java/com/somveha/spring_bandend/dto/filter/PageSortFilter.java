package com.somveha.spring_bandend.dto.filter;

public interface PageSortFilter {
    
    String getSortBy();

    String getDirection();

    Integer getPage();

    Integer getSize();
}
