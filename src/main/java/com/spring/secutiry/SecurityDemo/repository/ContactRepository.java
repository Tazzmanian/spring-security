package com.spring.secutiry.SecurityDemo.repository;


import com.spring.secutiry.SecurityDemo.model.Contact;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContactRepository extends CrudRepository<Contact, String> {


}
