package com.student.service;

import java.util.Collection;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.beans.factory.annotation.Value;

import com.student.core.Student;
import com.student.dao.StudentDao;
@Named(value = "studentService")
public class StudentServiceImpl implements StudentService {
	@Resource(name = "studentDaoImpl")
	private StudentDao studentDao;
	@Value("2")
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

	public int getNumberOfStudents() {
		return numberOfStudents;
	}

	public void setNumberOfStudents(int numberOfStudents) {
		this.numberOfStudents = numberOfStudents;
	}

}
