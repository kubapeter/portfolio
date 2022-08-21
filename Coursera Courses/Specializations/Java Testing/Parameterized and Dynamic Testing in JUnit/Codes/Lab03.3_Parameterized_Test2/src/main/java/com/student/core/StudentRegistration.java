package com.student.core;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;

public class StudentRegistration {
	private HashMap<Long, Student> students = null;	
	
	public StudentRegistration() {
		students = new HashMap<Long, Student>();	
	}
	public void addStudent( Student student) throws InvalidStudentException {
		long id = student.getId();
		if (student.isValidId( id) == false) {
			throw new InvalidStudentException("student ID out of range");
		}
		if (students.containsKey(id)) {
			throw new InvalidStudentException("student ID duplicate");
		}
		if (checkAge( student.getDOB()) == ReturnValue.INVALID) {
			throw new InvalidStudentException("student minor");
		}
		
		students.put(id, student);
	}
	protected ReturnValue checkAge( LocalDate dob) {
        long age = LocalDate.from(dob).until(LocalDate.now(), ChronoUnit.YEARS);
        if (age < 18) {
        	System.out.println("under 18");
        	return ReturnValue.INVALID;
        }
        else {
        	System.out.println("18+");
        	return ReturnValue.VALID;
        }
	}
	public Student getStudent( long id) throws InvalidStudentException {
		if (!students.containsKey(id)) {
			throw new InvalidStudentException("ID not found");
		}
		return students.get(id);
	}
}
