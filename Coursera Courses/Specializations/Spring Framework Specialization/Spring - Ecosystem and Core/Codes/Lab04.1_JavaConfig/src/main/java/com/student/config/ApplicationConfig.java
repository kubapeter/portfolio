package com.student.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.student.dao.StudentDao;
import com.student.dao.StudentDaoImpl;
import com.student.service.StudentService;
import com.student.service.StudentServiceImpl;

@Configuration
public class ApplicationConfig {

	@Bean
	StudentDao dao(){
		return new StudentDaoImpl();
	}
	
	@Value("2")
	private int numberOfStudents;
	
	@Bean(name="studentService")
	StudentService service(){
		StudentServiceImpl service =  new StudentServiceImpl();
		service.setStudentDao(dao());
		service.setNumberOfStudents(numberOfStudents);
		return service;
	}
}
