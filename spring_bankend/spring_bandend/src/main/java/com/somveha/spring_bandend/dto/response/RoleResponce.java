package com.somveha.spring_bandend.dto.response;

import lombok.Data;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@Data
@JsonPropertyOrder({ "id", "name", "description" })
public class RoleResponce {
    private Long id;
    private String name;
    private String description;
}
