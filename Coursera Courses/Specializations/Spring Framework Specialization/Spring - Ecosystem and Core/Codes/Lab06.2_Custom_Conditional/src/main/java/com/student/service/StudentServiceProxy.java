package com.student.service;

import java.util.Collection;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;

import com.student.core.Student;
import com.student.dao.StudentDaoImpl;

public class StudentServiceProxy implements StudentService {
    private Logger logger = Logger.getLogger("StudentServiceProxy");
    
	private StudentService service;
 

	public StudentServiceProxy(StudentService service) {
		super();
		this.service = service;
	}

	@Override
	public Student get(long id) {
		logger.info("Calling Service get(id)");
		return service.get(id);
	}

	@Override
	public Collection<Student> getAllStudents() {
		logger.info("Calling Service getAllStudents()");
		return service.getAllStudents();
	}
    @Value("${department}")
    private String department;
    
	@Override
	public Collection<Student> getStudentsInDepartment() {
		logger.info("Calling Service getStudentsInDepartment()");
		return new StudentDaoImpl().getAll().stream()
				.filter(p-> p.getDept().equals(department))
				.collect(Collectors.toList());
	}

}
