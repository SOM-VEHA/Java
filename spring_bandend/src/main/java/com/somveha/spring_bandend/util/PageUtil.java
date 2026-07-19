package com.somveha.spring_bandend.util;

public interface PageUtil {
    int DEFAULT_PAGE_LIMIT = 20;
    int DEFAULT_PAGE_NUMBER = 1;
    int MAX_PAGE_LIMIT = 100;
    String PAGE_LIMIT = "limit";
    String PAGE_NUMBER = "page";
    // Array index 0 = element 1
    static Pageable getPageable(int pageNumber , int  pageSize) {
        if (pageNumber < DEFAULT_PAGE_NUMBER) {
            pageNumber = DEFAULT_PAGE_NUMBER;
        }
        if (pageSize < 1) {
            pageSize = DEFAULT_PAGE_LIMIT;
        } else if (pageSize > MAX_PAGE_LIMIT) {
            pageSize = MAX_PAGE_LIMIT;
        }
        return PageRequest.of(pageNumber - 1, pageSize);
    }
    static  int safeParse (String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return  defaultValue;
        }
    }
}
