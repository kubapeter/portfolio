package com.student.service;

import java.util.Collection;

import com.student.core.Student;
import com.student.dao.StudentDao;

public class StudentServiceImpl implements StudentService {
	
	private StudentDao studentDao;

	@Override
	public Student get(long id) {
		return studentDao.getOne(id);
	}

	@Override
	public Collection<Student> getAllStudents() {
		return studentDao.getAll();
	}

}
