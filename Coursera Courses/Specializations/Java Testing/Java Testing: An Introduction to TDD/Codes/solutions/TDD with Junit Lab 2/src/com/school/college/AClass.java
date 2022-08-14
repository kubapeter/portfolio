package com.school.college;

import java.util.ArrayList;

class AClass {
	
	private String className;
	private ArrayList<Student> students;
	private int classLength;
	
	AClass(String classNameIn, ArrayList<Student> studentsIn, int classLengthIn){
		className = classNameIn;
		students = studentsIn;
		setClassLength(classLengthIn);
	}
	
	boolean addStudent(Student in) {
		boolean added = students.add(in);
		return added;
	}
	
	boolean removeStudent(Student in) {
		boolean added = students.remove(in);
		return added;
	}
	
	String getClassName() {
		return className;
	}
	
	ArrayList<Student> getStudents() {
		return students;
	}
	
	int getClassLength() {
		return classLength;
	}
	
	private void setClassLength(int weeksOfClass) {
		if(weeksOfClass == 3 || weeksOfClass == 4 || weeksOfClass == 6|| weeksOfClass == 8 || weeksOfClass == 12) {
		classLength = weeksOfClass;
		}
	}
}
