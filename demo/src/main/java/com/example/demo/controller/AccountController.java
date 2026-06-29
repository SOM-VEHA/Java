package com.example.demo.controller;
import com.example.demo.domain.Account;
import com.example.demo.service.AccountService;

import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@RequestMapping("/api/accounts")
public class AccountController {

    private final AccountService service;

    public AccountController(AccountService service) {
        this.service = service;
    }

    @GetMapping
    public List<Account> getAll() {
        return service.findAll();
    }

    @GetMapping("/{id}")
    public Account getById(@PathVariable Long id) {
        return service.findById(id);
    }

    @PostMapping
    public Account create(@RequestBody Account account) {
        return service.save(account);
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        service.delete(id);
    }
}