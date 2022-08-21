package com.student.core;

public interface IStudentRepository {
	public String getFirstName(int id);
	public void setFirstName(int id, String firstName);
	public String getSurname(int id);
	public void setSurname(int id, String surname);
	public String getDept(int id);
	public void setDept(int id, String dept);
	public Double getFees(int id);
	public Student getStudent( int id);
	public void setStudent( int id, Student student);
}