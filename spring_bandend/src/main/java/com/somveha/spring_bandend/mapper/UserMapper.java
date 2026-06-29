package com.somveha.spring_bandend.mapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import com.somveha.spring_bandend.dto.request.UserRequest;
import com.somveha.spring_bandend.dto.response.UserResponse;
import com.somveha.spring_bandend.entity.User;
@Mapper(componentModel = "spring")
public interface UserMapper {
    @Mapping(target = "id", ignore = true)
    public User toEntityUser(UserRequest userRequest);
    public UserResponse tResponse(User user);
}