package com.student.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.student.core.Student;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

public class StudentServiceTest {
	
	private ClassPathXmlApplicationContext context;
	private StudentService service;

	@BeforeEach
	void setUp() {
		context = new ClassPathXmlApplicationContext("beans.xml");  
		service =  context.getBean("studentService", StudentService.class);
	}
	
 
	@Test
	void testGetOneStudent() {
		 Student student =  service.get(1L);
		 assertThat(student.getFirstName(), equalTo("Eric"));
	     assertThat(student.getSurname(), equalTo("Colbert"));
	}
	@Test
	void tesGetAll() {
		 assertThat(service.getAllStudents().size(), equalTo(2));
		 service.getAllStudents().forEach(p-> {
			System.out.printf("%-10s %-10s%n",p.getFirstName(), p.getSurname());
		 });
	}


}
