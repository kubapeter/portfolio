package com.student.core;

 
public class Student {
  /*
   * TABLE STUDENT
   (
   STUDENTID     BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
   FIRSTNAME    VARCHAR(40) NOT NULL,
   LASTNAME    VARCHAR(10) NOT NULL,
   DEPARTMENT  VARCHAR(10) NOT NULL,
   FEES        DECIMAL(10,2),
   VERSION     BIGINT,
   CONSTRAINT  PK_STUDENT  PRIMARY KEY(STUDENTID)
   );
   */
	 
	private long id;
 
	private String firstName;
	 
	private String surname;
 
	private String dept;
	 
     private Double fees;
	
	public Student() {
		super();
	}
	public Student(String firstName, String surname, String dept, Double fees) {
		super();
		this.firstName = firstName;
		this.surname = surname;
		this.dept = dept;
		this.fees = fees;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public void setDept(String dept) {
		this.dept = dept;
	}
	public Double getFees() {
		return fees;
	}
	public void setFees(Double fees) {
		this.fees = fees;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", firstName=" + firstName + ", surname=" + surname + ", dept=" + dept + ", fees="
				+ fees + "]";
	}
	
	
}
