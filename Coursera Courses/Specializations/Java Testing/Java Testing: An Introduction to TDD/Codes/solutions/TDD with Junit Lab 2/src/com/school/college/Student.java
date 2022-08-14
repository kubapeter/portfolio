package com.school.college;

class Student {
	
	private String name;
	private int age;
	private int yearsStudent;
	private boolean stateRes;
	
	Student(String nameIn,int ageIn,int yearsStuIn,boolean stateResIn){
		name = nameIn;
		age = ageIn;
		yearsStudent = yearsStuIn;
		stateRes = stateResIn;
	}

	String getName() {
		return name;
	}

	void setName(String name) {
		this.name = name;
	}

	int getAge() {
		return age;
	}

	void setAge(int age) {
		this.age = age;
	}

	int getYearsStudent() {
		return yearsStudent;
	}

	void setYearsStudent(int yearsStudent) {
		this.yearsStudent = yearsStudent;
	}

	boolean getStateRes() {
		return stateRes;
	}

	void setStateRes(boolean stateRes) {
		this.stateRes = stateRes;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + ", yearsStudent=" + yearsStudent + ", stateRes=" + stateRes
				+ "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Student other = (Student) obj;
		if (age != other.age)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (stateRes != other.stateRes)
			return false;
		if (yearsStudent != other.yearsStudent)
			return false;
		return true;
	}


	

}
