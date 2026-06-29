package com.somveha.spring_bandend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.somveha.spring_bandend.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {

}
