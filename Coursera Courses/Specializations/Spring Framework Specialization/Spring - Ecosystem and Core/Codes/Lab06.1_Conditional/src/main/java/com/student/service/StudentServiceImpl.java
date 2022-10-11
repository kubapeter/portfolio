package com.student.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Value;

import com.student.core.Student;
import com.student.dao.StudentDao;
 
public class StudentServiceImpl implements StudentService {
	 
	private StudentDao studentDao;
	 
	private int numberOfStudents;
	@Override
	public Student get(long id) {
		return studentDao.getOne(id);
	}

	@Override
	public Collection<Student> getAllStudents() {
		return studentDao.getAll().stream().limit(numberOfStudents).collect(Collectors.toList());
	}

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
 
	public void setNumberOfStudents(int numberOfStudents) {
		this.numberOfStudents = numberOfStudents;
	}
	
	@Value("#{dao.getAll().?[dept.equals('${department}')]}")
	private Collection<Student>  departments = new ArrayList<Student>();
	public Collection<Student> getStudentsInDepartment() {
		return departments;
	}

}
