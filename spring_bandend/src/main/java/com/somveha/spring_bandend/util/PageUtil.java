package com.somveha.spring_bandend.util;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import com.somveha.spring_bandend.dto.filter.BaseFilter;
import com.somveha.spring_bandend.dto.filter.PageSortFilter;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.util.StringUtils;

import java.util.Collection;
// public interface PageUtil {
//     int DEFAULT_PAGE_LIMIT = 20;
//     int DEFAULT_PAGE_NUMBER = 1;
//     int MAX_PAGE_LIMIT = 100;
//     String PAGE_LIMIT = "limit";
//     String PAGE_NUMBER = "page";

//     static Pageable getPageable(int pageNumber, int pageSize) {
//         if (pageNumber < DEFAULT_PAGE_NUMBER) {
//             pageNumber = DEFAULT_PAGE_NUMBER;
//         }
//         if (pageSize < 1) {
//             pageSize = DEFAULT_PAGE_LIMIT;
//         } else if (pageSize > MAX_PAGE_LIMIT) {
//             pageSize = MAX_PAGE_LIMIT;
//         }

//         return PageRequest.of(pageNumber - 1, pageSize);
//     }

//     static int safeParse(String value, int defaultValue) {
//         try {
//             return Integer.parseInt(value);
//         } catch (NumberFormatException e) {
//             return defaultValue;
//         }
//     }
// }
public final class PageUtil {

    // Controller - > Service -> impl -> repository
    // Controller -> service -> impl -> normalizer -> validator - > repository

    // Entry point // Controller Service


    private PageUtil() {
    }

    public static final int DEFAULT_PAGE = 0;
    public static final int DEFAULT_SIZE = 20;
    public static final int MAX_SIZE = 30;

    public static Sort sort(PageSortFilter filter,
                            String defaultSortField,
                            Collection<String> allowedSortFields) {
        return sort(filter, defaultSortField, allowedSortFields, false);
    }

    public static Sort sort(PageSortFilter filter, String defaultSortField,
                            Collection<String> allowedSortFields, boolean defaultDescending) {
        String sortField = (filter != null && StringUtils.hasText(filter.getSortBy()))
                ? filter.getSortBy() : defaultSortField;
        if (!allowedSortFields.contains(sortField)) {
            throw new IllegalArgumentException("Invalid sort field: " + sortField);
        }
        boolean descending = filter == null || filter.getDirection() == null
                ? defaultDescending
                : "desc".equalsIgnoreCase(filter.getDirection());
        return descending ? Sort.by(sortField).descending() : Sort.by(sortField).ascending();
    }

    public static Pageable pageable(PageSortFilter filter, String defaultSortField, Collection<String> allowedSortFields) {
        return pageable(filter, defaultSortField, allowedSortFields, DEFAULT_SIZE);
    }

    public static Pageable pageable(PageSortFilter filter, String defaultSortField,
                                    Collection<String> allowedSortFields, int defaultSize) {
        return pageable(filter, defaultSortField, allowedSortFields, defaultSize, false);
    }

    public static Pageable pageable(PageSortFilter filter, String defaultSortField,
                                    Collection<String> allowedSortFields, int defaultSize,
                                    boolean defaultDescending) {
        int page = (filter != null && filter.getPage() != null) ? filter.getPage() : DEFAULT_PAGE;
        int size = (filter != null && filter.getSize() != null && filter.getSize() > 0)
                ? filter.getSize() : defaultSize;
        if (size > MAX_SIZE) {
            size = MAX_SIZE;
        }
        return PageRequest.of(page, size, sort(filter, defaultSortField, allowedSortFields, defaultDescending));
    }
}