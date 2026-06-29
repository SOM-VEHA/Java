package com.example.demo.controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.Transaction;
import com.example.demo.service.TransactionService;

import java.util.List;
@RestController
@RequestMapping("/api/transactions")
public class TransactionController {

    private final TransactionService service;

    public TransactionController(TransactionService service) {
        this.service = service;
    }

    @GetMapping
    public List<Transaction> getAll() {
        return service.findAll();
    }

    @PostMapping
    public Transaction create(@RequestBody Transaction transaction) {
        return service.save(transaction);
    }
}