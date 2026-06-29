package com.somveha.spring_bandend.service.implement;

import java.util.List;

import org.springframework.stereotype.Service;

import com.somveha.spring_bandend.dto.request.UserRequest;
import com.somveha.spring_bandend.dto.response.UserResponse;
import com.somveha.spring_bandend.entity.User;
import com.somveha.spring_bandend.mapper.UserMapper;
import com.somveha.spring_bandend.repository.UserRepository;
import com.somveha.spring_bandend.service.AuthService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService {
    private final UserRepository userRepository;
    private final UserMapper userMapper;

    @Override
    public UserResponse register(UserRequest userRequest) {
        User user = userMapper.toEntityUser(userRequest);
        User saveUser = userRepository.save(user);
        UserResponse userResponse = userMapper.tResponse(saveUser);
        return userResponse;
    }

    @Override
    public List<UserResponse> getAll() {
        List<User> user=userRepository.findAll();
        List<UserResponse> userResponses=user.stream().map(userMapper::tResponse).toList();
        return userResponses;
    }

}
