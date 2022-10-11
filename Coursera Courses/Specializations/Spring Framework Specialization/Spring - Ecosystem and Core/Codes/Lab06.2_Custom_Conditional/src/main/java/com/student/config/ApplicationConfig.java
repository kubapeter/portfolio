package com.student.config;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

import com.student.dao.StudentDao;
import com.student.dao.StudentDaoImpl;
import com.student.service.StudentService;
import com.student.service.StudentServiceProxy;
import com.student.service.StudentServiceImpl;
 

@Configuration
@PropertySource("classpath:application.properties")
public class ApplicationConfig {

	@Bean
	StudentDao dao(){
		return new StudentDaoImpl();
	}
 
	
	@Value("${max}")
	private int numberOfStudents;
	
   @Bean(name="studentService")
   @Conditional(
			 StudentConditional_Prod.class
	)
	StudentService service(){
		StudentServiceImpl service =  new StudentServiceImpl();
		service.setStudentDao(dao());
		service.setNumberOfStudents(numberOfStudents);
		return service;
	}
	
	@Bean
	static PropertySourcesPlaceholderConfigurer getConfigurer(){
		return new PropertySourcesPlaceholderConfigurer();
	}
	
	@Bean(name="studentService")
	@Conditional(
			 StudentConditional_Test.class
	)
	StudentService serviceTest(){
		StudentServiceImpl service =  new StudentServiceImpl();
		service.setStudentDao(dao());
		service.setNumberOfStudents(numberOfStudents);
		return  new StudentServiceProxy(service);
	} 
	
}
