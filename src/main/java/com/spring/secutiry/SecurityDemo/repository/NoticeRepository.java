package com.spring.secutiry.SecurityDemo.repository;

import com.spring.secutiry.SecurityDemo.model.Notice;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {

    @Query(value = "from Notice n where current_date BETWEEN noticBegDt AND noticEndDt")
    List<Notice> findAllActiveNotices();

}
