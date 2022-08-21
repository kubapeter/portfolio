package com.student.core;

import java.time.LocalDate;

public class Main {

	public static void main(String[] args) {
		Student student1, student2, student3 = null;
		StudentRegistration studentRegistration = new StudentRegistration();
		/*try {
			student1 = new Student( 1000, "Tony", "Stark", "engineering", LocalDate.of(2020, 1, 1));
			student2 = new Student( 1000, "Diana", "Prince", "computer science", LocalDate.of(1963, 2, 2));

			studentRegistration.addStudent(student1);
			studentRegistration.addStudent(student2);
		}
		catch (InvalidStudentException e) {
			System.out.println("Handled InvalidStudentException:" + e.getMessage());
		}*/
		student1 = new Student( 1001, "Steve", "Rodgers", "marketing", 1, 31, 2003);
		student1.getCurrentAge();
		student2 = new Student( 1002, "Diana", "Prince", "computer science", 2, 1, 2003);
		student2.getCurrentAge();
		try {
			studentRegistration.addStudent(student1);
			studentRegistration.addStudent(student2);			
		}
		catch (InvalidStudentException e) {
			System.out.println("Handled InvalidStudentException:" + e.getMessage());	
		}
		System.out.println("end of program");
	}

}
