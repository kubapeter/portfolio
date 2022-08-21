package com.student.core;

import java.time.LocalDate;
import java.time.Month;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Student {
	private long id;
	private String firstName;
	private String surname;
	private String dept;
	private long month;
	private long day;
	private long year;
	public Student() {
		super();
	}
	public Student(long id, String firstName, String surname, String dept, long month, long day, long year) {
		super();
		setId(id);
		setFirstName(firstName);
		setSurname(surname);
		setDept(dept);
		setDOB( month, day, year);
	}
	public long getId() {
		return id;
	}
	public ReturnValue setId(long id) {
		if (!isValidId(id)) {
			System.out.println("setId failed");
			this.id = -1;
			return ReturnValue.INVALID;
		}
		this.id = id;
		return ReturnValue.VALID;
	}
	public boolean isValidId(long id) {
		return (id > 0 & id <= 10000) ? true : false;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getDept() {
		return dept;
	}
	public ReturnValue setDept(String dept) { 
		if (!dept.equalsIgnoreCase("engineering") && !dept.equalsIgnoreCase("computer science")) {
			System.out.println("setDept failed");
			this.dept = "UNDEFINED";
			return ReturnValue.INVALID;
		}
		this.dept = dept;
		return ReturnValue.VALID;
	}
	public ReturnValue setDOB(long month, long day, long year)  {
		this.month = month;
		this.day = day;
		this.year = year;
		return new StudentRegistration().checkAge(getDOB());
	}
	public LocalDate getDOB()  {
		return LocalDate.of((int)this.year, (int)this.month, (int)this.day);
	}
	public long getCurrentAge() {
		long age = LocalDate.from(getDOB()).until(LocalDate.now(), ChronoUnit.YEARS);
		System.out.println("getCurrentAge:age="+age);
		return age;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", firstName=" + firstName + ", surname=" + surname + ", dept=" + dept + ", month="
				+ month + ", day=" + day + ", year=" + year + "]";
	}
}
