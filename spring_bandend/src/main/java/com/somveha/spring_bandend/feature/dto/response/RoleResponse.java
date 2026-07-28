package com.somveha.spring_bandend.feature.dto.response;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@Data
@JsonPropertyOrder({ "id", "name", "description" })
public class RoleResponse {
    private Long id;
    private String name;
    private String description;
}
