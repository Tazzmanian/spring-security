package com.spring.secutiry.SecurityDemo.repository;

import com.spring.secutiry.SecurityDemo.model.Notice;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeRepository extends CrudRepository<Notice, Long> {

//    @Query(value = "select n from Notice n where CURDATE() BETWEEN noticBegDt AND noticEndDt")
//    List<Notice> findAllActiveNotices();

}
