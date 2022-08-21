package com.student.core;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.DynamicTest.dynamicTest;

import java.util.ArrayList;
import java.util.Random;
import java.util.stream.IntStream;
import java.util.stream.Stream;

import org.junit.jupiter.api.DynamicTest;
import org.junit.jupiter.api.RepeatedTest;
import org.junit.jupiter.api.TestFactory;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ArgumentsSource;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class StudentRegistrationTest {
	private StudentRegistration studentReg = new StudentRegistration();

	@TestFactory
	Stream<DynamicTest> addStudentValidIdTestsNoException() {
		return Stream.generate(
				() -> new Student(new Random().nextInt(10000), "Micheal", "Smith", "computer science", 5, 6, 1940))
				.limit(5).map(s -> dynamicTest("student id number dynamic test", () -> {
					try {
						studentReg.addStudent(s);
						assertTrue(true);
					} catch (InvalidStudentException e) {
						assertTrue(!(e instanceof InvalidStudentException));
					}
				}));
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
			studentReg.addStudent(new Student(500, "Micheal", "Smith", "computer science", 5, 6, 1940));
			assertTrue(false, "huh");
		} catch (InvalidStudentException e) {
			assertTrue(e instanceof InvalidStudentException, "Duplicate exception was caught");
		}
	}

	@ParameterizedTest(name = "AddStudent valid age {0}")
	@ArgumentsSource(StudentArgumentsProvider.class)
	void addStudentValidDOBTest(Student student) {
		try {
			studentReg.addStudent(student);
			assertTrue(false);
		} catch (InvalidStudentException e) {
			assertTrue(e instanceof InvalidStudentException);
		}
	}

}
