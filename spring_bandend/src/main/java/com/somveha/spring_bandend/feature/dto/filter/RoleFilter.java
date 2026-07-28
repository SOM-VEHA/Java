package com.somveha.spring_bandend.feature.dto.filter;
import com.somveha.spring_bandend.dto.filter.BaseFilter;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RoleFilter extends BaseFilter {
    private String code;
    private String name;
}
