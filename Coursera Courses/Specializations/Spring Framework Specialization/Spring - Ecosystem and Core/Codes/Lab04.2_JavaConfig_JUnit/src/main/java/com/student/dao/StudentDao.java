package com.student.dao;

import java.util.Collection;

import com.student.core.Student;

public interface StudentDao {
	
	Student getOne(long id);
	Collection<Student> getAll();
}
