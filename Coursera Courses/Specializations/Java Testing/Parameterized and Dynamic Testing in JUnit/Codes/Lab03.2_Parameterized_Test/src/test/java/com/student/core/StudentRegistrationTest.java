package com.student.core;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ArgumentsSource;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class StudentRegistrationTest {
	private StudentRegistration studentReg = new StudentRegistration();
	private int stuIdNum = 1;

	@RepeatedTest(value = 11)
	void addStudentValidIdTestPass() {
		try {
			studentReg.addStudent(new Student(stuIdNum,"Micheal","Smith","computer science",5,6,1940));
			stuIdNum += 1000;
			assertTrue(false);
		}catch(InvalidStudentException e) {
			assertTrue(e instanceof InvalidStudentException);
		}
	}
//	@Test
//	void addStudentValidIdTestFail() {
//		try {
//			studentReg.addStudent(new Student(10001,"Micheal","Smith","computer science",5,6,1940));
//			assertTrue(false);
//		}catch(InvalidStudentException e) {
//			assertTrue(e instanceof InvalidStudentException);
//		}
//	}
	@RepeatedTest(value = 2)
	void addStudentDuplicateIdTest() {
		try {
			studentReg.addStudent(new Student(500,"Micheal","Smith","computer science",5,6,1940));
			assertTrue(false);
		}catch(InvalidStudentException e) {
			assertTrue(e instanceof InvalidStudentException);
		}
	}
	
	@ParameterizedTest(name = "AddStudent valid age {0}")
	@ArgumentsSource(StudentArgumentsProvider.class)
	void addStudentValidDOBTest(Student student) {
		try {
			studentReg.addStudent(student);
			assertTrue(false);
		}catch(InvalidStudentException e) {
			assertTrue(e instanceof InvalidStudentException);
		}
	}

	
	
}
